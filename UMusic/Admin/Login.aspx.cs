using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = adminname.Text;
            string pwd = password.Text;
            string sql = "select password as password from tb_admin where adminname='"+username+"'";
            DataSet ds = SqlHelper.Query(sql);
            if (ds.Tables[0].Rows[0]["password"].Equals(pwd))
            {
                Session["username"] = username;
                Response.Redirect("Admin.aspx");
            }
               
            else
            {
                Response.Write("<script>alert('用户名或密码错误')</script>");
            }
        }

    }
}