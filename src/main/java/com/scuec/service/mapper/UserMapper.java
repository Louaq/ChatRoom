package com.scuec.service.mapper;

import com.scuec.service.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    User selectUser(@Param("username") String username, @Param("password") String password);

    int insertUser(User user);

}
