<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckUser.aspx.cs" Inherits="Admin.CheckUser" %>

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
    <div class="container-fluid">
	
	<div class="col-md-10">
		<div class="row">
			<!-- check user -->
			<div class="container" id="userInfo_content">
				<div class="row clearfix">
					<div class="col-md-12 column">
						<div class="tabbable" id="tabs">
							<ul class="nav nav-tabs">
								<li class="active">
									 <a href="#panel-allUser" data-toggle="tab">所有用户</a>
								</li>
								<li>
									 <a href="#panel-newUser" data-toggle="tab">新用户</a>
								</li>
								<li>
									 <a href="#panel-delUser" data-toggle="tab">已注销用户</a>
								</li>
							</ul>
							<div class="tab-content">
                                <%--所用用户--%>
                                     <div class="tab-pane active" id="panel-allUser">
									        <table class="table">
                                                <asp:ListView runat="server" ID="listUser">
                                                    <LayoutTemplate>
                                                        <table class="table">
                                                            <thead>
                                                                <tr>
                                                                    <th>用户编号</th>
                                                                    <th>用户名</th>
                                                                    <th>邮箱</th>
                                                                    <th>手机号</th>
                                                                    <th>注册时间</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <asp:PlaceHolder runat="server" ID="itemPlaceholder" />
                                                            </tbody>
                                                        </table>
                                                    </LayoutTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td><%#Eval("userid") %></td>
                                                            <td><%#Eval("username") %></td>
                                                            <td><%#Eval("email") %></td>
                                                            <td><%#Eval("phone") %></td>
                                                            <td><%#DataBinder.Eval(Container.DataItem,"createdate","{0:d}") %></td>
                                                        </tr>
                                                    </ItemTemplate>
                                                </asp:ListView>
									        </table>
								        </div>
                              
								
								<div class="tab-pane" id="panel-newUser">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>用户编号</th>
												<th>用户名</th>
												<th>邮箱</th>
												<th>手机号</th>
												<th>注销时间</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>560001</td>
												<td>Tanmay</td>
												<td>Bangalore</td>
												<td>560001</td>
												<td>560001</td>
											</tr>
											<tr>
												<td>560001</td>
												<td>Sachin</td>
												<td>Mumbai</td>
												<td>400003</td>
												<td>400003</td>
											</tr>
											<tr>
												<td>560001</td>
												<td>Uma</td>
												<td>Pune</td>
												<td>411027</td>
												<td>411027</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="tab-pane" id="panel-delUser">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>用户编号</th>
												<th>用户名</th>
												<th>邮箱</th>
												<th>手机号</th>
												<th>注册时间</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>560001</td>
												<td>Tanmay</td>
												<td>Bangalore</td>
												<td>560001</td>
												<td>560001</td>
											</tr>
											<tr>
												<td>560001</td>
												<td>Sachin</td>
												<td>Mumbai</td>
												<td>400003</td>
												<td>400003</td>
											</tr>
											<tr>
												<td>560001</td>
												<td>Uma</td>
												<td>Pune</td>
												<td>411027</td>
												<td>411027</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</div>
    <script src="Scripts/style.js"></script>
</body>
</html>
