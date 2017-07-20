<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Collection.aspx.cs" Inherits="UMusic.UserCenter.Collection" %>

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
        <div class="row" id="user_collection">
            <asp:ListView runat="server" ID="lvCollect" DataKeyNames="albumid" OnItemDeleting="lvCollect_ItemDeleting">
                <ItemTemplate>
                    <div class="col-sm-6 col-md-2 thumbnail">
                        <a href='/Home/Product?id=<%#Eval("albumid") %>' target="_blank">
                            <img src='<%#Eval("imagesurl") %>' alt="pic">
                        </a>
                        <div class="caption">
                            <p>歌手： <%#Eval("artistname") %></p>
                            <p>专辑：<%#Eval("albumname") %></p>
                            <p id="cartBtn">
                                <asp:Button Text="移除" runat="server" class="btn btn-default" CommandName="Delete"/>
                            </p>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:ListView>
            <div class="pager">
                <asp:DataPager ID="DataPager" runat="server" PagedControlID="lvCollect" PageSize="5" OnPreRender="DataPager_PreRender">
                    <Fields>
                        <asp:NextPreviousPagerField ShowFirstPageButton="True" ShowLastPageButton="True" ButtonCssClass="btn btn-info" ButtonType="Button"></asp:NextPreviousPagerField>
                    </Fields>
                </asp:DataPager>
            </div>
        </div>
    </form>
    <style>
        #user_collection {
            padding-left:50px;
        }
        .pager {
            margin-top:50px;
            margin-left:100px;
            height:100px;
            width:400px;
        }
    </style>
    <script src="../Scripts/style.js"></script>
    <script src="../Scripts/validation.js"></script>
</body>
</html>
