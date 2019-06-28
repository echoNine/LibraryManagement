using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Practice6
{
    public partial class BookInfoSearch : System.Web.UI.Page
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
                    sql = "select * from tb_bookInfo where bookBarCode like " + target.Text;
                    break;
                case 1:
                    sql = "select * from tb_bookInfo where bookName like '" + target.Text+"'";
                    break;
                case 2:
                    sql = "select * from tb_bookInfo where bookType like " + target.Text;
                    break;
                case 3:
                    sql = "select * from tb_bookInfo where bookCase like '" + target.Text + "'";
                    break;
                case 4:
                    sql = "select * from tb_bookInfo where author like '" + target.Text + "'";
                    break;
            }
            gvBookInfo.DataSource = DataOperate.GetDataset(sql, "tb_bookInfo");
            gvBookInfo.DataKeyNames = new string[] { "bookBarCode" };
            gvBookInfo.DataBind();
        }
    }
}