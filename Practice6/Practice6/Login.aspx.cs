using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Practice6
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Determine_Click(object sender, EventArgs e)
        {
            string username = user_name.Text;    //用户名
            string pwd = password.Text;     //密码
            Session["entryType"] = radio.SelectedValue;    //记录登录用户的类型
            string cs = Session["entryType"].ToString();
            string sql;
            if (cs == "读者")   //用户类型为读者，到读者信息表查询指定用户名和密码的记录
            {
                sql = "select count(*) from tb_readerInfo where readerName=@name and  readerPassword=@pass ";
            }
            else    //用户类型为管理员，到管理员信息表查询指定用户名和密码的记录
            {
                sql = "select count(*) from tb_user where userName=@name  and  userPwd=@pass ";
            }
            //调用用户名和密码验证函数
            if (CheckPwd(sql, username, pwd))     //验证成功
            {
                Session["userName"] = username;  //记录登录用户名
                Session["passWord"] = pwd;
                Response.Redirect("index.aspx");   //导航到系统首页
            }
            else    //验证失败
            {
                Response.Write("<script>alert('登录失败！')</script>");
            }
        }

        public static bool CheckPwd(string sql, string name, string pass)
        {
            SqlConnection con = DataOperate.CreateCon();         //创建数据库连接
            con.Open();         //打开数据库连接
            SqlCommand com = new SqlCommand(sql, con);        //创建SqlCommand对象
            com.Parameters.Add(new SqlParameter("name", SqlDbType.VarChar, 50));        //设置参数类型
            com.Parameters["name"].Value = name;        //设置参数值
            com.Parameters.Add(new SqlParameter("pass", SqlDbType.VarChar, 50));       //设置参数类型
            com.Parameters["pass"].Value = pass;        //设置参数值
                                                        //判断验证用户名和密码是否正确，并返回布尔值
            if (Convert.ToInt32(com.ExecuteScalar()) > 0)   //返回指定用户名和密码的记录数大于0，此用户名和密码正确。
            {
                con.Close();
                return true;
            }
            else
            {
                con.Close();
                return false;
            }
        }
    }
}