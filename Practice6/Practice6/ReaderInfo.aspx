<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReaderInfo.aspx.cs" Inherits="Practice6.ReaderInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>读者信息管理</title>
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
            width: 89%;
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
            <span class="title">读者信息管理</span><hr />
            <a href="#" onclick="window.open('AddReader.aspx?readerBarCode=add','','width=500,height=500');" style="position: absolute; top: 43%; right: 17%;">添加读者信息</a>
            <asp:GridView ID="gvReaderInfo" runat="server" AllowPaging="True" AutoGenerateColumns="False" OnRowDeleting="gvReaderInfo_RowDeleting" Width="922px" DataKeyNames="readerBarCode" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" HorizontalAlign="Center">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:BoundField DataField="readerBarCode" HeaderText="读者编号" ReadOnly="True" />
                    <asp:BoundField DataField="readerName" HeaderText="姓名" />
                    <asp:BoundField DataField="sex" HeaderText="性别" />
                    <asp:BoundField DataField="readerType" HeaderText="读者类型" />
                    <asp:BoundField DataField="certificateType" HeaderText="证件类型" />
                    <asp:BoundField DataField="certificateID" HeaderText="证件号码" />
                    <asp:BoundField DataField="tel" HeaderText="电话" />
                    <asp:BoundField DataField="email" HeaderText="Email" />
                    <asp:BoundField DataField="money" HeaderText="余额" />
                    <asp:BoundField DataField="remark" HeaderText="备注" />
                    <asp:TemplateField HeaderText="修改">
                        <ItemTemplate>
                            <a href="#" onclick="window.open('AddReader.aspx?readerBarCode=<%#Eval("readerBarCode") %>','','width=500,height=500')">修改</a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
                </Columns>
                <RowStyle HorizontalAlign="Center" />
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
