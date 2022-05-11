<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/5/6
  Time: 15:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<!-- 我用的是模式框 -->
<div id="register" class="modal fade" tabindex="-1">
    <div class="modal-dialog" id="modal">
        <div class="modal-content">
            <div class="modal-body">
                <!-- 模式框右上角的按钮 -->
                <button class="close" data-dismiss="modal" id="close" onclick="reset('registerForm')">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-title">
                <h1 class="text-center">注册</h1>
            </div>
            <div class="modal-body">
                <!-- 注册表单 -->
                <form class="form-group" id="registerForm" action="#" method="post" enctype="multipart/form-data" onsubmit="return false">
                    <div class="form-group">
                        <span class="glyphicon glyphicon-user"></span>
                        <label for="userIdForR">帐号</label>
                        <input class="form-control" type="text" name="userId" id="userIdForR"
                               placeholder="手机号码注册">
                    </div>
                    <div class="form-group">
                        <span class="glyphicon glyphicon-lock"></span>
                        <label for="password1ForR">密码</label>
                        <input class="form-control" type="password" name="password" id="password1ForR"
                               placeholder="至少6位且不多于20位的字母或数字">
                    </div>
                    <div class="form-group">
                        <span class="glyphicon glyphicon-lock"></span>
                        <label for="password2ForR">再次输入密码</label>
                        <input class="form-control" type="password" name="confirmPassword" id="password2ForR"
                               placeholder="至少6位且不多于20位的字母或数字">
                    </div>
                    <div class="form-group">
                        <span class="glyphicon glyphicon-ok"></span>
                        <label for="mail">邮箱</label>
                        <input class="form-control" type="email" name="mail" id="mail" placeholder="例如:123@123.com">
                    </div>
                    <div class="text-right">
                        <button class="btn btn-primary" type="button" id="submit" onclick="register()">提交
                        </button>
                        <button class="btn btn-danger" data-dismiss="modal" onclick="reset('registerForm')">取消</button>
                    </div>
                    <a href="" data-toggle="modal" data-dismiss="modal" data-target="#login">已有账号？点我登录</a>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    function register() {
        //校验注册表单里的信息是否正确
        if (!validate())
            return;
        //registerForm为表单的id，formdata可以获取表单的数据，比较方便
        var form = new FormData(document.getElementById("registerForm"));
        $.ajax({
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "/register",//要响应的url
            data: form,
            async: false,   //false为同步，true为异步
            processData: false,
            contentType: false,
            success: function (data) {
                //表示注册不成功，由于控制器返回的是map，所以就可以用data[key]
                alert(data["warnMsg"]);
                if (result["warnMsg"].search("成功") != -1) {
                    document.getElementById("registerForm").reset();
                    //关闭窗口，close为模式框右上角按钮的id
                    document.getElementById("close").click();
                }
            },
            error: function (result) {
                alert("出现异常");
                //刷新窗体
                window.location.href = window.location.href;
            }
        });
    }
</script>
</html>
