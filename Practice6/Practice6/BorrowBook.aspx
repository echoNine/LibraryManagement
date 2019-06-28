<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BorrowBook.aspx.cs" Inherits="Practice6.BorrowBook" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>借书</title>
    <style type="text/css">
        body {
            padding: 0;
            margin: 0;
            width: 1366px;
            height: 628px;
            background-color: #ddeefb;
            overflow:hidden;
        }

        hr {
            border: 2px dashed #d2d2d2;
            margin-bottom: 12px;
            margin-top: 14px;
        }

        .Info {
            width: 71%;
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

        .readerInfo,.bookInfo{
            line-height:36px;
        }
    </style>
</head>
<body>
    <form id="form2" runat="server">
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
            <span class="title">图书借阅</span><hr />
            <div class="readerInfo" style="font-size: 15px; padding: 0px 10%;">
                读者编号：<asp:TextBox ID="readerBarCode" runat="server" Height="20px"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="findreader" runat="server" Text="查找读者" OnClick="btnReaderSearch_Click" /><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;姓名：<asp:TextBox ID="readerName" runat="server" Height="22px"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;性别：<asp:TextBox ID="sex" runat="server" Height="22px"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;类型：<asp:TextBox ID="readerType" runat="server" Height="22px"></asp:TextBox><br />
                证件类型：<asp:TextBox ID="certificateType" runat="server" Height="22px"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;证件号码：<asp:TextBox ID="certificateID" runat="server" Height="22px"></asp:TextBox>
                &nbsp;&nbsp;可借数量：<asp:TextBox ID="borrowCount" runat="server" Height="22px"></asp:TextBox><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;余额：<asp:TextBox ID="money" runat="server" Height="22px"></asp:TextBox>
            </div>
            <div class="bookInfo" style="font-size: 15px;padding: 0px 10%;">
                图书条形码：<asp:TextBox ID="bookBarCode" runat="server" Height="22px" Width="155px"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="findbook" runat="server" Text="查找图书" Enabled="false" OnClick="btnBookSearch_Click" /><br />
                <asp:GridView ID="gvBookBorrow" runat="server" AutoGenerateColumns="False" DataKeyNames="bookBarCode" OnSelectedIndexChanging="gvBookBorrow_SelectedIndexChanging" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" Width="685px" style="margin-top:10px;">
                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                    <Columns>
                        <asp:BoundField DataField="bookName" HeaderText="图书名称" />
                        <asp:BoundField DataField="bookType" HeaderText="图书类型" />
                        <asp:BoundField DataField="bookCase" HeaderText="货架号" />
                        <asp:BoundField DataField="author" HeaderText="作者" />
                        <asp:BoundField DataField="price" HeaderText="价格" />
                        <asp:BoundField DataField="stock" HeaderText="库存数" />
                        <asp:BoundField DataField="borrowSum" HeaderText="累计外借次数" />
                        <asp:CommandField HeaderText="借阅" SelectText="借阅" ShowSelectButton="True" />
                    </Columns>
                    <RowStyle HorizontalAlign="Center" />
                    <FooterStyle BackColor="Tan" />
                    <HeaderStyle BackColor="Tan" Font-Bold="True" />
                    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                    <SortedAscendingCellStyle BackColor="#FAFAE7" />
                    <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                    <SortedDescendingCellStyle BackColor="#E1DB9C" />
                    <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
