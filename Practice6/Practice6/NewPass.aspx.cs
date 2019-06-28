using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Practice6
{
    public partial class NewPass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            useName.Text = Session["userName"].ToString();
        }

        protected void update_Click(object sender, EventArgs e)
        {
            if (Session["entryType"].ToString() == "读者")
            {
                string sql = "select * from tb_readerInfo where readerName='" + Session["userName"].ToString() + "'";
                SqlDataReader sdr = DataOperate.GetRow(sql);
                sdr.Read();
                if (pwd.Text == sdr["readerPassword"].ToString())
                {
                    string upSql = "update tb_readerInfo set readerPassword='" + newPwd.Text + "' where readerName='" + Session["userName"].ToString() + "'";
                    if (DataOperate.ExecSQL(upSql))
                    {
                        ClientScript.RegisterStartupScript(GetType(), "Message", "<script>alert('密码修改成功！');window.location='Login.aspx';</script>");
                    }
                    else
                        Response.Write("<script>alert('更新失败！')</script>");
                }
                else
                    Response.Write("<script>alert('原始密码输入错误')</script>");
            }
            else
            {
                string sql = "select * from tb_user where userName='" + Session["userName"].ToString() + "'";
                SqlDataReader sdr = DataOperate.GetRow(sql);
                sdr.Read();
                if (pwd.Text == sdr["userPwd"].ToString())
                {
                    string upSql = "update tb_user set userPwd='" + newPwd.Text + "' where userName='" + Session["userName"].ToString() + "'";
                    if (DataOperate.ExecSQL(upSql))
                    {
                        ClientScript.RegisterStartupScript(GetType(), "Message", "<script>alert('密码修改成功');window.location='Login.aspx';</script>");
                    }
                    else
                        Response.Write("<script>alert('更新失败！')</script>");
                }
                else
                    Response.Write("<script>alert('原始密码输入错误')</script>");
            }

        }
    }
}