using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Practice6
{
    public partial class ReaderType : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bindReaderType();
        }

        public void bindReaderType()
        {
            string sql = "select * from tb_readerType";
            gvReaderType.DataSource = DataOperate.GetDataset(sql, "tb_readerType");
            gvReaderType.DataKeyNames = new string[] { "readerTypeID" };
            gvReaderType.DataBind();
        }

        protected void gvReaderType_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = gvReaderType.DataKeys[e.RowIndex].Value.ToString();
            string sqlDel = "delete tb_readerType where readerTypeID='" + id + "'";
            DataOperate.ExecSQL(sqlDel);  //调用公共类中通用数据更新、插入和删除操作方法函数execSQL，删除此读者。 
            bindReaderType();
            ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('删除成功')</script>");
        }
    }
}