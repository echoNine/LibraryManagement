<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddReader.aspx.cs" Inherits="Practice6.AddReader" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>增加/修改读者信息</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            读者编号：<asp:TextBox ID="readerBarCode" runat="server"></asp:TextBox><br />
            登录密码：<asp:TextBox ID="readerPassword" runat="server" TextMode="Password"></asp:TextBox><br />
            姓名：<asp:TextBox ID="readerName" runat="server"></asp:TextBox><br />
            性别：<asp:RadioButtonList ID="sex" runat="server" RepeatDirection="Horizontal"><asp:ListItem>男</asp:ListItem><asp:ListItem>女</asp:ListItem></asp:RadioButtonList><br />
            读者类型：<asp:DropDownList ID="readerType" runat="server"><asp:ListItem>1</asp:ListItem><asp:ListItem>2</asp:ListItem><asp:ListItem>3</asp:ListItem></asp:DropDownList><br />
            证件类型：<asp:DropDownList ID="certificateType" runat="server"><asp:ListItem>学生证</asp:ListItem><asp:ListItem>身份证</asp:ListItem><asp:ListItem>一卡通</asp:ListItem></asp:DropDownList><br />
            证件号码：<asp:TextBox ID="certificateID" runat="server"></asp:TextBox><br />
            联系电话：<asp:TextBox ID="tel" runat="server"></asp:TextBox><br />
            E-mail：<asp:TextBox ID="email" runat="server"></asp:TextBox><br />
            备注：<textarea id="remark" cols="20" rows="2" runat="server"></textarea><br />
            增加金额：<asp:TextBox ID="addMoney" runat="server"></asp:TextBox>元<br />
            <asp:Button ID="btnSave" runat="server" Text="保存" OnClick="btnSave_Click"/>&nbsp;&nbsp
            <asp:Button ID="btnCancel" runat="server" Text="取消" OnClick="btnCancel_Click"/>
        </div>
    </form>
</body>
</html>
