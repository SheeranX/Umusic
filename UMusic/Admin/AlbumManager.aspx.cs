using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin
{
    public partial class AlbumManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                listitem();
            }
                
        }
        public void bind(string sql) {
            listAlbum.DataSource = SqlHelper.Query(sql);
            listAlbum.DataBind();
        }

        protected void listAlbum_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            listAlbum.EditIndex = e.NewEditIndex;
            listitem();
        }

        protected void listAlbum_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
            int keyid = int.Parse(listAlbum.DataKeys[e.ItemIndex].Value.ToString());
            string delCol = "delete from tb_collection where albumid ="+keyid+"";
            SqlHelper.ExecuteSql(delCol);
            string delAlbum = "delete from tb_album where albumid="+keyid+"";
            if (SqlHelper.ExecuteSql(delAlbum)>0)
            {
               // Response.Write("<script>alert('删除成功')</script>");
                listitem();
              //  HttpContext.Current.Response.Redirect(HttpContext.Current.Request.Url.AbsolutePath);
            }
        }

        protected void listAlbum_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            if (e.CancelMode == ListViewCancelMode.CancelingEdit)
            {
                listAlbum.EditIndex = -1;
                listitem();
            }
        }

        protected void listAlbum_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            int keyid = int.Parse(listAlbum.DataKeys[e.ItemIndex].Value.ToString());
            TextBox tbprice = (TextBox)listAlbum.Items[e.ItemIndex].FindControl("tbPrice");
            TextBox tbnum = (TextBox)listAlbum.Items[e.ItemIndex].FindControl("tbNum");
            DropDownList ddlstatus = (DropDownList)listAlbum.Items[e.ItemIndex].FindControl("ddlStatus");

           int num  = int.Parse(tbnum.Text);
           double price = double.Parse(tbprice.Text);
           string status = ddlstatus.SelectedItem.Text.ToString();
           string sql = "update tb_album set price=" + price + ",leftnum=" + num + ",status='" + status + "' where albumid=" + keyid + "";
            SqlHelper.ExecuteSql(sql);
            listAlbum.EditIndex = -1;

            listitem();
                
        }

        protected void DataPager_PreRender(object sender, EventArgs e)
        {

            listitem();
        }
        public void listitem() {
            if (Request.QueryString["id"] == null)
            {
                string str = "select * from tb_album";
                bind(str);
            }
            else {
                int id = int.Parse(Request.QueryString["id"]);
                switch (id)
                { 
                    case 1:
                        string sale = "select * from tb_album where status='在售'";
                        bind(sale);
                        break;
                    case 2:
                        string down = "select * from tb_album where status='下架'";
                        bind(down);
                        break;
                    case 3:
                        if (Session["album"] == null || Session["album"].ToString() == "")
                        {
                            string str = "select * from tb_album";
                            bind(str);
                        }
                        else
                        {
                            int albumid = int.Parse(Session["album"].ToString());
                            string sqlstr = "select * from tb_album where albumid =" + albumid + "";
                            bind(sqlstr);
                        }
                        break;
                }
               
            }
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            Session["album"] = search.Text;
        }

        [WebMethod]
        public  string GetAlbumInfo(string albumid) {
            
            //int Id = int.Parse(albumid);
            //string sql = "select * from tb_album where albumid=" + Id + "";
            //DataSet ds = SqlHelper.Query(sql);
            //_albumname.Text = ds.Tables[0].Rows[0]["albumname"].ToString();
            //Session["imagesurl"] = ds.Tables[0].Rows[0]["imagesurl"].ToString();
            return albumid;
        }

        protected void mulDel_Click(object sender, EventArgs e)
        {
           
        }

       
    }
}