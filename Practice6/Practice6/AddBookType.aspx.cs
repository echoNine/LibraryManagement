using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Practice6
{
    public partial class AddBookType : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string BookTypeID = bookTypeID.Text;
            string BookTypeName = bookTypeName.Text;
            string BorrowDay = borrowDay.Text;
            string Hire = hire.Text;
            string LagMoney = lagMoney.Text;
            string sql = "insert into tb_bookType values(" + BookTypeID + ",'" + BookTypeName + "'," + BorrowDay + "," + Hire + "," + LagMoney + ")";
            if (DataOperate.ExecSQL(sql))
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('保存成功');window.opener.location.href=window.opener.location='BookType.aspx';window.close();</script>");
            }
            else
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('保存失败')</script>");
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            bookTypeID.Text = bookTypeName.Text = borrowDay.Text = hire.Text = lagMoney.Text = string.Empty;

        }
    }
}