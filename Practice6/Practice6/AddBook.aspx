<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddBook.aspx.cs" Inherits="Practice6.AddBook" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>图书入库</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            图书编号：<asp:TextBox ID="bookBarCode" runat="server"></asp:TextBox><br />
            图书名称：<asp:TextBox ID="bookName" runat="server"></asp:TextBox><br />
            图书类型：<asp:DropDownList ID="bookType" runat="server"><asp:ListItem>1</asp:ListItem><asp:ListItem>2</asp:ListItem><asp:ListItem>3</asp:ListItem><asp:ListItem>4</asp:ListItem></asp:DropDownList><br />
            所在书架：<asp:DropDownList ID="bookCase" runat="server"><asp:ListItem>A</asp:ListItem><asp:ListItem>B</asp:ListItem><asp:ListItem>C</asp:ListItem></asp:DropDownList><br />
            作者：<asp:TextBox ID="author" runat="server"></asp:TextBox><br />
            价格：<asp:TextBox ID="price" runat="server"></asp:TextBox><br />
            库存：<asp:TextBox ID="stock" runat="server"></asp:TextBox><br />
            累计借阅数：<asp:TextBox ID="borrowSum" runat="server"></asp:TextBox><br />
            <asp:Button ID="btnSave" runat="server" Text="保存" OnClick="btnSave_Click"/>&nbsp;&nbsp
            <asp:Button ID="btnCancel" runat="server" Text="取消" OnClick="btnCancel_Click"/>
        </div>
    </form>
</body>
</html>
