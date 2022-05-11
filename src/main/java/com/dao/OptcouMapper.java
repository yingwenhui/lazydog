package com.dao;

import com.entity.Optcou;

import java.util.List;

import jdk.internal.org.objectweb.asm.tree.IincInsnNode;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface OptcouMapper {
    List<Optcou> selectOptcouBySid(Integer sid);

    List<Optcou> selectAllBySid(Integer sid);
    List<Optcou> selectAll();
    void deleteoptcouBySidAndCid(@Param("sid") Integer sid,@Param("cid") Integer cid);

    int insertOptcouByCidAnd(@Param("sid") Integer sid, @Param("cid") Integer cid);

    void updateScore(@Param("sid") Integer sid, @Param("cid") Integer cid,@Param("score") Integer score);

    List<Optcou> selectByCid(Integer cid);

    int deleteoptcouBySid(Integer sid);
}