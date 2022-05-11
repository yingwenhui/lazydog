package com.controller;

import com.dao.CourseMapper;
import com.dao.OptcouMapper;
import com.entity.Course;
import com.entity.Optcou;
import com.entity.Student;
import com.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("/servlet/LoginServlet")
public class LoginController {
    @Autowired
    private StudentService studentService;
    @Autowired
    private CourseMapper courseMapper;
    @Autowired
     private OptcouMapper optcouMapper;
    @RequestMapping("/login")
    public ModelAndView Login(String number, String password, HttpSession session,String identity){
        ModelAndView modelAndView=new ModelAndView();
        Student student=studentService.login(number,password);
        if(student!=null){
            session.setAttribute("student",student);
            session.setAttribute("identity",identity);

                modelAndView.setViewName("/user/studentMain");
                return modelAndView;
        }
        else{
            modelAndView.setViewName("redirect:/index.jsp");
        }
        return modelAndView;

    }
    @RequestMapping("/firstpage")
    public ModelAndView studentpage(HttpServletRequest request){
        ModelAndView modelAndView=new ModelAndView();
        request.setAttribute("mainPage","/user/myfirst.jsp");
        modelAndView.setViewName("/user/studentMain");
return modelAndView;

    }
    @RequestMapping("/select")
    public ModelAndView selectpage(HttpSession session, HttpServletRequest request, String type2, HttpServletResponse response) throws IOException {
        Student student=(Student)session.getAttribute("student");
        ModelAndView modelAndView=new ModelAndView();

        if("add".equals(type2)){
            System.out.println(request.getParameter("cadd"));
            Integer cid=Integer.valueOf(request.getParameter("cadd"));
            //Course course= courseMapper.seleteCourseByCid();

           int result= optcouMapper.insertOptcouByCidAnd(student.getSid(),cid);
            System.out.println(result==1);
           if(result==1){
            response.setCharacterEncoding("utf-8");
            response.setContentType("text/html; charset=utf-8");
               PrintWriter printWriter=response.getWriter();
               printWriter.println("<script>alert('添加成功')</script>");
               printWriter.flush();
           }

        }
      List<Course> courseList= courseMapper.selectAllCourse();
       List<Optcou> optcouList= optcouMapper.selectOptcouBySid(student.getSid());

      modelAndView.addObject("courseList",courseList);
        modelAndView.addObject("optcouList",optcouList);
        String status="未选";
        request.setAttribute("status",status);
        request.setAttribute("mainPage","/user/select.jsp");
        modelAndView.setViewName("/user/studentMain");
        return modelAndView;

    }
    @RequestMapping("/look")
    public ModelAndView lookpage(HttpSession session,HttpServletRequest request,String type){
        ModelAndView modelAndView=new ModelAndView();
        Student student=(Student)session.getAttribute("student");

        List<Optcou> optcous= optcouMapper.selectAllBySid(student.getSid());

        modelAndView.addObject("optcous",optcous);
        if("tuike".equals(type)){
           String  sid= request.getParameter("sid");
           String  cid= request.getParameter("cid");
            optcouMapper.deleteoptcouBySidAndCid(Integer.valueOf( sid),Integer.valueOf(cid));
             optcous= optcouMapper.selectAllBySid(student.getSid());
            modelAndView.addObject("optcous",optcous);
        }

        request.setAttribute("mainPage","/user/look.jsp");
        modelAndView.setViewName("/user/studentMain");
        return modelAndView;
    }
//    @RequestMapping("/uncourse")
//    public ModelAndView uncoursepage(Integer sid,Integer cid ){
//
//        ModelAndView modelAndView=new ModelAndView();
//        return modelAndView;
//    }
    @RequestMapping("/un")
    public ModelAndView unloginpage(HttpSession session){
        ModelAndView modelAndView=new ModelAndView();
        session.invalidate();
        modelAndView.setViewName("redirect:/index.jsp");
        return modelAndView;

    }

}
