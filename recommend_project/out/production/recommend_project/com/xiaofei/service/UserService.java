package com.xiaofei.service;

import com.xiaofei.pojo.User;

public interface UserService {

    User findByUid(String uid);
    void updateUser(User user);

}
