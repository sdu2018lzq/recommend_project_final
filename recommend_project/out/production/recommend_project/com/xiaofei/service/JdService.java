package com.xiaofei.service;

import com.xiaofei.pojo.Jd;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public interface JdService {

    List<Jd> findAll();
    List<Jd> findByNamedParam(long minsal,String industry,String city);
    Jd findByPositionId(long PositionId);
}
