package com.xiaofei.dao;

import com.xiaofei.pojo.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDao extends JpaRepository<User,Long> {
     User findByUid(String uid);

}
