package com.controller;

import com.dao.CourseMapper;
import com.dao.OptcouMapper;
import com.dao.StudentMapper;
import com.entity.Course;
import com.entity.Optcou;
import com.entity.Student;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("/servlet/TeacherServlet")
public class TeacherController {
    @Autowired
    private CourseMapper courseMapper;
    @Autowired
    private OptcouMapper optcouMapper;
    @Autowired
    private StudentMapper studentMapper;
    @RequestMapping("/lookallcourse")
    public ModelAndView lookallcoursepage( HttpServletRequest request, HttpServletResponse response, String type3) throws IOException {
        ModelAndView modelAndView=new ModelAndView();
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        PrintWriter printWriter=response.getWriter();
        //****************************************************

        if("delete".equals(type3)){
         String cid=  request.getParameter("cid");
       List<Optcou> optcouList= optcouMapper.selectByCid(Integer.valueOf(cid));
                if(optcouList.size()==0){
                    courseMapper.deleteByCid(Integer.valueOf(cid));
                    printWriter.println("<script>alert('删除课程成功')</script>");
                    printWriter.flush();
                }else{
                    printWriter.println("<script>alert('该课程被选择无法删除')</script>");
                    printWriter.flush();
                }

        }

          List<Course> courseList= courseMapper.selectAllCourse();
        modelAndView.addObject("courseList",courseList);


        request.setAttribute("mainPage","/teacher/lookallcourse.jsp");
        modelAndView.setViewName("/user/studentMain");
        return modelAndView;

    }
    @RequestMapping("/lookallstudent")
    public ModelAndView lookallstudentpage(HttpServletRequest request, HttpServletResponse response){
        ModelAndView modelAndView=new ModelAndView();
        List<Student> studentList=studentMapper.selectAllStudent();
       modelAndView.addObject("studentList",studentList);
        request.setAttribute("mainPage","/teacher/lookallstudent.jsp");
        modelAndView.setViewName("/user/studentMain");
        return modelAndView;
    }
    @RequestMapping("/teacheraddcourse")
    public ModelAndView teacheraddcoursepage(HttpServletRequest request,HttpServletResponse response,@RequestParam(required =false)String cid,@RequestParam(required =false)String cname,@RequestParam(required =false)String credit) throws IOException {
        ModelAndView modelAndView=new ModelAndView();
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        PrintWriter printWriter=response.getWriter();
        System.out.println(cid);
        if (cid != null) {
            Course course= courseMapper.seleteCourseByCid(Integer.valueOf(cid));
            if(course!=null){
                printWriter.println("<script>alert('该课号已经存在，请不要重复添加')</script>");
                printWriter.flush();
            }else{
                int result= courseMapper.addCourse(cid,cname,credit);
                if(result==1){
                    printWriter.println("<script>alert('添加成功')</script>");
                    printWriter.flush();
                }else{
                    printWriter.println("<script>alert('数据库添加失败，原因未知')</script>");
                    printWriter.flush();
                }
            }
        }



        request.setAttribute("mainPage","/teacher/teacheraddcourse.jsp");
        modelAndView.setViewName("/user/studentMain");
        return modelAndView;
    }

    @RequestMapping("/teacherdafen")
    public ModelAndView  teacherdafenpage(HttpServletRequest request,HttpServletResponse response,String type5) throws IOException {
        ModelAndView modelAndView=new ModelAndView();
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        PrintWriter printWriter=response.getWriter();
        if("dafen".equals(type5)){
            String  sid= request.getParameter("sid");
            String  cid= request.getParameter("cid");
            String score=request.getParameter("score");
            optcouMapper.updateScore(Integer.valueOf(sid),Integer.valueOf(cid),Integer.valueOf(score));
            printWriter.println("<script>alert('打分成功')</script>");
            printWriter.flush();
        }
        List<Optcou> optcous= optcouMapper.selectAll();
        modelAndView.addObject("optcous",optcous);
        request.setAttribute("mainPage","/teacher/teacherdafen.jsp");
        modelAndView.setViewName("/user/studentMain");
        return modelAndView;
    }
}
