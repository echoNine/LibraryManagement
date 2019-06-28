using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Practice6
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string sql1 = "select top 5 * from tb_bookInfo order by borrowSum desc";            //设置SQL语句
            gvBookOrder.DataSource = DataOperate.GetDataset(sql1, "tb_bookInfo");    //获取图书信息数据源
            gvBookOrder.DataBind();

            string sql2 = "select tb_readerInfo.readerBarCode,tb_readerInfo.readerName,count(*) as borrowSum from tb_readerInfo inner join tb_bookBorrow on tb_bookBorrow.readerBarCode = tb_readerInfo.readerBarCode group by tb_readerInfo.readerBarCode,tb_readerInfo.readerName order by count(*) desc";
            gvReaderOrder.DataSource = DataOperate.GetDataset(sql2, "tb_readderInfo");    //获取图书信息数据源
            gvReaderOrder.DataBind();
        }
    }
}