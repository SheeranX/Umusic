<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="UMusic.UserCenter.Index" %>

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
    <form id="form1" runat="server" class="form-group" action="/Home/Search" method="post" name="Search">
        <div class="container">
            <!-- 导航开始 -->
            <div class="row">
                <nav class=" navbar navbar-default navbar-fixed-top" role="navigation" id="navtop">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#ex-navbar-collapse">
                                <span class="sr-only"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a href="/Home/Index" class="navbar-brand">Umusic</a>
                        </div>
                        <div class="collapse navbar-collapse" id="ex-navbar-collapse">
                            <ul class="nav navbar-nav">
                                <li><a href="/Home/Album">音乐专辑 </a></li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" id="genre">歌曲流派
                                    <b class="caret"></b>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="/Home/Genre?id=210000">流行</a></li>
                                        <li><a href="/Home/Genre?id=210001">摇滚</a></li>
                                        <li><a href="/Home/Genre?id=210002">乡村</a></li>
                                        <li><a href="/Home/Genre?id=210003">纯音</a></li>
                                    </ul>
                                </li>

                                <li><a href="/Home/ArtistLooking">艺术家 </a></li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" id="local">发行地区
                                    <b class="caret"></b>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="/Home/Local?id=86001">欧美</a></li>
                                        <li><a href="/Home/Local?id=86002">华语</a></li>
                                        <li><a href="/Home/Local?id=86004">韩国</a></li>
                                        <li><a href="/Home/Local?id=86003">日本</a></li>
                                    </ul>
                                </li>
                                <li><a href="">联系我们 </a></li>

                                <li><a href="/Chat/Index">客服服务 </a></li>
                                <li><a id="searchIcon"><span class="glyphicon glyphicon-search"></span></a></li>
                                <li id="cart"><a id="shoppingcart"><span class="glyphicon glyphicon-shopping-cart"></span></a></li>
                                <li id="_username" class="hidden">@Session["username"]</li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <!-- modal windows for search-->
                <div class="modal fade" id="searchModal" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-body">
                            <%--<form class="form-group" action="/Home/Search" method="post" name="Search">--%>
                            <div class="searchData">
                                <span class="glyphicon glyphicon-search"></span>
                                <input type="text" id="inputSearch" name="inputSearch" />
                                <a class="glyphicon glyphicon-remove-sign hidden" id="removeText"></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container user_container">
            <div class="row">
                <div class="col-md-2">
                    <div class="text-center">
                        <img src="..\imgs\header.png" width="120px" height="120px" class="img-circle" alt="img">
                        <p>Hi~ </p>
                    </div>
                    <hr>
                    <div class="list-group">
                        <a class="list-group-item" id="_userinfo" href="personInfo.aspx" target="iframe_a">
                            <p class="list-group-item-text text-center">个人信息</p>
                        </a>
                        <a class="list-group-item" id="_order" href="OrderManager.aspx" target="iframe_a">
                            <p class="list-group-item-text text-center">订单管理</p>
                        </a>
                        <a class="list-group-item" id="_collection" href="Collection.aspx" target="iframe_a">
                            <p class="list-group-item-text text-center">收藏夹</p>
                        </a>
                        <a class="list-group-item" id="_cart" href="/Cart/Cart" target="_blank">
                            <p class="list-group-item-text text-center">购物车</p>
                        </a>
                    </div>
                </div>
                <div class="col-md-10">
                    <iframe src="personInfo.aspx" width="1000px" height="600px" name="iframe_a" frameborder="0"></iframe>
                </div>
            </div>
        </div>
    </form>
    <style>
        .dropdown-menu {
            background: #000;
        }

            .dropdown-menu > li > a:hover,
            .dropdown-menu > li > a:focus {
                color: #262626;
                text-decoration: none;
                background-color: #000;
            }

        .dropdown > a:focus {
            background: #000;
        }

        .dropdown-menu > a:focus {
            background: #000;
        }
    </style>
    <script>
        $(function () {
            $(".dropdown>a").click(function () {
                $("#genre").css("background", "black");
                $("#local").css("background", "black");
            });
        })
    </script>
    <script src="../Scripts/style.js"></script>
    <script src="../Scripts/validation.js"></script>
</body>
</html>
