using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Practice6
{
    public partial class AddBook : System.Web.UI.Page
    {
        string barcode = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            barcode = Request.QueryString["bookBarCode"].ToString();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string BookBarcode = bookBarCode.Text;                   //获取图书条形码信息
            string BookName = bookName.Text;                     //获取图书名称信息
            string BookType = bookType.SelectedValue;            //获取图书类型信息
            string BookCase = bookCase.SelectedValue;            //获取书架信息
            string Author = author.Text;                         //获取图书作者信息
            string Price = price.Text;                           //获取图书价格信息
            string Stock = stock.Text;
            string BorrowSum = borrowSum.Text;
            string Operator = Session["userName"].ToString();
            string sql = "";
            if (barcode == "add")
            {
                sql = "insert into tb_bookInfo values('" + BookBarcode + "','" + BookName + "'," + BookType + ",'" + BookCase + "','" + Author + "'," + Price + ",'" + Stock + "'," + BorrowSum + ",'" + Operator + "')";
            }
            else
            {
                sql = "update tb_bookInfo set bookName='" + BookName + "', bookType='" + BookType + "',bookCase='" + BookCase + "', author='" + Author + "',price='" + Price + "',stock='" + Stock + "',borrowSum='" + BorrowSum + "', operator='" + Operator + "'where bookBarCode='" + barcode + "'";
            }

            if (DataOperate.ExecSQL(sql))
            {
                Response.Write("<script language=javascript>alert('保存成功！');window.opener.location.href=window.opener.location='BookInfo.aspx';window.close();</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('保存失败！')</script>");
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            bookBarCode.Text = bookName.Text = bookType.SelectedValue = bookCase.SelectedValue = author.Text = price.Text = string.Empty;
        }
    }
}