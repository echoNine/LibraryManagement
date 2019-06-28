<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookInfo.aspx.cs" Inherits="Practice6.BookInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>图书信息管理</title>
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
            margin-bottom: 14px;
            margin-top: 14px;
        }

        .Info {
            width: 73%;
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
            <span class="title">图书信息管理</span><hr />
        <a href="#" onclick="window.open('AddBook.aspx?bookBarCode=add','','width=500,height=500');" style="position: absolute; top: 43%; right: 25%;">添加图书信息</a>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="bookBarCode" DataSourceID="SqlDataSource1" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Width="706px" HorizontalAlign="Center">
            <Columns>
                <asp:BoundField DataField="bookBarCode" HeaderText="图书编号" ReadOnly="True" SortExpression="bookBarCode" />
                <asp:BoundField DataField="bookName" HeaderText="图书名称" SortExpression="bookName" />
                <asp:BoundField DataField="bookType" HeaderText="图书类型" SortExpression="bookType" />
                <asp:BoundField DataField="bookCase" HeaderText="所在书架" SortExpression="bookCase" />
                <asp:BoundField DataField="author" HeaderText="作者" SortExpression="author" />
                <asp:BoundField DataField="price" HeaderText="价格" SortExpression="price" />
                <asp:BoundField DataField="stock" HeaderText="库存" SortExpression="stock" />
                <asp:TemplateField HeaderText="修改">
                        <ItemTemplate>
                            <a href="#" onclick="window.open('AddBook.aspx?bookBarCode=<%#Eval("bookBarCode") %>','','width=500,height=500')">修改</a>
                        </ItemTemplate>
                    </asp:TemplateField>
                <asp:CommandField ShowDeleteButton="True" HeaderText="删除"/>
            </Columns>
            <RowStyle HorizontalAlign="Center" />
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle BackColor="White" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:BookDataBaseCnnString %>" DeleteCommand="DELETE FROM [tb_bookInfo] WHERE [bookBarCode] = @original_bookBarCode AND (([bookName] = @original_bookName) OR ([bookName] IS NULL AND @original_bookName IS NULL)) AND (([bookType] = @original_bookType) OR ([bookType] IS NULL AND @original_bookType IS NULL)) AND (([bookCase] = @original_bookCase) OR ([bookCase] IS NULL AND @original_bookCase IS NULL)) AND (([author] = @original_author) OR ([author] IS NULL AND @original_author IS NULL)) AND (([price] = @original_price) OR ([price] IS NULL AND @original_price IS NULL)) AND (([stock] = @original_stock) OR ([stock] IS NULL AND @original_stock IS NULL))" InsertCommand="INSERT INTO [tb_bookInfo] ([bookBarCode], [bookName], [bookType], [bookCase], [author], [price], [stock]) VALUES (@bookBarCode, @bookName, @bookType, @bookCase, @author, @price, @stock)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [bookBarCode], [bookName], [bookType], [bookCase], [author], [price], [stock] FROM [tb_bookInfo]" UpdateCommand="UPDATE [tb_bookInfo] SET [bookName] = @bookName, [bookType] = @bookType, [bookCase] = @bookCase, [author] = @author, [price] = @price, [stock] = @stock WHERE [bookBarCode] = @original_bookBarCode AND (([bookName] = @original_bookName) OR ([bookName] IS NULL AND @original_bookName IS NULL)) AND (([bookType] = @original_bookType) OR ([bookType] IS NULL AND @original_bookType IS NULL)) AND (([bookCase] = @original_bookCase) OR ([bookCase] IS NULL AND @original_bookCase IS NULL)) AND (([author] = @original_author) OR ([author] IS NULL AND @original_author IS NULL)) AND (([price] = @original_price) OR ([price] IS NULL AND @original_price IS NULL)) AND (([stock] = @original_stock) OR ([stock] IS NULL AND @original_stock IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_bookBarCode" Type="String" />
                <asp:Parameter Name="original_bookName" Type="String" />
                <asp:Parameter Name="original_bookType" Type="Int32" />
                <asp:Parameter Name="original_bookCase" Type="String" />
                <asp:Parameter Name="original_author" Type="String" />
                <asp:Parameter Name="original_price" Type="Decimal" />
                <asp:Parameter Name="original_stock" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="bookBarCode" Type="String" />
                <asp:Parameter Name="bookName" Type="String" />
                <asp:Parameter Name="bookType" Type="Int32" />
                <asp:Parameter Name="bookCase" Type="String" />
                <asp:Parameter Name="author" Type="String" />
                <asp:Parameter Name="price" Type="Decimal" />
                <asp:Parameter Name="stock" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="bookName" Type="String" />
                <asp:Parameter Name="bookType" Type="Int32" />
                <asp:Parameter Name="bookCase" Type="String" />
                <asp:Parameter Name="author" Type="String" />
                <asp:Parameter Name="price" Type="Decimal" />
                <asp:Parameter Name="stock" Type="Int32" />
                <asp:Parameter Name="original_bookBarCode" Type="String" />
                <asp:Parameter Name="original_bookName" Type="String" />
                <asp:Parameter Name="original_bookType" Type="Int32" />
                <asp:Parameter Name="original_bookCase" Type="String" />
                <asp:Parameter Name="original_author" Type="String" />
                <asp:Parameter Name="original_price" Type="Decimal" />
                <asp:Parameter Name="original_stock" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
