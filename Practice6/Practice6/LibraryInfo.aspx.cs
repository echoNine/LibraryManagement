using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Practice6
{
    public partial class LibraryInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                bindLibrary();
            }
        }
        public bool getSet()
        {
            string type = Session["entryType"].ToString();
            if (type == "管理员")
                return true;
            else
                return false;
        }

        public void bindLibrary()
        {
            string sql = "select * from tb_libraryInfo where libraryBarCode = '1001'";
            SqlDataReader sdr = DataOperate.GetRow(sql);
            sdr.Read();
            libraryName.Text = sdr["libraryName"].ToString();
            webSite.Text = sdr["webSite"].ToString();
            unit.Text = sdr["unit"].ToString();
            built.Text = sdr["built"].ToString();
            introduction.Text = sdr["introduction"].ToString();
            address.Text = sdr["address"].ToString();
            phone.Text = sdr["phone"].ToString();
        }

        protected void calendarImg_Click(object sender, EventArgs e)
        {
            Calendar.Visible = !Calendar.Visible;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string LibraryName = libraryName.Text;
            string WebSite = webSite.Text;
            string Unit = unit.Text;
            string Built = built.Text;
            string Introduction = introduction.Text;
            string Address = address.Text;
            string Phone = phone.Text;
            string sql = "update tb_libraryInfo set libraryName='" + LibraryName + "', webSite='" + WebSite + "',unit='" + Unit + "', built='" + Built + "',introduction='" + Introduction + "',address='" + Address + "',phone='" + Phone + "' where libraryBarCode=" + "'1001'";
            if (DataOperate.ExecSQL(sql))
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('保存成功')</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('保存失败')</script>");
            }
            Save.Enabled = false;
            Update.Enabled = true;
            libraryName.Enabled = webSite.Enabled = unit.Enabled = built.Enabled = calendarImg.Enabled = Calendar.Enabled = introduction.Enabled = address.Enabled = phone.Enabled = false;
        }

        protected void Calendar_SelectionChanged(object sender, EventArgs e)
        {
            built.Text = Calendar.SelectedDate.ToShortDateString();
            Calendar.Visible = false;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Save.Enabled = true;
            Update.Enabled = false;
            libraryName.Enabled = webSite.Enabled = unit.Enabled = built.Enabled = calendarImg.Enabled = Calendar.Enabled = introduction.Enabled = address.Enabled = phone.Enabled = true;
        }
    }
}