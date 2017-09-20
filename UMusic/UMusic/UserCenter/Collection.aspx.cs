using Admin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UMusic.UserCenter
{
    public partial class Collection : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bind();
            }
        }

        protected void DataPager_PreRender(object sender, EventArgs e)
        {
            bind();
        }
        /// <summary>
        /// 绑定数据
        /// </summary>
        public void bind() {
            string usql = "select userid as userid from tb_user where username = '" + Session["username"].ToString() + "'";
            int userid = int.Parse(SqlHelper.Query(usql).Tables[0].Rows[0]["userid"].ToString());
            string sql = "select tb_album.albumname , tb_album.albumid,tb_album.imagesurl ,tb_artist.artistid,tb_artist.artistname ,tb_collection.userid from tb_album , tb_artist,tb_collection where tb_collection.albumid = tb_album.albumid and tb_album.artistid = tb_artist.artistid and tb_collection.userid="+userid+"";

            lvCollect.DataSource = SqlHelper.Query(sql);
            lvCollect.DataBind();
            if (SqlHelper.Query(sql).Tables[0].Rows.Count < 6)
                DataPager.Visible = false;
        }
        /// <summary>
        /// 删除信息
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lvCollect_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
            int keyid = int.Parse(lvCollect. DataKeys[e.ItemIndex].Value.ToString());
            string sql = "delete from tb_collection where albumid = " + keyid + "";
            if (SqlHelper.ExecuteSql(sql) > 0)
                Response.Write("<script>alert('删除成功');</script>");
            else
                Response.Write("<script>alert('删除失败');</script>");
            bind();
        }
    }
}