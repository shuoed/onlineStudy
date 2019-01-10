package com.amaker.online.dao;

import com.amaker.online.common.page.TailPage;
import com.amaker.online.model.AuthUser;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

/**
 * @program: onlinestudy
 * @Date: 2019/1/8 0008 16:05
 * @Author: GHH
 * @Description:
 */
@Component
public interface AuthUserDao {



     List<AuthUser> selectTeacher();

     AuthUser getByUsername(String username);

     void addUser(AuthUser user);

     AuthUser selectUserById(int id);

     void updateUser(AuthUser authUser);

     void deleteUser(int id);

     List<AuthUser> selectUserByPage(AuthUser authUser,TailPage<AuthUser> page);

     int getCountByUser(AuthUser authUser);




}
