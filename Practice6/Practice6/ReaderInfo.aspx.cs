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
    public partial class ReaderInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bindReaderInfo();
        }
  
        public void bindReaderInfo()
        {
            string sql = "select * from tb_readerInfo";
            gvReaderInfo.DataSource = DataOperate.GetDataset(sql, "tb_readerInfo");
            gvReaderInfo.DataKeyNames = new string[] { "readerBarCode" };
            gvReaderInfo.DataBind();
        }

        protected void gvReaderInfo_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = gvReaderInfo.DataKeys[e.RowIndex].Value.ToString();   //获取读者编号
            string sqlSel = "select count(*) from tb_bookBorrow where readerBarcode='" + id + "'";
            //调用公共类中判断指定数据是否存在的方法函数seleSQL，判断该读者是否有未归还图书
            if (DataOperate.SeleSQL(sqlSel) > 0)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('不可以删除该读者，该读者图书还未归还')</script>"); //提示有未还图书，不能删除。
            }
            else
            {
                string sqlDel = "delete tb_readerInfo where readerBarCode='" + id + "'";
                DataOperate.ExecSQL(sqlDel);  //调用公共类中通用数据更新、插入和删除操作方法函数execSQL，删除此读者。 
                bindReaderInfo();
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('删除成功')</script>");
            }
        }
    }
}