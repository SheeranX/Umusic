<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderManager.aspx.cs" Inherits="UMusic.UserCenter.OrderManager" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>UMusic</title>
    <meta name="viewport" content="width=device-width" />
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.1.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <link href="../Content/style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="row" id="order_user">
            <div class="tabbable" id="tabs">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a href="#panel-all" data-toggle="tab">全部订单</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="panel-all">
                        <asp:ListView runat="server" ID="listOrder" OnItemDeleting="listOrder_ItemDeleting" DataKeyNames="orderid">
                            <ItemTemplate>
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th><%#DataBinder.Eval(Container.DataItem,"orderdate","{0:d}")%></th>
                                            <th>订单号: <%#Eval("orderid") %></th>
                                            <th>单价</th>
                                            <th>数量</th>
                                            <th>订单状态</th>
                                            <th>操作</th>
                                            <th><span class="glyphicon glyphicon-trash pull-right"></span></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <img src='<%#Eval("imagesUrl") %>' width="120px" height="120px">
                                            </td>
                                            <td>
                                                <p>专辑名:<%#Eval("albumname")%></p>
                                                <p>歌手:<%#Eval("artistname") %></p>
                                                <p>流派：<%#Eval("genrename") %></p>
                                            </td>
                                            <td><%#Eval("unitprice") %></td>
                                            <td><%#Eval("quantity") %></td>
                                            <td><%#Eval("OrderStatus") %></td>
                                            <td>
                                                <a href='/Cart/Order?id=<%#Eval("orderid")%>' class="btn btn-info" target="_blank">付款</a>
                                            </td>
                                            <td>
                                                <asp:Button Text="删除" runat="server" ID="btnDel" CssClass="btn btn-danger" OnClientClick="return confirm('确认删除？')" CommandName="Delete"/>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </ItemTemplate>
                        </asp:ListView>
                        <asp:DataPager ID="DataPager" runat="server" PagedControlID="listOrder"  PageSize="2" OnPreRender="DataPager_PreRender">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonCssClass="btn btn-info" ShowFirstPageButton="True" ShowLastPageButton="True"></asp:NextPreviousPagerField>
                            </Fields>
                        </asp:DataPager>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <style>
        #order_user {
            width:1000px;
            padding-left:30px;
        }
    </style>
    <script src="../Scripts/style.js"></script>
    <script src="../Scripts/validation.js"></script>
</body>
</html>
