package com.tukorea.project_purchase;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface PurchaseMapper {
    
    @Insert("INSERT INTO project_purchase (id, item_id, item_name, price, amount) " +
            "VALUES (#{id}, #{item_id}, #{item_name}, #{price}, #{amount})")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    void insertPurchase(Purchase purchase);
    
    @Select("SELECT * FROM project_purchase")
    List<Purchase> getPurchaseList();
    
}
