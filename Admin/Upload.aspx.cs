using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin
{
    public partial class Upload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string albumid = "select max(albumid) as maxid from tb_album";
            DataSet ds = SqlHelper.Query(albumid);
            int id =int.Parse(ds.Tables[0].Rows[0]["maxid"].ToString());

            albumID.Text = (id+1).ToString();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string albumname = albumName.Text;
            int genreid =int.Parse( ddlGenreID.SelectedValue);
            int artistid = int.Parse(ddlArtist.SelectedValue);
            int localid = int.Parse(ddlLocalID.SelectedValue);
            int storage = int.Parse(tbstorage.Text);
            double price = double.Parse(tbPrice.Text);
            string url = "~/images/album/" + FileUpload.PostedFile.FileName;
            string adddate = addDate.Text;
            string relasedate = realseDate.Text;
            string status = "在售";
            string description = tbdes.Text;

            string sql = "insert into tb_album values('" + albumname + "'," + genreid + "," + artistid + "," + localid + ",'" + adddate + "'," + price + ",'" + url + "','" + status + "'," + storage + ",'" + description + "','" + relasedate + "')";
            if (SqlHelper.ExecuteSql(sql) > 0) {
                Response.Write("<script>alert('添加成功')</script>");
                //HttpContext.Current.Response.Redirect(HttpContext.Current.Request.Url.AbsolutePath);
            }
          
        }
    }
}