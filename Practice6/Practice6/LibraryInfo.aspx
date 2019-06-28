<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LibraryInfo.aspx.cs" Inherits="Practice6.LibraryInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>图书馆信息</title>
    <style type="text/css">
        body {
            padding: 0;
            margin: 0;
            width: 1366px;
            height: 628px;
            background-color: #bdd3e1;
            overflow:hidden;
        }

        hr {
            border: 2px dashed #9e9e9e;
            margin-bottom: 14px;
            margin-top: 14px;
        }

        .Info {
            width: 50%;
            border: 2px solid #adaeaf;
            padding: 20px 40px;
            margin: 10px auto;
        }

        .title {
            font-size: 22px;
            color: #7e5337;
            font-weight: bold;
            text-shadow: 3px 2px 10px #d2d2d2;
        }

        .item {
            font-size: 16px;
            color: #000;
            line-height: 32px;
            padding: 0px 110px;
        }

        .content {
            font-size: 14px;
            line-height: 19px;
            color: #000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Image ID="banner" runat="server" ImageUrl="~/images/banner.jpg" style="width:1366px; height:220px"/>
        <asp:Menu ID="Menu1" runat="server" Orientation="Horizontal" Font-Size="16px" ForeColor="White" Height="50px" Width="800px" style="line-height:50px; position:absolute; top:0;left:20%; text-align:center">
            <StaticMenuItemStyle HorizontalPadding="22px" VerticalPadding="0px" BackColor="#4975d4"/>
            <StaticHoverStyle BackColor="#5a93fa" />
            <DynamicMenuItemStyle BackColor="#4975d4" Width="100px" Font-Size="14px"/>
            <DynamicHoverStyle BackColor="#a4c7fc" Width="100px" Font-Size="14px"/> 
            <Items>
                <asp:MenuItem NavigateUrl="~/index.aspx" Text="首页"></asp:MenuItem>
                <asp:MenuItem Text="系统设置">
                    <asp:MenuItem NavigateUrl="~/LibraryInfo.aspx" Text="图书馆信息"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/BookCase.aspx" Text="书架管理"></asp:MenuItem>
                </asp:MenuItem>
                <asp:MenuItem Text="系统查询">
                    <asp:MenuItem NavigateUrl="~/BookInfoSearch.aspx" Text="图书信息查询"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/BookBorrowSearch.aspx" Text="图书借阅查询"></asp:MenuItem>
                </asp:MenuItem>
                <asp:MenuItem Text="读者管理">
                    <asp:MenuItem NavigateUrl="~/ReaderType.aspx" Text="读者类型管理"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/ReaderInfo.aspx" Text="读者信息管理"></asp:MenuItem>
                </asp:MenuItem>
                <asp:MenuItem Text="图书管理">
                    <asp:MenuItem NavigateUrl="~/BookType.aspx" Text="图书类型管理"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/BookInfo.aspx" Text="图书信息管理"></asp:MenuItem>
                </asp:MenuItem>
                <asp:MenuItem Text="图书借还">
                    <asp:MenuItem NavigateUrl="~/BorrowBook.aspx" Text="图书借阅"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/ReturnBook.aspx" Text="图书归还"></asp:MenuItem>
                </asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/NewPass.aspx" Text="更改密码"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Login.aspx" Text="退出系统"></asp:MenuItem>
            </Items>
        </asp:Menu>
        <div class="Info">
            <span class="title">图书馆信息</span><hr />
            <div class="item">
                图书馆名称：<asp:TextBox ID="libraryName" runat="server" CssClass="content" Enabled="false"></asp:TextBox><br />
                官网：<asp:TextBox ID="webSite" runat="server" CssClass="content" Enabled="false"></asp:TextBox><br />
                责任单位：<asp:TextBox ID="unit" runat="server" CssClass="content" Enabled="false"></asp:TextBox><br />
                建馆时间：<asp:TextBox ID="built" runat="server" CssClass="content" Enabled="false"></asp:TextBox>
                <asp:ImageButton ID="calendarImg" runat="server" OnClick="calendarImg_Click" ImageUrl="~/images/calendar.gif" Enabled="false" />
                <asp:Calendar ID="Calendar" runat="server" Visible="false" Enabled="false" BackColor="#FFFFCC"
                    BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest"
                    Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px"
                    ShowGridLines="True" Width="220px" OnSelectionChanged="Calendar_SelectionChanged">
                    <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                    <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                    <OtherMonthDayStyle ForeColor="#CC9966" />
                    <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                    <SelectorStyle BackColor="#FFCC66" />
                    <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                    <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                </asp:Calendar>
                <br />
                简介：<asp:TextBox ID="introduction" runat="server" CssClass="content" Enabled="false"></asp:TextBox><br />
                地址：<asp:TextBox ID="address" runat="server" CssClass="content" Enabled="false"></asp:TextBox><br />
                联系电话：<asp:TextBox ID="phone" runat="server" CssClass="content" Enabled="false"></asp:TextBox>
            </div>
            <asp:Button ID="Update" runat="server" Text="修改" OnClick="btnUpdate_Click" Style="margin-left: 110px; margin-top: 5px" />
            <asp:Button ID="Save" runat="server" Text="保存" OnClick="btnSave_Click" Enabled="false" Style="margin-left: 40px; margin-top: 5px" />
        </div>
    </form>
</body>
</html>
