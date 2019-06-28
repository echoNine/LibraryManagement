<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddReaderType.aspx.cs" Inherits="Practice6.AddReaderType" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            读者类型编号：<asp:TextBox ID="readerTypeID" runat="server"></asp:TextBox><br />
            读者类型：<asp:TextBox ID="readerTypeName" runat="server"></asp:TextBox><br />
            可借阅数量：<asp:TextBox ID="num" runat="server"></asp:TextBox><br />
            <asp:Button ID="btnSave" runat="server" Text="保存" OnClick="btnSave_Click"/>&nbsp;&nbsp
            <asp:Button ID="btnCancel" runat="server" Text="取消" OnClick="btnCancel_Click"/>
        </div>
    </form>
</body>
</html>
