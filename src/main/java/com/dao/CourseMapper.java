package com.dao;

import com.entity.Course;
import com.entity.CourseExample;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface CourseMapper {
    List<Course> selectAllCourse();
    int countByExample(CourseExample example);

    int deleteByExample(CourseExample example);

    int deleteByPrimaryKey(Integer cid);

    int insert(Course record);

    int insertSelective(Course record);

    List<Course> selectByExample(CourseExample example);

    Course selectByPrimaryKey(Integer cid);



    Course seleteCourseByCid(Integer cid);

    void deleteByCid(Integer cid);


    int addCourse(@Param("cid") String cid, @Param("cname") String cname, @Param("credit") String credit);

    int updatecourse(Course course2);
}