<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCase.aspx.cs" Inherits="Practice6.AddCase" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>添加书架</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            书架编号：<asp:TextBox ID="bookcaseID" runat="server"></asp:TextBox><br />
            书架名称：<asp:TextBox ID="bookcaseName" runat="server"></asp:TextBox><br />
            <asp:Button ID="btnSave" runat="server" Text="保存" OnClick="btnSave_Click"/>&nbsp;&nbsp
            <asp:Button ID="btnCancel" runat="server" Text="取消" OnClick="btnCancel_Click"/>
        </div>
    </form>
</body>
</html>
