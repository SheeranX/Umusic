<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AlbumManager.aspx.cs" Inherits="Admin.AlbumManager" %>

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
                    <!-- check user -->
                    <div class="container" id="commodity_content">
                        <div class="row">
                            <ul id="myTab" class="nav nav-tabs">
                            </ul>
                            <div id="myTabContent" class="tab-content">
                                <div class="tab-pane fade in active" id="comall">
                                    <div class="col-md-2">
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-default">筛选</button>
                                            <button type="button" class="btn btn-default dropdown-toggle"
                                                data-toggle="dropdown">
                                                <span class="caret"></span>
                                                <span class="sr-only">切换下拉菜单</span>
                                            </button>
                                            <ul class="dropdown-menu" role="menu">
                                                <li><a href="AlbumManager.aspx?id=1">在售</a></li>
                                                <li><a href="AlbumManager.aspx?id=2">下架</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="input-group col-md-4">
                                        <asp:TextBox runat="server" ID="search" CssClass="form-control" placeholder="请输入产品编号" Width="200"/>
                                        <asp:LinkButton Text="搜索" runat="server" CssClass="btn btn-info" ID="btnsearch" OnClick="btnsearch_Click" PostBackUrl="~/AlbumManager.aspx?id=3"/>
                                    </div>
                                    <asp:ListView runat="server" ID="listAlbum" OnItemEditing="listAlbum_ItemEditing" OnItemDeleting="listAlbum_ItemDeleting" OnItemCanceling="listAlbum_ItemCanceling" OnItemUpdating="listAlbum_ItemUpdating" DataKeyNames="albumid">
                                        <LayoutTemplate>
                                            <table class="table table-striped">
                                                <thead>
                                                    <tr>
                                                        <th>编号</th>
                                                        <th>商品名</th>
                                                        <th>上架时间</th>
                                                        <th>库存</th>
                                                        <th>价格</th>
                                                        <th>状态</th>
                                                        <th>操作</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <asp:PlaceHolder runat="server" ID="itemPlaceholder" />
                                                </tbody>
                                            </table>
                                        </LayoutTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <td><a href='AlbumDetails.aspx?aid=<%#Eval("albumid") %>' id="albumid" target="iframe_a"><%#Eval("albumid") %></a> </td>
                                                <td><%#Eval("albumname") %></td>
                                                <td><%#DataBinder.Eval(Container.DataItem,"adddate","{0:d}") %></td>
                                                <td><%#Eval("leftnum") %></td>
                                                <td><%#Eval("price") %></td>
                                                <td><%#Eval("status") %></td>
                                                <td>
                                                    <asp:Button Text="删除" runat="server" ID="Delete" CommandName="Delete" CssClass="btn btn-danger" OnClientClick="return confirm('确认删除？')" />
                                                    <asp:Button Text="修改" runat="server" ID="Edit" CommandName="Edit" CssClass="btn btn-info" />
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <tr>
                                                <td><%#Eval("albumid") %></td>
                                                <td><%#Eval("albumname") %></td>
                                                <td><%#DataBinder.Eval(Container.DataItem,"adddate","{0:d}") %></td>
                                                <td>
                                                    <asp:TextBox runat="server" ID="tbNum" Width="50" BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" Text='<%#Eval("leftnum") %>' required />
                                                </td>
                                                <td>
                                                    <asp:TextBox runat="server" ID="tbPrice" Width="50" BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" Text='<%#Eval("price") %>' required />
                                                </td>
                                                <td>
                                                    <asp:DropDownList runat="server" ID="ddlStatus">
                                                        <asp:ListItem Text="在售" />
                                                        <asp:ListItem Text="下架" />
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:Button Text="更新" runat="server" ID="update" CommandName="update" CssClass="btn btn-info" />
                                                    <asp:Button Text="取消" runat="server" ID="Cancel" CommandName="Cancel" CssClass="btn btn-default" />
                                                </td>
                                            </tr>
                                        </EditItemTemplate>
                                    </asp:ListView>
                                    <div class="albumPager">
                                        <asp:DataPager ID="DataPager" runat="server" PagedControlID="listAlbum" PageSize="6" OnPreRender="DataPager_PreRender">
                                            <Fields>
                                                <asp:NextPreviousPagerField ButtonCssClass="btn btn-info" ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True"></asp:NextPreviousPagerField>
                                            </Fields>
                                        </asp:DataPager>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 模态框（Modal） -->
        <div class="modal fade" id="AlbumModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel">商品详情
                        </h4>
                    </div>
                    <div class="modal-body">
                        <a class="pull-left" href="#">
                            <img class="media-object" src='<%#Session["imagesurl"] %>' alt="媒体对象" width="200px" height="200px" id="proimg">
                        </a>
                        <div class="media-body">
                            <h4 class="media-heading">专辑：<asp:Label runat="server" ID="_albumname" /></h4>
                            <p>专辑编号：<span id="_number"><%#Eval("albumId") %></span></p>
                            <p>歌&nbsp;&nbsp;&nbsp;&nbsp;手：<%#Eval("artistid") %></p>
                            <p>
                                发行时间：<%#Eval("releasedate") %>
                            </p>
                            <p>发行公司： Big Machine Records</p>
                            <p class="hidden">库存：<span id="storage"><%#Eval("leftnum") %></span></p>
                            <p id="price">价格：￥@Model.album.price </p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">
                                关闭
                            </button>
                            <button type="button" class="btn btn-primary">
                                提交更改
                            </button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal -->
            </div>
        </div>
        <script src="Scripts/style.js"></script>
           <%-- <script>
                $(function () {
                    $("a").click(function () {
                       var aid= $(this).text();
                        $.ajax({
                            type: "post",
                            url: "AlbumManager.aspx/GetAlbumInfo",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data:"{albumid:"+aid+"}",
                            success: function (data) {
                                alert(data.d);
                              //  $("#AlbumModal").modal();
                            },
                            error: function () {
                                alert("------");
                            }
                        });
                       // alert($(this).text());
                        
                    });
                   
                })
            </script>--%>
    </form>
</body>
</html>
