package com.tukorea.project_items;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.tukorea.project_board.Board;

@Mapper
public interface ItemMapper {
	
	@Select
	("SELECT * FROM project_items")
	List<Item> showAllItems();
	
	@Select
	("Select * FROM project_items WHERE id = #{id}")
	Item detail(@Param("id") Integer id);
	
	@Select("SELECT * FROM project_items WHERE id = #{itemId}")
    Item getItemById(@Param("itemId") Integer itemId);
}
