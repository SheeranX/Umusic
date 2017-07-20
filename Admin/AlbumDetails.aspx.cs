using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin
{
    public partial class AlbumDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                int albumid = int.Parse(Request.QueryString["aid"]);
                string sql = "select * from tb_album where albumid = " + albumid + "";
                dvAlbum.DataSource = SqlHelper.Query(sql);
                dvAlbum.DataBind();
            }
           
        }
    }
}