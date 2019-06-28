using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Practice6
{
    public partial class BookCase : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bindBookCase();
            
        }

        public void bindBookCase()
        {
            string sql = "select * from tb_bookCase";
            gvBookCase.DataSource = DataOperate.GetDataset(sql, "tb_bookCase");
            gvBookCase.DataKeyNames = new string[] { "bookcaseID" };
            gvBookCase.DataBind();
        }

        protected void gvBookCase_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = gvBookCase.DataKeys[e.RowIndex].Value.ToString();
            string sqlDel = "delete tb_bookCase where bookcaseID='" + id + "'";
            DataOperate.ExecSQL(sqlDel);  //调用公共类中通用数据更新、插入和删除操作方法函数execSQL，删除此读者。 
            bindBookCase();
            ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('删除成功')</script>");
        }
    }
}