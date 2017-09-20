using Admin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UMusic.UserCenter
{
    public partial class personInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          if(!IsPostBack)
            bind();
        }
        public void bind() {
            string usql = "select userid as userid from tb_user where username = '" + Session["username"].ToString() + "'";
            int userid = int.Parse(SqlHelper.Query(usql).Tables[0].Rows[0]["userid"].ToString());
            string sql = "select * from tb_user where userid="+userid+"";
            string sqld = "select * from tb_userdetails where userid ="+userid+"";
            lvuser.DataSource = SqlHelper.Query(sql);
            lvuser.DataBind();

            lvdetails.DataSource = SqlHelper.Query(sqld);
            lvdetails.DataBind();
        }

        protected void lvdetails_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            lvdetails.EditIndex = e.NewEditIndex;
            bind();
        }

        protected void lvdetails_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            if (e.CancelMode == ListViewCancelMode.CancelingEdit)
            {
                lvdetails.EditIndex = -1;
                bind();
                // HttpContext.Current.Response.Redirect(HttpContext.Current.Request.Url.AbsolutePath);
            }
        }

        protected void lvdetails_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            int keyid = int.Parse(lvdetails.DataKeys[e.ItemIndex].Value.ToString());
            TextBox birthday = (TextBox)lvdetails.Items[e.ItemIndex].FindControl("tbBirthday");
            TextBox nickname = (TextBox)lvdetails.Items[e.ItemIndex].FindControl("tbnickname");
            TextBox local = (TextBox)lvdetails.Items[e.ItemIndex].FindControl("tblocal");
            string update = "update tb_Userdetails set birthday ='" + birthday.Text + "',nickname='" + nickname.Text + "',location='" + local.Text + "' where userid=20170101";
            SqlHelper.ExecuteSql(update);
            lvdetails.EditIndex = -1;
            bind();
        }

        [WebMethod]
        public static string valpwd(string str) {
            //string sql = "select password from tb_user where username ='edsheeran'";
            //string pwd = SqlHelper.Query(sql).Tables[0].Rows[0][0].ToString();
            //if (pwd.Equals(str))
            //    return "true";
            //else
            //    return "false";
            return str;
        }

        protected void btnchangep_Click(object sender, EventArgs e)
        {
            string old = tboldphone.Text;
            string newp = tbnewpwd.Text;

            string usql = "select userid as userid from tb_user where username = '" + Session["username"].ToString() + "'";
            int userid = int.Parse(SqlHelper.Query(usql).Tables[0].Rows[0]["userid"].ToString());

            string sql = "select phone from tb_user where userid = " + userid + "";
            string oldphone = SqlHelper.Query(sql).Tables[0].Rows[0][0].ToString();

            if(old.Equals(oldphone)==false)
                Response.Write("<script>alert('原手机号错误')</script>");
            else if (old.Equals(newp))
            {
                Response.Write("<script>alert('与原手机号相同')</script>");
            }
            else {
                string update = "update tb_user set phone = '" + newp + "' where userid = " + userid + "";
                SqlHelper.ExecuteSql(update);
                Response.Redirect("/UserCenter/personInfo.aspx");
            }
        }

        protected void btnchangeemail_Click(object sender, EventArgs e)
        {
            string old = tboldemail.Text;
            string newe = tbnewemail.Text;

            string usql = "select userid as userid from tb_user where username = '" + Session["username"].ToString() + "'";
            int userid = int.Parse(SqlHelper.Query(usql).Tables[0].Rows[0]["userid"].ToString());

            string sql = "select email from tb_user where userid = " + userid + "";
            string oldemail = SqlHelper.Query(sql).Tables[0].Rows[0][0].ToString();

            if (old.Equals(oldemail) == false)
                Response.Write("<script>alert('旧邮箱错误')</script>");
            else if (old.Equals(newe))
            {
                Response.Write("<script>alert('与旧邮箱相同')</script>");
            }
            else
            {
                string update = "update tb_user set email = '" + newe + "' where userid = " + userid + "";
                SqlHelper.ExecuteSql(update);
                //Response.Write("<script>alert('修改成功')</script>");
                Response.Redirect("/UserCenter/personInfo.aspx");
            }
        }

    }
}