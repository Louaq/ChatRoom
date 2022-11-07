package com.scuec.service;

import com.scuec.service.mapper.ShopMapper;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static java.lang.System.out;

public class Cart {
    /**
     * 保存商品信息
     * @param shop
     * @return
     */
    private Map<Integer, Shop> car = new HashMap<Integer, Shop>();
    private Map<String, Integer> items;
    private Map<Shop, Integer> map;


    public Object showGoods(){
        for (Map.Entry<Integer, Shop> entry : car.entrySet()) {
            out.println(entry.getValue().getId()+"\t"+entry.getValue().getName()+"\t"+entry.getValue().getPrice());
        }

        return car;
    }


    public void addGoods(Integer id) throws IOException {
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
    public void removeGoods(Integer id){
        car.remove(id);

    }

    /**
     * 清空购物车
     */
    public void clearGoods() {
        car.clear();
    }

    /**
     *计算总价格
     */

    public float getTotalPrice() {
        float totalPrice = 0;
        for (Map.Entry<Integer, Shop> entry : car.entrySet()) {
            totalPrice += entry.getValue().getPrice() * entry.getValue().getBuyNum();
        }
        return totalPrice;
    }

    public Map<String, Integer> getItems() {
        //获取购物车中所有商品
        List<Shop> shops = (List<Shop>) car.values();
        //遍历商品
        for (Shop shop : shops) {
            //获取商品id
            Integer id = shop.getId();
            //获取商品数量
            Integer buyNum = shop.getBuyNum();
            //将商品id和商品数量存入map集合
            items.put(id.toString(), buyNum);
        }
        return items;
    }

    public Map<Shop, Integer> getMap() {
        //获取购物车中所有商品
        List<Shop> shops = (List<Shop>) car.values();
        //遍历商品
        for (Shop shop : shops) {
            //获取商品id
            Integer id = shop.getId();
            //获取商品数量
            Integer buyNum = shop.getBuyNum();
            //将商品id和商品数量存入map集合
            map.put(shop, buyNum);
        }
        return map;
    }

    public Map<Integer, Shop> getCar() {
        return car;
    }
}
