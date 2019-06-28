<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddBookType.aspx.cs" Inherits="Practice6.AddBookType" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            图书类型编号：<asp:TextBox ID="bookTypeID" runat="server"></asp:TextBox><br />
            图书类型名称：<asp:TextBox ID="bookTypeName" runat="server"></asp:TextBox><br />
            可借阅天数：<asp:TextBox ID="borrowDay" runat="server"></asp:TextBox><br />
            押金：<asp:TextBox ID="hire" runat="server"></asp:TextBox><br />
            滞纳金：<asp:TextBox ID="lagMoney" runat="server"></asp:TextBox><br />
            <asp:Button ID="btnSave" runat="server" Text="保存" OnClick="btnSave_Click" />&nbsp;&nbsp
            <asp:Button ID="btnCancel" runat="server" Text="取消" OnClick="btnCancel_Click" />
        </div>
    </form>
</body>
</html>
