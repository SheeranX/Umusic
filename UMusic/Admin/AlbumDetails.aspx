<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AlbumDetails.aspx.cs" Inherits="Admin.AlbumDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.1.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <link href="Content/font-awesome.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
      <asp:DetailsView ID="dvAlbum" runat="server" Height="300px" Width="600px">

      </asp:DetailsView>
        <p></p>
        <a href="AlbumManager.aspx" target="iframe_a" class="btn btn-info">返回</a>
    </div>
    </form>
</body>
</html>
