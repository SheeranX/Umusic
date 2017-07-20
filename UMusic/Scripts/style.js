$(function(){
    var getNum = null;
	//shopping cart's popover 
    var cartContent = '<ul class="list-group" id="cartList"><li class="list-group-item"><span class="glyphicon glyphicon-shopping-cart"></span><a href="/Cart/Cart">购物车</a></li><li class="list-group-item"><span class="glyphicon glyphicon-heart"></span><a href="/UserCenter/Index">收藏</a></li><li class="list-group-item"><span class="glyphicon glyphicon-inbox"></span><a href="/UserCenter/Index">订单</a></li><li class="list-group-item"><span class="glyphicon glyphicon-cog"></span><a href="/UserCenter/Index">账户</a></li><li class="list-group-item"><span class="glyphicon glyphicon-user"></span><a href="/Function/Login">登录 </a></li><li class="list-group-item"><span class="glyphicon glyphicon-log-out"></span><a href="/LogOut/logout">注销 </a></li></ul>';
	$("#shoppingcart").popover({
				trigger:'click',//manual 触发方式  
                placement : 'bottom', 
                //delay:{show:200,hide:100},
                title:'<div style="text-align:center; color:#000; font-size:14px;width:200px;height:40px;padding:20px 0px;margin:5px 0px">你的购物车</div>',  
                html: 'true',   
                content : cartContent,  //这里可以直接写字符串，也可以 是一个函数，该函数返回一个字符串；  
                animation: false  

	});
	//modal window 
	$("#searchIcon").click(function(){
		$("#searchModal").modal();
	});
	$("#inputSearch").keypress(function(){
		$("#removeText").removeClass("hidden");
	});
	$("#inputSearch").focus(function(){
		$(this).dropdown('toggle');
	});
	$('#removeText').click(function(){
		$('#inputSearch').val('');

	});



    // usercenter 
    $("#_userinfo").click(function(){
       // alert("---");
        $("#userInfoDetails").removeClass("hidden");
        $("#order_user").addClass("hidden");
        $("#user_collection").addClass("hidden");
        $("#usercart").addClass("hidden");

    });
    $("#_order").click(function(){
        //alert("---");
        $("#order_user").removeClass("hidden");
        $("#userInfoDetails").addClass("hidden");
        $("#user_collection").addClass("hidden");
        $("#usercart").addClass("hidden");
    });
    $("#_collection").click(function(){
        //alert("---");
        $("#user_collection").removeClass("hidden");
        $("#userInfoDetails").addClass("hidden");
        $("#order_user").addClass("hidden");
        $("#usercart").addClass("hidden");
    });
    $("#_cart").click(function(){
       // alert("---");
        $("#usercart").removeClass("hidden");
        $("#userInfoDetails").addClass("hidden");
        $("#order_user").addClass("hidden");
        $("#user_collection").addClass("hidden");
    });
    //function for char bot
    $(".btnRoom").click(function () {
        //   alert("--");
        ltgo();
    });

    var width = $(".bot_msg").width();
    if (width > 290)
        $(".bot_msg").width(290);

    var uwidth = $(".me_msg").width();
    if (uwidth > 290)
        $(".me_msg").width(290);

    // Lowering the opacity of all slide in divs
    $('.banneral div').css('opacity', 0.4);

    // Using the hover method 
    $('.banneral').hover(function () {

        // Executed on mouseenter

        var el = $(this);

        // Find all the divs inside the banner div,
        // and animate them with the new size

        el.find('div').stop().animate({ width: 200, height: 200 }, 'slow', function () {
            // Show the "Visit Company" text:
            el.find('p').fadeIn('fast');
        });

    }, function () {

        // Executed on moseleave

        var el = $(this);

        // Hiding the text
        el.find('p').stop(true, true).hide();

        // Animating the divs
        el.find('div').stop().animate({ width: 60, height: 60 }, 'fast');

    }).click(function () {

        // When clicked, open a tab with the address of the hyperlink

        window.open($(this).find('a').attr('href'));

    });

});
// validation number
    function randomNum(min,max){
        return Math.floor(Math.random()*(max-min)+min);
    }
    function randomColor(min,max){
        var _r = randomNum(min,max);
        var _g = randomNum(min,max);
        var _b = randomNum(min,max);
        return "rgb("+_r+","+_g+","+_b+")";
    }
    document.getElementById("canvas").onclick = function(e){
        e.preventDefault();
        drawPic();
    };
    function drawPic(){
        var $canvas = document.getElementById("canvas");
        var _str = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        var _picTxt = "";
        var _num = 4;
        var _width = $canvas.width;
        var _height = $canvas.height;
        var ctx = $canvas.getContext("2d");
        ctx.textBaseline = "bottom";
        ctx.fillStyle = randomColor(180,240);
        ctx.fillRect(0,0,_width,_height);
        for(var i=0; i<_num; i++){
            var x = (_width-10)/_num*i+10;
            var y = randomNum(_height/2,_height);
            var deg = randomNum(-45,45);
            var txt = _str[randomNum(0,_str.length)];
            _picTxt += txt;
            ctx.fillStyle = randomColor(10,100);
            ctx.font = randomNum(80,120)+"px SimHei";
            ctx.translate(x,y);
            ctx.rotate(deg*Math.PI/180);
            ctx.fillText(txt, 0,0);
            ctx.rotate(-deg*Math.PI/180);
            ctx.translate(-x,-y);
        }
        for(var i=0; i<_num; i++){
            ctx.strokeStyle = randomColor(90,180);
            ctx.beginPath();
            ctx.moveTo(randomNum(0,_width), randomNum(0,_height));
            ctx.lineTo(randomNum(0,_width), randomNum(0,_height));
            ctx.stroke();
        }
        for(var i=0; i<_num*10; i++){
            ctx.fillStyle = randomColor(0,255);
            ctx.beginPath();
            ctx.arc(randomNum(0,_width),randomNum(0,_height), 1, 0, 2*Math.PI);
            ctx.fill();
        }
        getNum = _picTxt;
        return _picTxt;
    }
    drawPic();


    function ltgo() {
        var newmsg = $("#lt_put").val();
        if (newmsg == "") {
            alert("内容不能为空");
            return;
        };
        $("#lt_put").css({ "background-image": "url(/images/loader3.gif)", "background-repeat": "no-repeat", "background-position": "270px 10px" });
        addmsg("我：", newmsg);
       // $("#lt_put").val("");
        $.ajax({
            type: "post",
            dataType: "text",
            url: "/Chat/ChatContent?msg=" + $("#lt_put").val(),
            success: function (data) {
                console.log(data);
                addmsg("客服：", data);
                $("#lt_put").css({ "background-image": "none" });
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(XMLHttpRequest.status);
                alert(XMLHttpRequest.readyState);
                alert(textStatus);
            }
        });
    }
    function addmsg(username, msg) {
        var oldhtml = $("#liaotian").html();
        if (username == "我：") {
            newhtml = "<div class='me'><span class='me_img'></span><span class='me_msg'>" + msg + "</span></div>";
        }
        else {
            newhtml = "<div class='bot'><span class='bot_img'></span><span class='bot_msg'>" + msg + "</span></div>";
        }
        $("#liaotian").html(oldhtml + newhtml);
        var scrollTop = $("#liaotian")[0].scrollHeight;
        $("#liaotian").scrollTop(scrollTop);
    }
// addmsg("客服：", "<font style='line-height:40px;'>Hi~~~,和我聊聊天吧，悄悄告诉你</font><br /><br />");


   


