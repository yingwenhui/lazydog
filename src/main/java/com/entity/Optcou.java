package com.entity;

import java.math.BigDecimal;

public class Optcou  {
   private Integer sid;
   private Integer cid;
   private Double score;
private Course course;

    @Override
    public String toString() {
        return "Optcou{" +
                "sid=" + sid +
                ", cid=" + cid +
                ", score=" + score +
                ", course=" + course +
                ", student=" + student +
                '}';
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    private Student student;
    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Double getScore() {
        return score;
    }

    public void setScore(Double score) {
        this.score = score;
    }

}