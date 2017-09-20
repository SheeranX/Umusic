using Admin;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UMusic.Models;

namespace UMusic.UserCenter
{
    public partial class OrderManager : System.Web.UI.Page
    {
        UMusicEntities musicDB = new UMusicEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                bind();
        }
        public void bind()
        {
            string usql = "select userid as userid from tb_user where username = '"+Session["username"].ToString()+"'";
            int userid =int.Parse(SqlHelper.Query(usql).Tables[0].Rows[0]["userid"].ToString());
            string sql = "select tb_album.albumid,tb_album.imagesUrl,tb_album.albumname,tb_artist.artistName,tb_genre.genreName,tb_Orderdetails.OrderID,tb_orderdetails.quantity,tb_orderdetails.unitprice,tb_Order.orderdate,tb_User.userid,tb_Order.OrderStatus from tb_album,tb_artist,tb_genre,tb_Orderdetails,tb_Order,tb_User where tb_orderdetails.albumid=tb_album.albumid and tb_album.genreid = tb_genre.genreid and tb_album.artistid=tb_artist.artistid and tb_order.orderid=tb_orderdetails.orderid and tb_user.userid = tb_order.userid and tb_order.userid = "+userid+"";
            listOrder.DataSource=SqlHelper.Query(sql);
            listOrder.DataBind();
        }

        protected void listOrder_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
            int keyid = int.Parse(listOrder.DataKeys[e.ItemIndex].Value.ToString());
            string sql = "delete from tb_orderdetails where orderid = " + keyid + "";
            if (SqlHelper.ExecuteSql(sql) > 0)
                Response.Write("<script>alert('删除成功');</script>");
            else
                Response.Write("<script>alert('删除失败');</script>");
            string osql = "delete from tb_order where orderid =" + keyid + "";
            SqlHelper.ExecuteSql(osql);
            bind();
        }

        protected void DataPager_PreRender(object sender, EventArgs e)
        {
            bind();
        }

    }
}