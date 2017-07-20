<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Admin.Admin" %>

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
            <div class="col-md-2">
                <div class="row">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title"><strong>UMusic</strong> <a href="Admin.aspx">Admin</a> </h3>
                        </div>
                        <div class="panel-body">
                            <ul class="nav_list">
                                <a id="check_user" href="CheckUser.aspx" target="iframe_a">
                                    <li>查看用户</li>
                                </a>
                                <a id="manager_order" href="OrderManager.aspx" target="iframe_a">
                                    <li>订单管理</li>
                                </a>
                                <a id="manager_commodity" href="AlbumManager.aspx" target="iframe_a">
                                    <li>商品管理</li>
                                </a>
                                <a id="upload" href="Upload.aspx" target="iframe_a">
                                    <li>商品上架</li>
                                </a>

                                <a id="check_advice" href="Advise.aspx" target="iframe_a">
                                    <li>查看建议</li>
                                </a>
                            </ul>
                            <hr>
                            <p class="text-danger">&nbsp;FBI Warning：</p>
                            <p class="warning_text">
                                &nbsp;&nbsp;管理员请遵守相关规章制度，不得在未经许可的情况下，对以上任何一项
						信息进行修改，违者将根据相关规定进行处罚。
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-10">
                <div class="row">
                    <nav class="nav_header">
                        <ul class="nav_bar">
                            <li><a>欢迎！管理员</a></li>
                            <li>
                                <asp:LinkButton Text="注销" runat="server" ID="loginOut" OnClick="loginOut_Click" />
                            </li>
                        </ul>
                    </nav>
                    <iframe src="Charts.aspx" width="1000px" height="600px" name="iframe_a" frameborder="0"></iframe>
                </div>
            </div>
        </div>
        <script src="Scripts/style.js"></script>
    </form>
</body>
</html>
