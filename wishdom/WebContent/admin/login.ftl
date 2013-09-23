<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登陆</title>
	<#assign contextPath = request.contextPath /> 
<link rel="stylesheet" type="text/css" href="${contextPath}/style/login.css"/>
<script>
		function submitClick(){
			document.getElementById("sms").submit();
		}
</script>
</head>

<body>
	<div class="box">
        <div id="box1">
            <div class="middle">
            <form action="login.htm" method="post" id="sms">
                <div class="name">
                	<span class="namezt">用户名：</span>
                    <input type="text"  class="wenbenkuang" name="userName"/>
                </div>
                <div class="mima">
                	<span class="namezt">密 &nbsp;码：</span>
                    <input type="text" class="wenbenkuang1" name="password"/>
                </div>
                <div class="anniu">
                	<input type="button"  class="anniu1" onClick="submitClick()"/>
                    <input type="button" class="anniu2"/>
                </div>
                </form>
            </div>
            <div class="middle1"></div>
        </div>
    </div>
   

</body>
</html>