<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderManager.aspx.cs" Inherits="Admin.OrderManager" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Admin</title>
    <meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.1.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <link href="Content/font-awesome.min.css" rel="stylesheet" />
    <link href="Content/style.css" rel="stylesheet" />
    
</head>
<body>
    <form runat="server">
        <div class="container-fluid">
            <div class="col-md-10">
                <div class="row">
                    <!-- order manager  -->
                    <div class="container" id="order_content">
                        <div class="row">
                            <div class="col-md-3">
                                <div class="btn-group">
                                    <button class="btn btn-default">筛选</button>
                                    <button data-toggle="dropdown" class="btn btn-default dropdown-toggle"><span class="caret"></span></button>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <a href='OrderManager.aspx?id=1'>已付款</a>
                                        </li>
                                        <li>
                                            <a href='OrderManager.aspx?id=2'>未付款</a>
                                        </li>
                                        <li>
                                            <a href="OrderManager.aspx?id=3">已发货</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-md-9">
                                    <div class="input-group col-md-4">
                                        <asp:TextBox type="text" class="form-control" placeholder="输入订单号..." runat="server" ID="tbSearch"/>
                                        <asp:LinkButton Text="搜索" runat="server" ID="lbsearch" OnClick="lbsearch_Click" CssClass="input-group-addon" PostBackUrl="~/OrderManager.aspx?id=4"/>
                                    </div>
                                </div>
                        </div>

                        <div class="row">
                            <asp:ListView runat="server" ID="listOrder" OnItemDeleting="listOrder_ItemDeleting" DataKeyNames="orderid" OnItemEditing="listOrder_ItemEditing" OnItemCanceling="listOrder_ItemCanceling" OnItemUpdating="listOrder_ItemUpdating">
                                <LayoutTemplate>
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>订单编号</th>
                                                <th>创建日期</th>
                                                <th>订单状态</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:PlaceHolder runat="server" ID="itemPlaceholder" />
                                        </tbody>
                                    </table>
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <tr class="active">
                                        <td><%#Eval("orderid") %></td>
                                        <td><%#DataBinder.Eval(Container.DataItem,"createdate","{0:d}") %></td>
                                        <td>
                                            <asp:Label Text='<%#Eval("orderstatus") %>' runat="server" ID="status"/>
                                        </td>
                                        <td>
                                            <asp:Button class="btn btn-danger" runat="server" Text="删除" ID="btnDelete" CommandName="Delete" OnClientClick="return confirm('确认删除？')"/>
                                            <asp:Button class="btn btn-default" Text="修改" runat="server" ID="Edit" CommandName="Edit"/>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <tr>
                                        <td><%#Eval("orderid") %></td>
                                        <td><%#Eval("createdate") %></td>
                                        <td>
<%--                                            <asp:TextBox runat="server" ID="tbStatus"  Width="100" MaxLength="10" BorderColor="Silver" BorderWidth="1" BorderStyle="Solid" Text='<%#Bind("orderstatus")%>'/>--%>
                                            <asp:DropDownList runat="server" ID="ddStatus">
                                                <asp:ListItem Text="未付款" />
                                                <asp:ListItem Text="已付款" />
                                                <asp:ListItem Text="已发货" />
                                            </asp:DropDownList>
                                        </td>                                        
                                        <td>
                                            <asp:Button Text="更新" runat="server" ID="Update" CommandName="Update" CssClass="btn btn-default"/>
                                            <asp:Button Text="取消" runat="server" ID="Cancel" CommandName="Cancel" CssClass="btn btn-info"/>
                                        </td>

                                    </tr>
                                </EditItemTemplate>
                            </asp:ListView>
                        </div>
                    </div>
                   
                    <div class="row index_footer">
                        <asp:DataPager ID="DataPagerOrder" runat="server" PagedControlID="listOrder" PageSize="6" OnPreRender="DataPagerOrder_PreRender">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonCssClass="btn btn-info" ShowFirstPageButton="True" ShowLastPageButton="True"></asp:NextPreviousPagerField>
                        </Fields>
                    </asp:DataPager>
                    </div>
                </div>

            </div>
        </div>
        <script src="Scripts/style.js"></script>
    </form>
</body>
</html>
