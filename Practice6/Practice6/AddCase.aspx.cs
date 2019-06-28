using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Practice6
{
    public partial class AddCase : System.Web.UI.Page
    {
        string caseId = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            caseId = Request.QueryString["bookcaseID"].ToString();
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            string BookcaseID = bookcaseID.Text;
            string BookcaseName = bookcaseName.Text;
            string sql = "";
            if (caseId == "add")
            {
                sql = "insert into tb_bookCase values(" + BookcaseID + ",'" + BookcaseName + "')";
            }
            else
            {
                sql = "update tb_bookCase set bookcaseID=" + BookcaseID + ", bookcaseName='" + BookcaseName + "' where bookcaseID='" + caseId + "'";
            }

            if (DataOperate.ExecSQL(sql))
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('保存成功');window.opener.location.href=window.opener.location='BookCase.aspx';window.close();</script>");
            }
            else
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('保存失败')</script>");
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            bookcaseID.Text = bookcaseName.Text = string.Empty;

        }
    }
}