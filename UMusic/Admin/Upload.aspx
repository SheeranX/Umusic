<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Upload.aspx.cs" Inherits="Admin.Upload"%>

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
    <link href="Content/dcalendar.picker.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="info_input">
                <table class="table center-block">
                    <tr>
                        <td>商品编号：</td>
                        <td>
                            <asp:TextBox type="number" name="" class="form-control" required ReadOnly runat="server" ID="albumID"/>
                        </td>
                    </tr>
                    <tr>
                        <td>专辑名：</td>
                        <td>
                            <asp:TextBox type="text" name="albumName" class="form-control" required runat="server" ID="albumName"/>
                        </td>
                    </tr>
                    <tr>
                        <td>流派ID：</td>
                        <td>
                            <%--<asp:TextBox type="number" name="" class="form-control" required ID="genreID" runat="server"/>--%>
                            <asp:DropDownList runat="server" ID="ddlGenreID" DataSourceID="Genre" DataTextField="genreName" DataValueField="genreId" Width="60" Height="30" Font-Bold="False">
                                <asp:ListItem Value="210000">流行</asp:ListItem>
                                <asp:ListItem Value="210001">摇滚</asp:ListItem>
                                <asp:ListItem Value="210002">乡村</asp:ListItem>
                                <asp:ListItem Value="210003">纯音</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="Genre" ConnectionString='<%$ ConnectionStrings:UMusicConnectionString %>' SelectCommand="SELECT [genreId], [genreName] FROM [tb_genre]"></asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>作家：</td>
                        <td>
                            <asp:DropDownList runat="server" ID="ddlArtist" DataSourceID="artist" DataTextField="artistName" DataValueField="artistId" Height="30">
                            </asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="artist" ConnectionString='<%$ ConnectionStrings:UMusicConnectionString %>' SelectCommand="SELECT [artistId], [artistName] FROM [tb_artist]"></asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>地区ID：</td>
                        <td>
                           <%-- <input type="number" name="" class="form-control" required>--%>
                            <asp:DropDownList runat="server" ID="ddlLocalID" DataSourceID="local" DataTextField="localName" DataValueField="localId" Height="30" Width="60">
                                <asp:ListItem Value="86001">欧美</asp:ListItem>
                                <asp:ListItem Value="86002">华语</asp:ListItem>
                                <asp:ListItem Value="86003">日本</asp:ListItem>
                                <asp:ListItem Value="86004">韩国</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="local" ConnectionString='<%$ ConnectionStrings:UMusicConnectionString %>' SelectCommand="SELECT [localId], [localName] FROM [tb_local]"></asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>库存：</td>
                        <td>
                            <asp:TextBox runat="server" type="number" name="" class="form-control" min="1" required ID="tbstorage"/>
                        </td>
                    </tr>
                    <tr>
                        <td>价格：</td>
                        <td>
                            <asp:TextBox runat="server" type="text" name="" class="form-control" required ID="tbPrice"/>
                        </td>
                    </tr>
                    <tr>
                        <td>封面URL：</td>
                        <td>
                            <%--<asp:TextBox runat="server" type="text" name="" class="form-control" required ID="tburl"/> --%>
                            <asp:FileUpload ID="FileUpload" runat="server"/>
                           <%-- <asp:Button Text="上传" runat="server" ID="btnupload" OnClick="btnupload_Click"/>--%>
                        </td>
                    </tr>
                    <tr>
                        <td>添加日期：</td>
                        <td>
                            <asp:TextBox runat="server" type="text" name="" class="form-control" required Width="230" ID="addDate"/>
                        </td>
                    </tr>
                    <tr>
                        <td>发行日期：</td>
                        <td>
                            <asp:TextBox runat="server" type="datetime" name="" class="form-control" required ID="realseDate" Width="230"/> 
                        </td>
                    </tr>
                    <tr>
                        <td>状态：</td>
                        <td>
                            <asp:TextBox runat="server" type="text" name="" class="form-control" required value="上架" readonly ID="tbstatus"/>
                        </td>
                    </tr>
                    <tr>
                        <td>描述：</td>
                        <td>
                            <asp:TextBox runat="server" required TextMode="MultiLine" Width="300" ID="tbdes"/>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button Text="提交" runat="server" class="btn btn-info" ID="btnSubmit" OnClientClick="if(!checkEndTime())return false;" OnClick="btnSubmit_Click"/>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </form>
    <script src="Scripts/style.js"></script>
    <script src="Scripts/dcalendar.picker.js"></script>
    <script>
        $("#realseDate").dcalendarpicker({
            format: 'yyyy-mm-dd'
        });
        $("#addDate").dcalendarpicker({
            format: 'yyyy-mm-dd'
        });
    </script>
</body>
</html>
