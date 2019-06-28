using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Practice6
{
    public partial class BorrowBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public void bindReaderInfo()
        {
            string ReaderBarCode = readerBarCode.Text;            //获取读者编号
            string readerSql = "select * from tb_readerInfo where readerBarCode='" + ReaderBarCode + "'";  //定义查询读者语句
            SqlDataReader sdr = DataOperate.GetRow(readerSql);        //获取读者详细信息
            if (sdr.Read())    //读取一条记录
            {
                readerName.Text = sdr["readerName"].ToString();          //显示读者姓名
                sex.Text = sdr["sex"].ToString();                  //显示读者性别
                certificateType.Text = sdr["certificateType"].ToString();     //显示证件类型
                certificateID.Text = sdr["certificateID"].ToString();             //显示证件号
                string Money = sdr["money"].ToString();
                money.Text = Money.Substring(0, Money.Length - 2);        //可用余额

                //创建SQL语句在读者类型表中查询符合读者类型编号的记录
                string readerTypeSql = "select * from tb_readerType where readerTypeId=" + sdr["readerType"].ToString();
                SqlDataReader typeSdr = DataOperate.GetRow(readerTypeSql);  //获取读者类型信息
                typeSdr.Read();                                             //读取一条记录
                readerType.Text = typeSdr["readerTypeName"].ToString();            //显示读者类型

                int Num = Convert.ToInt32(typeSdr["num"]);           //获取可借图书总数                                                                           //创建SQL语句在图书借阅表中查询符合读者编号条件的读者已借未还图书数
                string selSql = "select count(*) from tb_bookBorrow where readerBarCode='" + ReaderBarCode + "' ";
                int alreadyNum = DataOperate.SeleSQL(selSql);                //获取图书已借未还数
                borrowCount.Text = Convert.ToString(Num - alreadyNum);     //显示还可以借阅数
                findbook.Enabled = true;
            }
            else
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('读者编号输入错误!')</script>");
        }

        protected void btnReaderSearch_Click(object sender, EventArgs e)
        {
            bindReaderInfo();
        }

        protected void btnBookSearch_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(borrowCount.Text.Trim()) > 0)                //判断读者是否还可以借书        
            {
                if (bookBarCode.Text.Trim() != "")                    //判断图书条形码是否为空
                {
                    string BookBarCode = bookBarCode.Text;         //获取图书条形码
                    string sql = "select * from tb_bookInfo where bookBarCode='" + BookBarCode + "'"; //定义查询图书语句
                    DataSet ds = DataOperate.GetDataset(sql, "tb_bookInfo");    //调用公共类中getDataSet方法，将查询结果返回给DataSet对象
                    if (ds.Tables[0].Rows.Count > 0)   //查询结果非空
                    {
                        gvBookBorrow.DataSource = ds;              //获取数据源
                        gvBookBorrow.DataKeyNames = new string[] { "bookBarCode" };     //设置主键
                        gvBookBorrow.DataBind();                  //绑定GridView控件
                    }
                    else
                        ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('图书条形码错误！')</script>");
                }
                else
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('图书条形码不能为空！')</script>");
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('借阅数量已满！不可以再借阅！')</script>");
            }
        }

        protected void gvBookBorrow_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            string BookBarCode = gvBookBorrow.DataKeys[e.NewSelectedIndex].Value.ToString();    //获取选中图书的条形码
                                                                                                //定义查询语句，查询指定图书条形码的图书信息
            string sql = "select * from tb_bookInfo as a inner join tb_bookType as b on a.bookType=b.bookTypeID where a.bookBarCode='" + BookBarCode + "'";
            SqlDataReader sdr = DataOperate.GetRow(sql);         //获取图书信息
            sdr.Read();        //读取一条记录
            if (Convert.ToInt32(sdr["stock"]) > 0)           //判断图书是否还有库存
            {
                float Money = Convert.ToSingle(money.Text);     //读者余额
                float Hire = Convert.ToSingle(sdr["hire"].ToString());   //读书租金
                if (Money > Hire)           //读者余额大于该读书租金
                {
                    string sqlBookBorrow = "select count(*) from tb_bookBorrow where bookBarcode='" + bookBarCode.Text + "' and readerBarCode='" + readerBarCode.Text + "' ";  //定义查询语句，查询该读者是否借阅此书
                    if (DataOperate.SeleSQL(sqlBookBorrow) == 0)  //调用公共类中seleSQL方法，指定数据不存在（读者当前未借此书）
                    {
                        int BorrowDay = Convert.ToInt32(sdr["borrowDay"]);              //获取借阅天数
                        string BorrowTime = DateTime.Now.Date.ToShortDateString();      //获取借阅日期
                        string ReaderBarCode = readerBarCode.Text;                   //获取读者编号
                        string BorrowOperator = Session["userName"].ToString();             //获取借阅经办人
                        string ReturnTime = DateTime.Now.Date.AddDays(BorrowDay).ToShortDateString();  //获取应还日期
                        string[] sqlT = new string[3];                //设置SQL语句数组
                                                                      //定义SQL语句，将图书借阅信息插入到图书借阅表中
                        sqlT[0] = "insert tb_bookBorrow values('" + BookBarCode + "','" + ReaderBarCode + "','" + BorrowTime + "','" + BorrowOperator + "','" + ReturnTime + "')";
                        //定义SQL语句，更新图的借阅次数和图书的库存数据
                        sqlT[1] = "update tb_bookInfo set borrowSum=borrowSum+1,stock=stock-1 where bookBarCode='" + BookBarCode + "'";
                        //定义SQL语句，更新读者的可用余额
                        sqlT[2] = "update tb_readerInfo set money=money-" + Hire + " where readerBarCode='" + ReaderBarCode + "'";
                        //调用公共类中的execTransaction方法执行事务
                        if (DataOperate.ExecTransaction(sqlT))   //事务执行成功
                        {
                            bindReaderInfo();               //重新绑定读者信息
                            gvBookBorrow.DataSource = null;  //将数据源设置为空
                            gvBookBorrow.DataBind();       //重新绑定数据
                            bookBarCode.Text = "";        //将图书条形码文本框清空
                            ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('借阅成功！')</script>");
                        }
                        else { ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('借阅失败！')</script>"); }
                    }
                    else { ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('该读者已经借阅此图书，不可以再借阅！')</script>"); }
                }
                else { ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('读者金额不足，不可以借阅图书！')</script>"); }
            }
            else { ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('图书已没有库存，不可以借阅！')</script>"); }
        }
    }
}