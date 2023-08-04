package com.tukorea.project_items;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tukorea.project_board.Board;


@Service
public class ItemService {
	private final ItemMapper itemMapper;
	
	@Autowired
	public ItemService(ItemMapper itemMapper) {this.itemMapper = itemMapper;}
	
	public List<Item> showAllItems(){
		return itemMapper.showAllItems();
	}

	
	public Item detail(Integer id) { 
		return itemMapper.detail(id); 
	}
	 	
}
