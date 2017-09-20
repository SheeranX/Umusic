using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
                Response.Redirect("Login.aspx");
        }

        protected void loginOut_Click(object sender, EventArgs e)
        {
            Session.Remove("username");
            Response.Redirect("Login.aspx");
        }
    }
}