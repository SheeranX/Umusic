using Admin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UMusic.UserCenter
{
    public partial class changePwd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        /// <summary>
        /// 修改密码
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void updatePwd_Click(object sender, EventArgs e)
        {
            string newpwd = re_pwd.Text;
            string usql = "select userid as userid from tb_user where username = '" + Session["username"].ToString() + "'";
            int userid = int.Parse(SqlHelper.Query(usql).Tables[0].Rows[0]["userid"].ToString());

            string sql = "select password from tb_user where userid = "+userid+"";
            string oldpwd = SqlHelper.Query(sql).Tables[0].Rows[0][0].ToString();
            if (oldpwd.Equals(newpwd))
                Response.Write("<script>alert('不能与原密码相同')</script>");
            else if(oldpwd.Equals(tbpwd.Text)==false){
                Response.Write("<script>alert('原密码错误')</script>");
            }
            else {
                string update = "update tb_user set password = '" + newpwd + "' where userid = " + userid + "";
                SqlHelper.ExecuteSql(update);
                Response.Write("<script>alert('修改成功')</script>");
            }
        }
    }
}