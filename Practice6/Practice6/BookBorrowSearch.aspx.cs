using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Practice6
{
    public partial class BookBorrowSearch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string sql = "";
            int item = searchItem.SelectedIndex;
            switch (item)
            {
                case 0:
                    sql = "select * from tb_bookBorrow left join tb_readerInfo on tb_bookBorrow.readerBarCode = tb_readerInfo.readerBarCode left join tb_bookInfo on tb_bookBorrow.bookBarCode = tb_bookInfo.bookBarCode where tb_bookBorrow.bookBarCode like '" + target.Text + "'";
                    break;
                case 1:
                    sql = "select * from tb_bookBorrow left join tb_readerInfo on tb_bookBorrow.readerBarCode = tb_readerInfo.readerBarCode left join tb_bookInfo on tb_bookBorrow.bookBarCode = tb_bookInfo.bookBarCode where tb_bookInfo.bookName like '" + target.Text + "'";
                    break;
                case 2:
                    sql = "select * from tb_bookBorrow left join tb_readerInfo on tb_bookBorrow.readerBarCode = tb_readerInfo.readerBarCode left join tb_bookInfo on tb_bookBorrow.bookBarCode = tb_bookInfo.bookBarCode where tb_bookBorrow.readerBarCode like '" + target.Text + "'";
                    break;
                case 3:
                    sql = "select * from tb_bookBorrow left join tb_readerInfo on tb_bookBorrow.readerBarCode = tb_readerInfo.readerBarCode left join tb_bookInfo on tb_bookBorrow.bookBarCode = tb_bookInfo.bookBarCode where tb_readerInfo.readerName like '" + target.Text + "'";
                    break;
            }
            gvBorrowInfo.DataSource = DataOperate.GetDataset(sql, "tb_bookBorrow");
            gvBorrowInfo.DataKeyNames = new string[] { "bookBarCode" };
            gvBorrowInfo.DataBind();
        }
    }
}