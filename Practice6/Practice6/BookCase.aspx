<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookCase.aspx.cs" Inherits="Practice6.BookCase" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>书架管理</title>
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
            width: 65%;
            border: 2px solid #adaeaf;
            padding:15px;
            margin:10px auto;
        }

        .title {
            font-size: 22px;
            color: #7e5337;
            font-weight: bold;
            text-shadow: 3px 2px 10px #d2d2d2;
            margin-left:1%;
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
            <span class="title">书架管理</span><hr />
            <a href="#" onclick="window.open('AddCase.aspx?bookcaseID=add','','width=500,height=500');" style="position:absolute;top:43%;right:26%;">添加书架信息</a>
            <asp:GridView ID="gvBookCase" runat="server" AllowPaging="True" AutoGenerateColumns="False" OnRowDeleting="gvBookCase_RowDeleting" Width="678px" DataKeyNames="bookcaseID" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" HorizontalAlign="Center">
                <Columns>
                    <asp:BoundField DataField="bookcaseID" HeaderText="书架编号" ReadOnly="True" />
                    <asp:BoundField DataField="bookcaseName" HeaderText="书架名称" />
                    <asp:TemplateField HeaderText="修改">
                        <ItemTemplate>
                            <a href="#" onclick="window.open('AddCase.aspx?bookcaseID=<%#Eval("bookcaseID") %>','','width=500,height=500')">修改</a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
                </Columns>
                <RowStyle HorizontalAlign="Center" />
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
