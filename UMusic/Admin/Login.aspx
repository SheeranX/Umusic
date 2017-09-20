<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Admin.Login" %>

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
        <div class="container">
            <div class="row">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h2 class="panel-title">Hi~ 管理员， 欢迎登陆UMusic</h2>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <form id="form1" runat="server" class="form-horizontal">
                                <div class="form-group">
                                    <asp:Label Text="用户名" runat="server" class="col-md-2 control-label"/>
                                    <div class="col-md-4">
                                        <asp:TextBox runat="server" class="form-control" ID="adminname"/>
                                    </div>
                                    <div class="col-md-2">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="用户名不能为空" ControlToValidate="adminname" SetFocusOnError="True" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label Text="密码" runat="server" class="col-md-2 control-label"/>
                                    <div class="col-md-4">
                                        <asp:TextBox runat="server" class="form-control" ID="password" TextMode="Password" />
                                    </div>
                                    <div class="col-md-2">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="密码不能为空" SetFocusOnError="True" ControlToValidate="password" CssClass="text-danger"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label Text="" runat="server" class="col-md-2 control-label" />
                                    <div class="col-md-6">
                                        <asp:Button Text="登陆" runat="server" CssClass="btn btn-primary" ID="btnLogin" OnClick="btnLogin_Click"/>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
  
    <script src="http://localhost:3030/Scripts/style.js"></script>
</body>
</html>
