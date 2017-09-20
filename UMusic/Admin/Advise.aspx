<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Advise.aspx.cs" Inherits="Admin.Advise" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
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
    <div class="container-fluid">
        <div class="col-md-10">
            <div class="row">
                <!-- check user -->
                <div class="container" id="advise_content">
                    <div class="row">
                        <asp:ListView runat="server" ID="listAdvice">
                            <LayoutTemplate>
                                <table class="table">
                                    <tr>
                                        <td>用户</td>
                                        <td>时间</td>
                                        <td>建议</td>
                                    </tr>
                                    <tr>
                                        <asp:PlaceHolder runat="server" ID="itemPlaceholder" />
                                    </tr>
                                </table>
                            </LayoutTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><%#Eval("userid") %></td>
                                    <td><%#DataBinder.Eval(Container.DataItem,"createdate","{0:d}") %></td>
                                    <td><%#Eval("content") %></td>
                                </tr>
                            </ItemTemplate>
                        </asp:ListView>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <script src="Scripts/style.js"></script>
</body>
</html>
