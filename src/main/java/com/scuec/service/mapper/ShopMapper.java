package com.scuec.service.mapper;

import com.scuec.service.Shop;

import java.util.List;

public interface ShopMapper {

    List<Shop> selectShops();
    Shop selectById(int id);



}
