<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    /*
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                + path + "/";
        String userName = null;
        String userPassword = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("userName")) {
                    userName = cookie.getValue();
                }
                if (cookie.getName().equals("userPassword")) {
                    userPassword = cookie.getValue();
                }
            }
        }
        */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>界面登录</title>
</head>
<style>
    #first {
        position: absolute;
        top: 130px;
        left: 540px;
    }
</style>
<body>
<form action="users/login" method="post">
    <div id="first">
        <h2 style="text-align: center">登 陆 系 统</h2>
        <br>
        用户名
        <input id="userName" type="text" name="userName"/>
        <!-- placeholder="邮箱/用户名/已验证手机"-->
        <br> <br>
        密&emsp;码
        <input id="userPassword" type="password" name="userPassword"/>
        <br>
        <br>
        <input id="loginButton" type="submit" name="login" value="登&nbsp;&nbsp;&nbsp;陆"
               style='font-size: 20px; width: 230px; height: 35px; background-color: #E24D46'/>
    </div>
</form>
</body>
</html>