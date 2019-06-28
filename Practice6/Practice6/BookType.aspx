<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookType.aspx.cs" Inherits="Practice6.BookType" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>图书类型管理</title>
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
            width: 66%;
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
            <span class="title">图书类型管理</span><hr />
        <a href="#" onclick="window.open('AddBookType.aspx','','width=500,height=500');" style="position: absolute; top: 43%; right: 28%;">添加图书类型</a>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="bookTypeID" DataSourceID="SqlDataSource1" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" ForeColor="Black" HorizontalAlign="Center" CellSpacing="2" Width="617px">
            <Columns>
                <asp:BoundField DataField="bookTypeID" HeaderText="图书类型编号" ReadOnly="True" SortExpression="bookTypeID" />
                <asp:BoundField DataField="bookTypeName" HeaderText="图书类型名称" SortExpression="bookTypeName" />
                <asp:BoundField DataField="borrowDay" HeaderText="可借阅天数" SortExpression="borrowDay" />
                <asp:BoundField DataField="hire" HeaderText="押金/期" SortExpression="hire" />
                <asp:BoundField DataField="lagMoney" HeaderText="滞纳金/期" SortExpression="lagMoney" />
                <asp:CommandField ShowEditButton="True" HeaderText="修改"/>
                <asp:CommandField ShowDeleteButton="True" HeaderText="删除"/>
            </Columns>
            <RowStyle HorizontalAlign="Center" />
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle HorizontalAlign="Center" BackColor="White" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:BookDataBaseCnnString %>" DeleteCommand="DELETE FROM [tb_bookType] WHERE [bookTypeID] = @original_bookTypeID AND (([bookTypeName] = @original_bookTypeName) OR ([bookTypeName] IS NULL AND @original_bookTypeName IS NULL)) AND (([borrowDay] = @original_borrowDay) OR ([borrowDay] IS NULL AND @original_borrowDay IS NULL)) AND (([hire] = @original_hire) OR ([hire] IS NULL AND @original_hire IS NULL)) AND (([lagMoney] = @original_lagMoney) OR ([lagMoney] IS NULL AND @original_lagMoney IS NULL))" InsertCommand="INSERT INTO [tb_bookType] ([bookTypeID], [bookTypeName], [borrowDay], [hire], [lagMoney]) VALUES (@bookTypeID, @bookTypeName, @borrowDay, @hire, @lagMoney)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [tb_bookType]" UpdateCommand="UPDATE [tb_bookType] SET [bookTypeName] = @bookTypeName, [borrowDay] = @borrowDay, [hire] = @hire, [lagMoney] = @lagMoney WHERE [bookTypeID] = @original_bookTypeID AND (([bookTypeName] = @original_bookTypeName) OR ([bookTypeName] IS NULL AND @original_bookTypeName IS NULL)) AND (([borrowDay] = @original_borrowDay) OR ([borrowDay] IS NULL AND @original_borrowDay IS NULL)) AND (([hire] = @original_hire) OR ([hire] IS NULL AND @original_hire IS NULL)) AND (([lagMoney] = @original_lagMoney) OR ([lagMoney] IS NULL AND @original_lagMoney IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_bookTypeID" Type="Int32" />
                <asp:Parameter Name="original_bookTypeName" Type="String" />
                <asp:Parameter Name="original_borrowDay" Type="Int32" />
                <asp:Parameter Name="original_hire" Type="Int32" />
                <asp:Parameter Name="original_lagMoney" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="bookTypeID" Type="Int32" />
                <asp:Parameter Name="bookTypeName" Type="String" />
                <asp:Parameter Name="borrowDay" Type="Int32" />
                <asp:Parameter Name="hire" Type="Int32" />
                <asp:Parameter Name="lagMoney" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="bookTypeName" Type="String" />
                <asp:Parameter Name="borrowDay" Type="Int32" />
                <asp:Parameter Name="hire" Type="Int32" />
                <asp:Parameter Name="lagMoney" Type="Int32" />
                <asp:Parameter Name="original_bookTypeID" Type="Int32" />
                <asp:Parameter Name="original_bookTypeName" Type="String" />
                <asp:Parameter Name="original_borrowDay" Type="Int32" />
                <asp:Parameter Name="original_hire" Type="Int32" />
                <asp:Parameter Name="original_lagMoney" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
            </div>
    </form>
</body>
</html>
