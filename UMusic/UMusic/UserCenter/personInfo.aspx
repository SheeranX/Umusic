<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="personInfo.aspx.cs" Inherits="UMusic.UserCenter.personInfo" %>

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
    <div class="row" id="userInfoDetails">
        <form class="form-horizontal" runat="server">
            <div class="tabbable" id="tabs">
				<ul class="nav nav-tabs">
					<li class="active">
						 <a href="#panel-user" data-toggle="tab">基本信息</a>
					</li>
				</ul>
				<div class="tab-content">
                    <div class="tab-pane active" id="panel-user">
                        <div class="col-md-6">
                            <asp:ListView runat="server" ID="lvuser">
                                <ItemTemplate>
                                    <table class="table_info ">
                                        <tr>
                                            <td class="table_name">用户ID：
                                            </td>
                                            <td>
                                                <%#Eval("userid") %>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="table_name">账号：
                                            </td>
                                            <td>
                                                <%#Eval("UserName") %>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="table_name">注册日期：
                                            </td>
                                            <td>
                                                <%#DataBinder.Eval(Container.DataItem,"createdate","{0:d}")%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="table_name">手机：
                                            </td>
                                            <td>
                                                <%#Eval("phone") %> 
                                                 <a id="cphone">修改</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="table_name">邮箱：
                                            </td>
                                            <td>
                                                <%#Eval("email") %>
                                                 <a id="cemail">修改</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <a class="btn btn-info" id="btnChange" href="changePwd.aspx" target="iframe_a">修改密码</a>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:ListView>
                        </div>
                        <!-- 模态框（Modal） -->
                        <div class="modal fade" id="phoneModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <h5 class="modal-title" id="myModalLabel">修改手机号</h5>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <asp:Label Text="原手机号" runat="server" CssClass="col-md-2 control-label"/>
                                            <div class="col-md-5">
                                                <asp:TextBox runat="server" Text="" ID="tboldphone" CssClass="form-control" />
                                            </div>
                                            <div class="col-md-4">
                                                <asp:RegularExpressionValidator ID="revphone" runat="server" ErrorMessage="手机号格式有误" ValidationExpression="^[1]+[3,5]+\d{9}" ControlToValidate="tboldphone" CssClass="text-danger"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label Text="新手机号" runat="server" CssClass="col-md-2 control-label"/>
                                            <div class="col-md-5">
                                                <asp:TextBox runat="server" Text="" ID="tbnewpwd" CssClass="form-control" />
                                            </div>
                                            <div class="col-md-4">
                                                <asp:RegularExpressionValidator ID="revrep" runat="server" ErrorMessage="手机号格式有误" ControlToValidate="tbnewpwd" ValidationExpression="^[1]+[3,5]+\d{9}" CssClass="text-danger"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                        <asp:Button Text="提交更改" runat="server" CssClass="btn btn-primary" ID="btnchangep" OnClick="btnchangep_Click"/>
                                    </div>
                                </div>
                                <!-- /.modal-content -->
                            </div>
                            <!-- /.modal -->
                        </div>
                          <!-- 模态框（Modal） email-->
                        <div class="modal fade" id="emailModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <h5 class="modal-title" id="myModalemail">修改邮箱</h5>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <asp:Label Text="旧邮箱" runat="server" CssClass="col-md-2 control-label"/>
                                            <div class="col-md-5">
                                                <asp:TextBox runat="server" Text="" ID="tboldemail" CssClass="form-control" />
                                            </div>
                                            <div class="col-md-4">
                                                <asp:RegularExpressionValidator ID="revoldemail" runat="server" ErrorMessage="邮箱格式有误" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="tboldemail" CssClass="text-danger"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label Text="新邮箱" runat="server" CssClass="col-md-2 control-label"/>
                                            <div class="col-md-5">
                                                <asp:TextBox runat="server" Text="" ID="tbnewemail" CssClass="form-control" />
                                            </div>
                                            <div class="col-md-4">
                                                <asp:RegularExpressionValidator ID="revnewemail" runat="server" ErrorMessage="邮箱格式有误" ControlToValidate="tbnewemail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="text-danger"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                        <asp:Button Text="提交更改" runat="server" CssClass="btn btn-primary" ID="btnchangeemail" OnClick="btnchangeemail_Click"/>
                                    </div>
                                </div>
                                <!-- /.modal-content -->
                            </div>
                            <!-- /.modal -->
                        </div>
                        <div class="col-md-6">
                             <div class="udetail">
                            <asp:ListView runat="server" ID="lvdetails" OnItemEditing="lvdetails_ItemEditing" DataKeyNames="userid" OnItemCanceling="lvdetails_ItemCanceling" OnItemUpdating="lvdetails_ItemUpdating">
                                <ItemTemplate>
                                    <table class="table-detail">
                                        <tr>
                                            <td class="table_info hidden">用户ID：
                                            </td>
                                            <td class="hidden">
                                                <%#Eval("userid") %>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="table_name">性别：
                                            </td>
                                            <td>
                                                <asp:RadioButton Text=" 男" runat="server" ID="male" Checked="True" GroupName="gender" />
                                                <asp:RadioButton Text=" 女" runat="server" ID="female" GroupName="gender" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="table_name">生日：
                                            </td>
                                            <td>
                                                <%#DataBinder.Eval(Container.DataItem,"birthday","{0:d}") %>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="table_name">昵称：
                                            </td>
                                            <td>
                                                <%#Eval("nickname") %>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="table_name">地区：
                                            </td>
                                            <td>
                                                <%#Eval("location")%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <asp:Button Text="编辑" runat="server" ID="btnEdit" CommandName="Edit" CssClass="btn btn-info"/>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <EditItemTemplate>
                                     <table class="table-detail">
                                        <tr>
                                            <td class="table_name">性别：
                                            </td>
                                            <td>
                                                <asp:RadioButton Text=" 男" runat="server" ID="male" Checked="True" GroupName="gender" />
                                                <asp:RadioButton Text=" 女" runat="server" ID="female" GroupName="gender" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="table_name">生日：
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="tbBirthday" CausesValidation="False" ClientIDMode="Inherit" Text='<%#DataBinder.Eval(Container.DataItem,"birthday","{0:d}") %>' required/>
                                                <asp:rangevalidator   id="vldRngDate"   runat="server"   CssClass="text-danger"   ErrorMessage="日期有误"   ControlToValidate="tbBirthday"  MinimumValue="1900-01-01"   MaximumValue="2500-12-31"  Type="Date" ></asp:rangevalidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="table_name">昵称：
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="tbnickname" text='<%#Eval("nickname") %>' required/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="table_name">地区：
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="tblocal" Text='<%#Eval("location") %>' required/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <asp:Button Text="更新" runat="server" ID="btnEdit" CommandName="Update" CssClass="btn btn-info"/>
                                                <asp:Button Text="取消" runat="server" ID="btnCancel" CommandName="Cancel" CssClass="btn btn-default"/>
                                            </td>
                                        </tr>
                                    </table>
                                </EditItemTemplate>
                            </asp:ListView>
                        </div>
                        </div>
                    </div>
				</div>
			</div>
        </form>
    </div>
    <style>
        .udetail {
            margin-top:50px;
        }
    </style>
    <script src="../Scripts/style.js"></script>
    <script src="../Scripts/validation.js"></script>
    <script src="../Scripts/dcalendar.picker.js"></script>
    <script>
        $(function () {
            $("#cphone").click(function () {
                $("#phoneModal").modal();
            });
            $("#cemail").click(function () {
                $("#emailModal").modal();
            });
            
        })
    </script>
</body>
</html>
