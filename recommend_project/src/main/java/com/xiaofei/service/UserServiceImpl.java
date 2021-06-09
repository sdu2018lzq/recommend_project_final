package com.xiaofei.service;

import com.xiaofei.dao.UserDao;
import com.xiaofei.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;


    @Override
    public User findByUid(String uid) {
        User user = userDao.findByUid(uid);
        return user;
    }



    @Override
    public void updateUser(User user) {
        userDao.saveAndFlush(user);

    }
}
