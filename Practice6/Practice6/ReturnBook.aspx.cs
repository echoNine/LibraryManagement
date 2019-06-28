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
    public partial class ReturnBook : System.Web.UI.Page
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
                        string sql = "select * from tb_bookBorrow left join tb_bookInfo on tb_bookBorrow.bookBarCode = tb_bookInfo.bookBarCode left join tb_bookType on tb_bookInfo.bookType = tb_bookType.bookTypeID left join tb_readerInfo on tb_bookBorrow.readerBarCode = tb_readerInfo.readerBarCode where tb_bookBorrow.bookBarCode='" + BookBarCode + "'and tb_bookBorrow.readerBarCode='" + readerBarCode.Text + "'";
                        DataSet ds = DataOperate.GetDataset(sql, "tb_bookBorrow");  //调用公共类中getDataSet方法，将查询结果返回给DataSet对象
                        if (ds.Tables[0].Rows.Count > 0)   //查询结果非空
                        {
                            gvBookReturn.DataSource = ds;              //获取数据源
                            gvBookReturn.DataKeyNames = new string[] { "bookBarCode" };     //设置主键
                            gvBookReturn.DataBind();                  //绑定GridView控件
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
        protected void gvBookReturn_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            string BookBarCode = gvBookReturn.DataKeys[e.NewSelectedIndex].Value.ToString();  //获取选中图书条形码
            DateTime ReturnDate = Convert.ToDateTime(gvBookReturn.Rows[e.NewSelectedIndex].Cells[4].Text);  //获取应还日期
            DateTime TodayDate = DateTime.Now.Date;   //获取当前日期
            TimeSpan ts = TodayDate - ReturnDate;        //计算超期天数
            int daysDate = ts.Days;
            //计算租金和滞纳金
            string strLagMoney = gvBookReturn.Rows[e.NewSelectedIndex].Cells[7].Text;
            int LagMoney = Convert.ToInt32(strLagMoney.Substring(0, strLagMoney.Length));
            string strHire = gvBookReturn.Rows[e.NewSelectedIndex].Cells[6].Text;
            int Hire = Convert.ToInt32(strHire.Substring(0, strHire.Length));
            string hint = "";
            string[] sqlT;
            int i = 0;
            if (daysDate > 0)   //存在超期情况
            {
                sqlT = new string[3];
                //更新读者余额
                sqlT[i++] = "update tb_readerInfo set money=money - " + LagMoney * daysDate + " where readerBarCode = '" + readerBarCode.Text + "' ";
                hint = "您的图书归还期已过" + daysDate + "天，将扣除滞纳金" + LagMoney * daysDate + "元。";
            }
            else  //存在超期情况
            {
                sqlT = new string[3];
                //更新读者余额
                sqlT[i++] = "update tb_readerInfo set money=money + " + Hire + " where readerBarCode = '" + readerBarCode.Text + "' ";
            }
            //定义SQL语句，更新图书库存数
            sqlT[i++] = "update tb_bookInfo set stock=stock+1 where bookBarCode='" + BookBarCode + "'"; 
            //定义SQL语句，删除借书记录
            sqlT[i] = "delete tb_bookBorrow where bookBarCode='" + BookBarCode + "' and  readerBarCode='" + readerBarCode.Text + "' ";
            //调用公共类中的execTransaction方法执行事务
            if (DataOperate.ExecTransaction(sqlT)) //事务执行成功
            {
                bindReaderInfo();              //重新绑定读者信息
                gvBookReturn.DataSource = null;  //将数据源设置为空
                gvBookReturn.DataBind();       //重新绑定数据
                bookBarCode.Text = "";        //将图书条形码文本框清空
                //调用自定义方法显示已借阅未归还图书信息
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('图书归还成功！" + hint + "')</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('图书归还失败！')</script>");
            }
        }
    }
}