<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="changePwd.aspx.cs" Inherits="UMusic.UserCenter.changePwd" %>

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
    <form id="form1" runat="server" class="form-horizontal">
        <div id="changepwd">
            <div class="form-group">
                <asp:Label Text="原密码" runat="server" CssClass="col-md-2 control-label" />
                <div class="col-md-5">
                    <asp:TextBox runat="server" Text="" ID="tbpwd" CssClass="form-control" TextMode="Password" required/>
                </div>
                <div class="col-md-4">
                </div>
            </div>
            <div class="form-group">
                <asp:Label Text="新密码" runat="server" CssClass="col-md-2 control-label"/>
                <div class="col-md-5">
                    <asp:TextBox runat="server" Text="" ID="re_pwd" CssClass="form-control" TextMode="Password" required/>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator" runat="server" ErrorMessage="" ControlToValidate="re_pwd" ValidationExpression="\S{6,20}"></asp:RegularExpressionValidator>
                     <!-- THE PROGRESS BAR BEGIN -->
                    <div class="progress">
                        <div class="progress-bar progress-bar-danger" role="progressbar"
                            aria-valuenow="60" aria-valuemin="0" aria-valuemax="100">
                            <span class="sr-only">密码安全度低</span>
                        </div>
                        <div class="progress-bar progress-bar-warning" role="progressbar"
                            aria-valuenow="60" aria-valuemin="0" aria-valuemax="100">
                            <span class="sr-only">密码安全度中</span>
                        </div>
                        <div class="progress-bar progress-bar-success" role="progressbar"
                            aria-valuenow="60" aria-valuemin="0" aria-valuemax="100">
                            <span class="sr-only">密码安全度高</span>
                        </div>
                    </div>
                </div>
                <div class="col-md-5">
                    <p id="re_pwd_info"></p>
                </div>
            </div>
            <div class="form-group">
                <asp:Label Text="" runat="server" CssClass="col-md-2 control-label" />
                <div class="col-md-5">
                    <asp:Button Text="更新" runat="server" CssClass="btn btn-info" id="updatePwd" OnClick="updatePwd_Click"/>
                    <a href="personInfo.aspx" class="pull-right">返回</a>
                </div>
            </div>
        </div>
    </form>
    <script src="../Scripts/validation.js"></script>
    <style>
         #changepwd {
             margin-top:50px;
             margin-left:50px;
             width:600px;
             height:300px;
        }
    </style>
</body>
</html>
