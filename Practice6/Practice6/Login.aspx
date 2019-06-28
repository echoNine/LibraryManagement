<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Practice6.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>登录</title>
    <style type="text/css">
        body {
            margin:0;
            padding:0;
            width: 1366px;
            height: 628px;
            background:url(./images/loginback.jpg);
            background-repeat: no-repeat;
            background-attachment: fixed;
            overflow:hidden;
        }

        .main {
            width: 263px;
            height: 262px;
            margin-top: 172px;
            margin-left: 753px;
            position:relative;
        }

        .username {
            position:absolute;
            left: 20px;
            top: 62px;
            color: #667986;
        }

        .pwd {
            position: absolute;
            left: 21px;
            top: 100px;
            color: #667986;
        }

        .radio{
            color: #667986;
            left: 85px;
            top: 140px;
            position: absolute;
        }

        .deter{
            background-color: #bcd4e2;
            border-style: None;
            left: 65px;
            bottom: 48px;
            color: #5a5a5a;
            position: absolute;
            padding: 1px 6px;
            line-height: 20px;
        }

        .cancel{
            background-color: #bcd4e2;
            border-style: None;
            left: 150px;
            bottom: 48px;
            color: #5a5a5a;
            position: absolute;
            padding: 1px 6px;
            line-height: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="main" runat="server">
            <div class="username">用户名：&nbsp;&nbsp;<asp:TextBox ID="user_name" runat="server" Width="125px" Height="20px" BackColor="#c9dfe6" BorderStyle="None" ForeColor="White"></asp:TextBox></div>
            <div class="pwd">密&nbsp;&nbsp;&nbsp;码：&nbsp;&nbsp;<asp:TextBox ID="password" runat="server" Width="125px" Height="20px" BackColor="#c9dfe6" BorderStyle="None" ForeColor="White" TextMode="Password"></asp:TextBox></div>
            <asp:RadioButtonList ID="radio" runat="server" RepeatDirection="Horizontal" CssClass="radio">
                <asp:ListItem Selected="True">管理员&nbsp;&nbsp;</asp:ListItem>
                <asp:ListItem>读者</asp:ListItem>
            </asp:RadioButtonList>
            <asp:Button ID="determine" runat="server" Text="确定" OnClick="Determine_Click" CssClass="deter"/>
            <asp:Button ID="cancel" runat="server" Text="取消" CssClass="cancel"/>
        </div>
    </form>
</body>
</html>