using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Practice6
{
    public partial class AddReaderType : System.Web.UI.Page
    {
        string typeid = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                readerTypeID.Text = Request.QueryString["readerTypeID"].ToString();
                readerTypeName.Text = Request.QueryString["readerTypeName"].ToString();
                num.Text = Request.QueryString["num"].ToString();
            }
            
            typeid = Request.QueryString["readerTypeID"].ToString();
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            string ReaderTypeID = readerTypeID.Text;
            string ReaderTypeName = readerTypeName.Text;
            string Num = num.Text;
            string sql = "";
            if (typeid == "add")
            {
                sql = "insert into tb_readerType values(" + ReaderTypeID + ",'" + ReaderTypeName + "'," + Num + ")";
            }
            else
            {
                sql = "update tb_readerType set readerTypeID=" + ReaderTypeID + ", readerTypeName='" + ReaderTypeName + "',num=" + Num + " where readerTypeID='" + typeid + "'"; ;
            }

            if (DataOperate.ExecSQL(sql))
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('保存成功');window.opener.location.href=window.opener.location='ReaderType.aspx';window.close();</script>");
            }
            else
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('保存失败')</script>");
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            readerTypeID.Text = readerTypeName.Text = num.Text = string.Empty;

        }
    }
}