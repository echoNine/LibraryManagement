<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookInfoSearch.aspx.cs" Inherits="Practice6.BookInfoSearch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>图书信息查询</title>
    <style type="text/css">
        body {
            padding: 0;
            margin: 0;
            width: 1366px;
            height: 628px;
            background-color: #ddeefb;
            overflow: hidden;
        }

        hr {
            border: 2px dashed #d2d2d2;
            margin-bottom: 14px;
            margin-top: 14px;
        }

        .Main {
            width: 55%;
            border: 2px solid #adaeaf;
            padding: 15px;
            margin: 10px auto;
        }

        .title {
            font-size: 22px;
            color: #7e5337;
            font-weight: bold;
            text-shadow: 3px 2px 10px #d2d2d2;
            margin-left: 1%;
        }

        .item {
            font-size: 16px;
            color: #000;
            line-height: 32px;
            padding: 0px 100px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Image ID="banner" runat="server" ImageUrl="~/images/banner.jpg" Style="width: 1366px; height: 220px" />
        <asp:Menu ID="Menu1" runat="server" Orientation="Horizontal" Font-Size="16px" ForeColor="White" Height="50px" Width="800px" Style="line-height: 50px; position: absolute; top: 0; left: 20%; text-align: center">
            <StaticMenuItemStyle HorizontalPadding="22px" VerticalPadding="0px" BackColor="#4975d4" />
            <StaticHoverStyle BackColor="#5a93fa" />
            <DynamicMenuItemStyle BackColor="#4975d4" Width="100px" Font-Size="14px" />
            <DynamicHoverStyle BackColor="#a4c7fc" Width="100px" Font-Size="14px" />
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
        <div class="Main">
            <span class="title">图书信息查询</span><hr />
            <div class="item">
                选择查询条件：
            <asp:DropDownList ID="searchItem" runat="server" AutoPostBack="True">
                <asp:ListItem Value="bookBarCode">条形码</asp:ListItem>
                <asp:ListItem Value="bookName">书名</asp:ListItem>
                <asp:ListItem Value="bookType">图书类别</asp:ListItem>
                <asp:ListItem Value="bookCase">书架</asp:ListItem>
                <asp:ListItem Value="author">作者</asp:ListItem>
            </asp:DropDownList>
                <asp:TextBox ID="target" runat="server"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="查询"/><br />
                <asp:GridView ID="gvBookInfo" runat="server" AllowPaging="True" AutoGenerateColumns="False" Width="576px" DataKeyNames="bookBarCode" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" HorizontalAlign="Center">
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <Columns>
                        <asp:BoundField DataField="bookBarCode" HeaderText="图书条形码" />
                        <asp:BoundField DataField="bookName" HeaderText="图书名称" />
                        <asp:BoundField DataField="bookType" HeaderText="图书类型" />
                        <asp:BoundField DataField="bookCase" HeaderText="图书书架" />
                        <asp:BoundField DataField="author" HeaderText="作者" />
                        <asp:BoundField DataField="price" HeaderText="价格" />
                        <asp:BoundField DataField="borrowSum" HeaderText="累计借阅数" />
                    </Columns>
                    <RowStyle HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
