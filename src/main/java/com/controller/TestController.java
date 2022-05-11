package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@RequestMapping("/register")
@Controller
public class TestController {

    //下面的注解用于将map打包发给ajax
//    @ResponseBody
//    public Map<String,String> HandleRegister(User user) {
//        Map<String,String> model=new HashMap<>();
//        if (插入不成功) {
//            model.put("warnMsg", "该手机号码已注册，请查看号码是否输入正确或者选择忘记密码");
//        } else {
//            model.put("warnMsg","注册成功，可以进行登录啦！");
//        }
//        return model;
//    }
}
