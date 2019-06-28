<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Practice6.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>首页</title>
    <style type="text/css">
        body {
            padding: 0;
            margin: 0;
            width: 1366px;
            height: 628px;
            background-color: #bdd3e1;
            overflow:hidden;
        }

        .order {
            border: 2px solid #adaeaf;
            width: 91%;
            height: 270px;
            margin: 15px auto;
        }

        .bookorder, .readerorder {
            float: left;
            margin-left: 40px;
        }

        .title {
            font-size: 20px;
            color: #7e5337;
            font-weight: bold;
            text-shadow: 3px 2px 10px #d2d2d2;
            margin: 10px auto;
            width: 91%;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <asp:Image ID="banner" runat="server" ImageUrl="~/images/banner.jpg" />
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
        <div class="order">
            <div class="title">
                <img src="images/book.png" style="width: 60px; width: 60px; margin-left:-2%;" /><span style="position: absolute; margin-top: 13px; margin-left: 13px;">图书借阅排行表</span>
                <img src="images/hat.png" style="width: 60px; margin-left: 48.5%;" /><span style="position: absolute; margin-top: 13px; margin-left: 13px;">读者借阅排行表</span>
            </div>
            <div class="bookorder">
                <asp:GridView ID="gvBookOrder" runat="server" AllowPaging="True" AutoGenerateColumns="False" Width="576px" DataKeyNames="bookBarCode" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" HorizontalAlign="Center">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="排名" InsertVisible="False">
                            <ItemTemplate>
                                <%# Container.DataItemIndex + 1%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="bookBarCode" HeaderText="图书编码" ReadOnly="True" />
                        <asp:BoundField DataField="bookName" HeaderText="图书名称" />
                        <asp:BoundField DataField="bookType" HeaderText="图书类型" />
                        <asp:BoundField DataField="author" HeaderText="作者" />
                        <asp:BoundField DataField="borrowSum" HeaderText="累计借阅数" />
                    </Columns>
                    <RowStyle HorizontalAlign="Center" />
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                    <SortedAscendingHeaderStyle BackColor="#848384" />
                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                    <SortedDescendingHeaderStyle BackColor="#575357" />
                </asp:GridView>
            </div>
            <div class="readerorder">
                <asp:GridView ID="gvReaderOrder" runat="server" AllowPaging="True" AutoGenerateColumns="False" Width="550px" DataKeyNames="readerBarCode" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" HorizontalAlign="Center">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="排名" InsertVisible="False">
                            <ItemTemplate>
                                <%# Container.DataItemIndex + 1%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="readerBarCode" HeaderText="读者编号" ReadOnly="True" />
                        <asp:BoundField DataField="readerName" HeaderText="读者姓名" />
                        <asp:BoundField DataField="borrowSum" HeaderText="累计借阅数" />
                    </Columns>
                    <RowStyle HorizontalAlign="Center" />
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                    <SortedAscendingHeaderStyle BackColor="#848384" />
                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                    <SortedDescendingHeaderStyle BackColor="#575357" />
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
