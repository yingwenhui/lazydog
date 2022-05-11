package com.service;

import com.dao.StudentMapper;
import com.entity.Student;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StudentService {
    @Autowired
    private StudentMapper studentMapper;
    public Student login(String sid, String spwd){
        return studentMapper.selectByIdAndPAssword( sid, spwd);
    }
}
