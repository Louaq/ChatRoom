package com.scuec;

import com.scuec.service.Shop;
import com.scuec.service.mapper.ShopMapper;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class ShopTest {


    @Test
    public void test() throws IOException {
        //1.读取配置文件
        String resource = "mybatis-config.xml";
        InputStream inputStream = Resources.getResourceAsStream(resource);
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);

        SqlSession sqlSession = sqlSessionFactory.openSession();
        //执行sql语句
        ShopMapper shopMapper = sqlSession.getMapper(ShopMapper.class);
        List<Shop> shops = shopMapper.selectShops();
        for (Shop shop : shops) {
            System.out.println(shop);
        }
        sqlSession.close();


    }

}
