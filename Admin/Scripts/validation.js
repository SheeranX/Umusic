 //new_element=document.createElement("script");
 //new_element.setAttribute("type","text/javascript");
 //new_element.setAttribute("src","style.js");// 在这里引入了style.js
 //document.body.appendChild(new_element);

$(function(){
	var myReg = /^[a-zA-Z]{1}([a-zA-Z0-9]|[-_]){5,19}$/;
	var emailReg = /^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/;
	var phoneReg = /^1[34578]\d{9}$/;


	//alert(drawPic());
	// $("body").click(function(){
	// 	alert("---");
	// });
	//------------
	//validate the uername format
	//-----------
	var username= $("#re_username");
	var username_info = $("#re_username_info");
	var info1 = "支持字母，数字，‘-’，‘_’的组合，6-20个字符";
	var info2 = "用户名格式不正确";
	var info3 = "用户名不能为空";
	var info4 = "用户名已被占用,请重新填写";
	var info5 = "用户名可用";
	Validate(username,username_info,info1,info2,info3,myReg,info4,info5);

	//------------
	//validate the email format
	//-----------
	var email = $("#re_email");
	var email_info = $("#re_eamil_info");
	var einfo1 = "请输入正确邮箱格式，建议使用常用邮箱";
	var einfo2 = "邮箱格式不正确";
	var einfo3 = "邮箱不能为空";
	var einfo4 = "邮箱已注册，请选择其他邮箱";
	var einfo5 = "邮箱可用";
	Validate(email,email_info,einfo1,einfo2,einfo3,emailReg,einfo4,einfo5);
        
	//------------
	//validate the phone_info format
	//-----------
	var phone = $("#re_phone");
	var phone_info = $("#re_phone_info");
	var pinfo1 = "请输入正确手机号，建议使用常用手机号";
	var pinfo2 = "手机格式有误";
	var pinfo3 = "手机号不能为空";
	var pinof4 = "手机号已被绑定";
	var pinfo5 = "手机号可用";
	Validate(phone,phone_info,pinfo1,pinfo2,pinfo3,phoneReg,pinof4,pinfo5);


	//------------
	//validate the password format
	//-----------
	var pwd = $("#re_pwd");
	var pwd_info = $("#re_pwd_info");
	var pwdinfo1 = "建议使用字母，数字和符号及以上的组合，6-20个字符";
	remindInfo(pwd,pwd_info,pwdinfo1);

	$(pwd).keyup(function(){
		var strongRegex = new RegExp("^(?=.{8,20})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
        var mediumRegex = new RegExp("^(?=.{7,20})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
        var enoughRegex = new RegExp("(?=.{6,20}).*", "g");

		if ($(pwd).val()==null||$(pwd).val()==""||$(pwd).val().length<6) {
			//$(pwd_info).html("<font color=red size=2><span class='glyphicon glyphicon-minus-sign'></span> 请使用六位及以上密码,密码不能为空</font>");
				$(".progress-bar-danger").css("width","0%");	
				$(".progress-bar-warning").css("width","0%");
				$(".progress-bar-success").css("width","0%");
		}else{
			if (false == enoughRegex.test($(this).val())) {
				$(".progress-bar-danger").css("width","0%");	
				$(".progress-bar-warning").css("width","0%");
				$(".progress-bar-success").css("width","0%");
			}else if(strongRegex.test($(pwd).val())){
			 	$(pwd_info).html("<font style='color:#ccc'><span class='glyphicon glyphicon-info-sign'></span> 密码安全度（高）</font>");
				$(".progress-bar-danger").css("width","33%");	
				$(".progress-bar-warning").css("width","34%");
				$(".progress-bar-success").css("width","33%");
			}else if(mediumRegex.test($(pwd).val())){
				$(pwd_info).html("<font style='color:#ccc'><span class='glyphicon glyphicon-info-sign'></span> 密码安全度（中）</font>");
				$(".progress-bar-danger").css("width","33%");
				$(".progress-bar-warning").css("width","34%");
				$(".progress-bar-success").css("width","0%");
			}else{
				$(pwd_info).html("<font style='color:#ccc'><span class='glyphicon glyphicon-info-sign'></span> 密码有被盗风险，建议修改密码</font>");
				$(".progress-bar-danger").css("width","33%");
				$(".progress-bar-warning").css("width","0%");
				$(".progress-bar-success").css("width","0%");

			}
		}
	  
	});
	$("#re_pwd").blur(function(){
		if ($(this).val()==null||$(this).val()==""||$(this).val().length<6) {
			$(pwd_info).html("<font color=red size=2><span class='glyphicon glyphicon-minus-sign'></span> 请使用六位及以上密码,密码不能为空</font>");
		}
	});
	
	//-------------
	//validate the validation code 
	//----------------
	var validateCode = $("#re_validation");
	var validateCodeInfo = $("#validateNumInfo");
	var vInfo = "请输入正确验证码，注意验证码区分大小写";

	remindInfo(validateCode,validateCodeInfo,vInfo);
	$("#re_validation").blur(function(){
		var value = $(this).val();
		var num = getNum;
		if (value!=num) {
			$("#validateNumInfo").html("<font color=red size=2><span class='glyphicon glyphicon-minus-sign'></span> 验证码不正确</font>");
		}
	});
	

	$("#re_submit").click(function () {
		var rgb = $("#re_username_info>font").css("color");
		var rgb_1 = $("#re_eamil_info>font").css("color");
		var rgb_2 = $("#re_phone_info>font").css("color");
		var rgb_3 = $("#re_pwd_info>font").css("color");
		var rgb_4 = $("#validateNumInfo>font").css("color");
		if (rgb=="rgb(255, 0, 0)"||rgb_1=="rgb(255, 0, 0)"||rgb_2=="rgb(255, 0, 0)"||rgb_3=="rgb(255, 0, 0)"||rgb_4=="rgb(255, 0, 0)") {
			alert("注册失败，请填写正确信息");
			return false;
		}else if ($(re_username).val()==""||$(re_username).val()==null||$(re_email).val()==""||$(re_email).val()==null||$(re_phone).val()==null||$(re_phone).val()==""||$(re_pwd).val()==null||$(re_pwd).val()==""||$(re_validation).val()==null||$(re_validation).val()=="") {
			alert("请先填写信息");
			return false;
		}
	
		//alert("rgb:"+$("#re_username_info>font").css("color"));

	});
	//-------------
	//validate the user login
	//----------------
	var loginUser = $("#login_username");
	var loginUserInfo = $("#userloginInfo");
	var loginUserInfo1 = "使用用户名/邮箱/手机号 登录";
	remindInfo(loginUser, loginUserInfo, loginUserInfo1);

    //ajax for collection

	$("#collect").click(function () {
	  // var dataSend = JSON.stringify({ "albumName": "PSY六甲", "username": "PSY" });
	    if ($("#_username").is(":empty")) {
	        $("#warningModal").modal();
	        $("#modal_info").text("您还没登录，登录之后才可以对商品进行收藏");
	    }
	    else {
	        $.ajax({
	            type: 'POST',
	            dataType:'text',
	            url: '/Function/AjaxCollection?albumName='+$("#_albumname").text(),
	           // contentType:"application/json",
	            success: function (data) {
	                if ("true" == data)
	                    alert("收藏成功");
	                else
	                    alert("该专辑已经添加过了");
	            }
	        });
	       // alert("收藏成功");
	    }

	});

	$("#buy").click(function () {
	  
	    if ($("#_username").is(":empty")) {
	        $("#warningModal").modal();
	        $("#modal_info").text("您还没登录，登录之后才可以对商品进行购买");
	      
            return false
	    }
	        //  var number = $("#qunatity").val();
	    else {
	        if (parseInt($("#qunatity").val()) > parseInt($("#storage").text())) {
	            alert("抱歉！库存不足");
	            $(this).val(1);
	            return false;
	        }
	        if ($("#qunatity").val() == null || $("#qunatity").val() == "")
	        {
	            alert("请输入购买数量");
	        }
	            var jsonVal = "{\"albumId\":\"" + $("#_number").text() + "\", \"quantity\":\"" + $("#qunatity").val() + "\",\"username\":\"" + $("#_username").text() + "\"}";
	            $.ajax({
	                type: "POST",
	                dataType: "text",
	                url: "/Cart/Order",
	                data: jsonVal,
	                contentType: "application/json",
	                success: function (data) {
	                    if ("false" == data)
	                        alert("库存不足，无法完成购买");
                        else
	                        location.href="/Cart/Order?id="+data+"";
	                }
	                //error: function (XMLHttpRequest, textStatus, errorThrown) {
	                //    alert(XMLHttpRequest.status);
	                //    alert(XMLHttpRequest.readyState);
	                //    alert(textStatus);
	                //    alert("无法添加购物车");
	                //}

	            });
	    }

	    
	});

	$("#submitPay").click(function () {
	    var paydata = "{\"orderID\":\"" + $("#payorderid").text() + "\",\"paypassword\":\"" + $("#paypassword").val() + "\"}";
	    $.ajax({
	        type: "post",
	        dataType: "text",
	        url: "/Cart/Pay?str=" + $("#paypassword").val(),
            data:paydata,
	        contentType: "application/json",
	        success: function (data) {
	            if ("true" == data)
	            {
	                $("#successInfo").removeClass('hidden');
	                $("#inputPWD").addClass("hidden");
	                $(".uercenter").removeClass("hidden");
	            }
	                

	            else
	                alert('密码错误');
	        },

	    });
	});

	$("#addCart").click(function () {
	    if ($("#_username").is(":empty")) {
	        $("#warningModal").modal();
	        $("#modal_info").text("您还没登录，登录之后才可以对商品进行添加");
	        return false
	    }
	    else {
	        if (parseInt($("#qunatity").val()) > parseInt($("#storage").text())) {
	            alert("抱歉！库存不足");
	            $(this).val(1);
	            return false;
	        }
	        if ($("#qunatity").val() == null || $("#qunatity").val() == "") {
	            alert("请输入添加数量");
	        }
	        var jsonData = "{\"albumId\":\"" + $("#_number").text() + "\", \"quantity\":\""+ $("#qunatity").val() + "\"}";
	        $.ajax({
	            type:"post",
	            dataType: "text",
	            contentType: "application/json",
	            url: "/Cart/CartAdd",
	            data: jsonData,
	            success: function (data) {
	                alert(data);
	            },
	            //error: function (XMLHttpRequest, textStatus, errorThrown) {
	            //    alert(XMLHttpRequest.status);
	            //    alert(XMLHttpRequest.readyState);
	            //    alert(textStatus);
	            //}
	        });
	    }
	});
	$("#qunatity").keyup(function () {
	    if (parseInt($(this).val()) > parseInt($("#storage").text()))
	    {
	        alert("抱歉！库存不足");
	        $(this).val(1);
	    } 
	});
	$("#qunatity").blur(function () {
	    if (isNaN(parseInt($(this).val())))
            $(this).val("");
	});

	$("#btncartid").click(function () {
	    $.ajax({
            type:"post",
            dataType: "text",
            url: "/Cart/CreateCartOrderID?cid=" + $("#cartid").text(),
            success: function (data) {
                //  alert(data);
                location.href = "/Cart/Pay?id="+data+"";
            },
	        //error: function (XMLHttpRequest, textStatus, errorThrown) {
	        //    alert(XMLHttpRequest.status);
	        //    alert(XMLHttpRequest.readyState);
	        //    alert(textStatus);
	        //}
	    });
            
	});

	$(".btnremove").click(function () {
	   //alert($(this).attr("id"));
	    $.ajax({
	        type: "post",
            dataType:"text",
	        url: "/UserCenter/CoRemove?id=" + $(this).attr("id"),
	        success: function (data) {
	            alert(data);
	        },
	        complete: function () {
	            location.href="/UserCenter/Index";
	        }
	    });

	});
	$(".btnorderRemove").click(function () {
	    $.ajax({
	        type: "post",
	        dataType: "text",
	        url: "/UserCenter/orderRemove?id=" + $(this).attr("id"),
	        success: function (data) {
	            location.href = "/UserCenter/Index";
	        }
	    });
	   // alert($(this).attr("id"));
	});

	$("#btnsave").click(function () {
	    $.ajax({
	        type: "post",
	        dataType: "text",
	        url: "/UserCenter/changeInfo?nickname=" + $("#nickname").val(),
	        success: function (data) {
	            alert(data);
	        }
	    });
	});
	$(".btncobuy").click(function () {
	    var dataOrder = "{\"albumId\":\"" + $(this).attr("id") + "\", \"quantity\":\"1\",\"username\":\"" + $("#_username").text() + "\"}";
	    $.ajax({
	        type: "post",
	        dataType: "text",
	        url: "/Cart/Order",
	        contentType: "application/json",
	        data: dataOrder,
	        url:"/Cart/Order",
	        success: function (data) {
	            if ("false" == data)
	                alert("库存不足，无法完成购买");
	            location.href = "/Cart/Order?id="+data+"";
	            //alert(data);
	        }
	    });
	});
});


function Validate(paraInput,paraInfo,valInfo1,valInfo2,varInfo3,myReg,varinfo4,varinfo5){
	$(paraInput).focus(function(){
		$(paraInfo).html("<font style='color:#ccc'><span class='glyphicon glyphicon-info-sign'></span> "+valInfo1+"</font>");
	});
	$(paraInput).blur(function(){
		if($(this).val()==""||$(this).val()==null){
			$(paraInfo).html("<font style='color:red' size=2><span class='glyphicon glyphicon-minus-sign'></span> "+varInfo3+"</font>");
		} else if (!myReg.test($(this).val())) {
		    $(paraInfo).html("<font style='color:red' size=2><span class='glyphicon glyphicon-minus-sign'></span> " + valInfo2 + "</font>");
		} else {
		    AjaxVal(paraInput, paraInfo, varinfo4, varinfo5);
		}
	});

}
function remindInfo(paraInput,paraInfo,valInfo){
	$(paraInput).focus(function(){
		$(paraInfo).html("<font style='color:#ccc'><span class='glyphicon glyphicon-info-sign'></span> "+valInfo+"</font>");
	});
	$(paraInput).blur(function () {

	    $.ajax({
	        type: "POST",
	        url: "/Function/AjaxForLogin?str=" + $("#login_username").val(),
	        dataType: 'text',
	        beforeSend: function () {
	            $("#loading").removeClass("hidden");
	        },
	        success: function (info) {
	            $("#loading").addClass("hidden");
	            if ("true" == info)
	                $(".ok").removeClass("hidden");
	            else
	            {
	                $(".ok").addClass("hidden");
	                $("#userloginInfo").html("<font style='color:red' size=2><span class='glyphicon glyphicon-minus-sign'></span> 该账号未注册</font>");
	            }
	        }

	    });
	});

}
//--------------
//Ajax for user validation 
//----------------
function AjaxVal(e,remind,einfo,ninfo) {
    $.ajax({
        type: "POST",
        url: "/Function/AajxVal?str=" + $(e).val(),
        dataType: "text",
        beforeSend:function(){
            $("#loading").removeClass("hidden");
        },
        success: function (info) {
            $("#loading").addClass("hidden");
            if ("exist" == info)
                $(remind).html("<font style='color:red' size=2><span class='glyphicon glyphicon-minus-sign'></span> " + einfo + "</font>");
            if ("none" == info)
                $(remind).html("<font style='color:green' size=2><span class='glyphicon glyphicon-ok'></span> " + ninfo + "</font>");
           // $("#re_username_info").html(info);
        }
    });
}
function getUrlParam(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
    var r = window.location.search.substr(1).match(reg);  //匹配目标参数
    if (r != null) return unescape(r[2]); return null; //返回参数值
}


