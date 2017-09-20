using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin
{
    public partial class Advise : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string sql = "select * from tb_advice";
            listAdvice.DataSource = SqlHelper.Query(sql);
            listAdvice.DataBind();
        }
    }
}