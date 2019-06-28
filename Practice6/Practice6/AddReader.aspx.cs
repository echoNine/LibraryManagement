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
    public partial class AddReader : System.Web.UI.Page
    {
        string barcode = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            barcode = Request.QueryString["readerBarCode"].ToString();
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            string ReaderBarCode = readerBarCode.Text;      //读者编号
            string ReaderPassword = readerPassword.Text;                   //登录密码
            string ReaderName = readerName.Text;           //读者名称
            string Sex = sex.SelectedValue;                              //性别
            string ReaderType = readerType.SelectedValue;    //读者类型
            string CertificateType = certificateType.SelectedValue;  //证书类型
            string CertificateID = certificateID.Text;               //证书编号
            string Tel = tel.Text;                           //联系电话
            string Email = email.Text;                      //Email地址
            string Remark = remark.InnerText;                   //备注
            double Addmoney;                                   //增加余额
            if (addMoney.Text == "") Addmoney = 0;
            else Addmoney = Convert.ToDouble(addMoney.Text);
            string Operator = Session["userName"].ToString();
            string sql = "";
            if (barcode == "add")
            {
                sql = "insert into tb_readerInfo(readerBarCode,readerPassword,readerName,sex,readerType,certificateType,certificateID,tel,email,remark,money,Operator) values('" + ReaderBarCode + "','" + ReaderPassword + "','" + ReaderName + "','" + Sex + "','" + ReaderType + "','" + CertificateType + "','" + CertificateID + "','" + Tel + "','" + Email + "','" + Remark + "'," + Addmoney + ",'" + Operator + "')";
            }
            else
            {
                sql = "update tb_readerInfo set readerName='" + ReaderName + "', sex='" + Sex + "',readerType='" + ReaderType + "', certificateType='" + CertificateType + "',certificateID='" + CertificateID + "',tel='" + Tel + "',email='" + Email + "', remark='" + Remark + "',money=money+" + Addmoney + ",operator='" + Operator + "' where readerBarCode='" + barcode + "'";
            }

            if (DataOperate.ExecSQL(sql))
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('保存成功');window.opener.location.href=window.opener.location='ReaderInfo.aspx';window.close();</script>");
            }
            else
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('保存失败')</script>");
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            readerBarCode.Text = readerPassword.Text = readerName.Text = sex.SelectedValue = readerType.SelectedValue = certificateType.SelectedValue = certificateID.Text = tel.Text = email.Text = remark.InnerText = addMoney.Text = string.Empty;

        }

    }
}