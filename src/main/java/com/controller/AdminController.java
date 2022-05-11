package com.controller;

import com.dao.CourseMapper;
import com.dao.OptcouMapper;
import com.dao.StudentMapper;
import com.entity.Course;
import com.entity.Optcou;
import com.entity.Student;
import com.service.StudentService;
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
@RequestMapping("/servlet/AdminServlet")
public class AdminController {
    @Autowired
    private StudentService studentService;
    @Autowired
    private CourseMapper courseMapper;
    @Autowired
    private StudentMapper studentMapper;
    @Autowired
    private OptcouMapper optcouMapper;
    @RequestMapping("/lookallcourse")
    public ModelAndView lookallcoursepage(HttpServletRequest request, HttpServletResponse response, String type6,Course course2) throws IOException {
        ModelAndView modelAndView=new ModelAndView();
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        PrintWriter printWriter=response.getWriter();

        //****************************************************

        if("delete".equals(type6)){
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
        if("update".equals(type6)){
            String cid=  request.getParameter("cid");
           Course course= courseMapper.seleteCourseByCid(Integer.valueOf(cid));
           modelAndView.addObject("course",course);
            request.setAttribute("mainPage","/admin/updatecourse.jsp");
            modelAndView.setViewName("/user/studentMain");
            return modelAndView;
        }
        if("updateend".equals(type6)){
          int result=  courseMapper.updatecourse(course2);
            if(result==1){
                printWriter.println("<script>alert('修改课程成功')</script>");
                printWriter.flush();
            }else{
                printWriter.println("<script>alert('修改失败')</script>");
                printWriter.flush();
            }

        }

        List<Course> courseList= courseMapper.selectAllCourse();
        modelAndView.addObject("courseList",courseList);


        request.setAttribute("mainPage","/admin/lookallcourse.jsp");
        modelAndView.setViewName("/user/studentMain");
        return modelAndView;

    }
    @RequestMapping("/lookallstudent")
    public ModelAndView lookallstudentpage(HttpServletRequest request, HttpServletResponse response,String type7) throws IOException {
        ModelAndView modelAndView=new ModelAndView();
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        PrintWriter printWriter=response.getWriter();
        //###############################################
        if("deletestudent".equals(type7)){
           String sid= request.getParameter("sid");
           int result1= optcouMapper.deleteoptcouBySid(Integer.valueOf(sid));
         int result2 =studentMapper.deleteStudentBySid(Integer.valueOf(sid));
            if(result1==1&&result2==1){
                printWriter.println("<script>alert('删除学生成功')</script>");
                printWriter.flush();
            }else{
                printWriter.println("<script>alert('删除学生失败')</script>");
                printWriter.flush();
            }

        }

        List<Student> studentList=studentMapper.selectAllStudent();
        modelAndView.addObject("studentList",studentList);
        request.setAttribute("mainPage","/admin/lookallstudent.jsp");
        modelAndView.setViewName("/user/studentMain");
        return modelAndView;
    }
    @RequestMapping("/adminaddstudent")
    public ModelAndView adminaddstudentpage(HttpServletRequest request, HttpServletResponse response,Student student1,String type8) throws IOException {
        ModelAndView modelAndView=new ModelAndView();
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        PrintWriter printWriter=response.getWriter();
        //###############################################
        if("updatestudentend".equals(type8)){
           Student student= studentMapper.selectBySid(student1.getSid());
           if(student!=null){
               printWriter.println("<script>alert('该学号已经存在，添加学生失败')</script>");
               printWriter.flush();
           }else {
               int result=studentMapper.insertStudent(student1);
               if(result==1){
                   printWriter.println("<script>alert('添加学生成功')</script>");
                   printWriter.flush();
               }else{
                   printWriter.println("<script>alert('添加学生失败')</script>");
                   printWriter.flush();
               }
           }

        }


        request.setAttribute("mainPage","/admin/adminaddstudent.jsp");
        modelAndView.setViewName("/user/studentMain");
        return modelAndView;
    }
    @RequestMapping("/adminaddcourse")
    public ModelAndView teacheraddcoursepage(HttpServletRequest request, HttpServletResponse response, @RequestParam(required =false)String cid, @RequestParam(required =false)String cname, @RequestParam(required =false)String credit) throws IOException {
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



        request.setAttribute("mainPage","/admin/adminaddcourse.jsp");
        modelAndView.setViewName("/user/studentMain");
        return modelAndView;
    }
}
