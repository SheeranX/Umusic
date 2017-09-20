using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Admin
{
    public partial class CheckUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string str = "select * from tb_user";

            DataSet  ds=SqlHelper.Query(str);
            listUser.DataSource = ds;
            listUser.DataBind();

        }
    }
}