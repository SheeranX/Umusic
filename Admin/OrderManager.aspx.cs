using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin
{
    public partial class OrderManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if(!IsPostBack)
            //    bind();
        }
        //数据绑定
        public void bind(string sql) {
                DataSet ds = SqlHelper.Query(sql);
                listOrder.DataSource = ds;
                listOrder.DataBind();      
        }
        public void listItem()
        {
            if (Request.QueryString["id"] == null)
            {
                string sql = "select * from tb_order";
                bind(sql);
            }
            else
            {
                int status = int.Parse(Request.QueryString["id"].ToString());
                switch (status)
                {
                    case 1:
                        string payed = "select * from tb_order where orderstatus='已付款'";
                        bind(payed);
                        break;
                    case 2:
                        string paying = "select * from tb_order where orderstatus ='未付款'";
                        bind(paying);
                        break;
                    case 3:
                        string sended = "select * from tb_order where orderstatus ='已发货'";
                        bind(sended);
                        break;
                    case 4:
                        if (Session["search"] == null||Session["search"].ToString()=="")
                        {
                            string sql = "select * from tb_order";
                            bind(sql);
                        }
                        else {
                            int orderid = int.Parse(Session["search"].ToString());
                            string search = "select * from tb_order where orderid = " + orderid + "";
                            bind(search);
                        }
                        break;
                        
                }
            }
        }
        //删除操作
        protected void listOrder_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
            int keyid = int.Parse(listOrder.DataKeys[e.ItemIndex].Value.ToString());
            string sql = "delete from tb_orderdetails where orderid = "+keyid+"";
            if (SqlHelper.ExecuteSql(sql)>0)
              Response.Write("<script>alert('删除成功');</script>");
            else
              Response.Write("<script>alert('删除失败');</script>");
            string osql = "delete from tb_order where orderid ="+keyid+"";
            SqlHelper.ExecuteSql(osql);
            listItem();
        }
        //编辑状态
        protected void listOrder_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            //ListViewItem item = listOrder.Items[e.NewEditIndex];
            listOrder.EditIndex = e.NewEditIndex;
            listItem();
            //HttpContext.Current.Response.Redirect(HttpContext.Current.Request.Url.AbsolutePath);
        }
        //编辑状态下点击取消按钮时
        protected void listOrder_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            if (e.CancelMode == ListViewCancelMode.CancelingEdit)
            {
                listOrder.EditIndex = -1;
                listItem();
               // HttpContext.Current.Response.Redirect(HttpContext.Current.Request.Url.AbsolutePath);
            }
        }
        //数据更新操作
        protected void listOrder_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            int keyid = int.Parse(listOrder.DataKeys[e.ItemIndex].Value.ToString());
           // TextBox tbstatus = (TextBox)listOrder.Items[e.ItemIndex].FindControl("tbStatus");
            DropDownList ddList = (DropDownList)listOrder.Items[e.ItemIndex].FindControl("ddStatus");
            if (string.IsNullOrEmpty(ddList.SelectedItem.Text))
                Response.Write("<script>alert('状态不能为空')</script>");
            else {
                string update = "update tb_order set orderstatus ='" + ddList.SelectedItem.Text + "' where orderid = " + keyid + "";
                if (SqlHelper.ExecuteSql(update) > 0)
                {
                    listOrder.EditIndex = -1;
                    listItem();
                }
                else
                    Response.Write("<script>alert('更新失败')</script>");
            }
         
           

        }
       
        protected void DataPagerOrder_PreRender(object sender, EventArgs e)
        {
            listItem();
        }

        protected void lbsearch_Click(object sender, EventArgs e)
        {
            Session["search"] = tbSearch.Text;
        }





      

    }
}