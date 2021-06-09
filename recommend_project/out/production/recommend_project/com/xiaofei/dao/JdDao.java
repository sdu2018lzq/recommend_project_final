package com.xiaofei.dao;

import com.xiaofei.pojo.Jd;
import com.xiaofei.pojo.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface JdDao extends JpaRepository<Jd,String> {
    Jd findByPositionId(long PositionId);
}
