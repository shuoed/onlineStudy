package com.amaker.online.dao;

import com.amaker.online.model.ConstsClassify;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @program: onlinestudy
 * @Date: 2019/1/9 0009 18:28
 * @Author: GHH
 * @Description:
 */
@Component
public interface ConstsClassifyDao {

    List<ConstsClassify> selectAllClassify();

    List<ConstsClassify> selectClassifyByCondition(ConstsClassify constsClassify);

    ConstsClassify selectClassifyById(int id);

    ConstsClassify selectById(Long id);


    void updateClassify(ConstsClassify constsClassify);

    void createClassify(ConstsClassify constsClassify);

    void deleteClassify(ConstsClassify constsClassify);
}
