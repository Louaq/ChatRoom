package com.scuec.service.utils;

import com.scuec.service.Shop;
import com.scuec.service.mapper.ShopMapper;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

public class MyCarUtils {
    /**
     * 保存商品信息
     * @param shop
     * @return
     */
    private Map<Integer, Shop> car = new HashMap<Integer, Shop>();


    public void showShop(){
        for (Map.Entry<Integer, Shop> entry : car.entrySet()) {
            System.out.println(entry.getKey() + " " + entry.getValue());
        }
    }

    public void addShop(Integer id) throws IOException {
        //判断是否买过
        boolean contains = car.containsKey(id);
        if(contains){
            //买过
            Shop shop = car.get(id);
            shop.setBuyNum(shop.getBuyNum()+1);

        }else{
            //没买过
            //1.读取配置文件
            String resource = "mybatis-config.xml";
            InputStream inputStream = Resources.getResourceAsStream(resource);
            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);

            SqlSession sqlSession = sqlSessionFactory.openSession();
            //执行sql语句
            ShopMapper shopMapper = sqlSession.getMapper(ShopMapper.class);
            Shop shop = shopMapper.selectById(id);
            car.put(id,shop);
        }
    }


    /**
     * 删除商品
     * @param id
     */
    public void removeShop(Integer id){
        car.remove(id);

    }

    /**
     * 清空购物车
     */
    public void clearShop() {
        car.clear();
    }

    /**
     *计算总价格
     */

    public float getTotalPrice() {
        float totalPrice = 0.0f;
        for (Map.Entry<Integer, Shop> entry : car.entrySet()) {
            //获取商品
            Shop shop = entry.getValue();
            //价格
            totalPrice += shop.getPrice() * shop.getBuyNum();
        }
        return totalPrice;
    }

}
