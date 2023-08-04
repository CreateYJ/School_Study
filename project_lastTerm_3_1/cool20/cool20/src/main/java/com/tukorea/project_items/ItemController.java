package com.tukorea.project_items;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class ItemController {

	private final ItemService itemService;

	@Autowired
	public ItemController(ItemService itemService) {
		this.itemService = itemService;
	}

	
	@GetMapping("/item/item_list")
	public String itemList(Model model) {
		List<Item> items = itemService.showAllItems();
		model.addAttribute("items", items);
		return "item/item_list";
	}
	
	@GetMapping("/items/detail/{id}")
	public String detail(@PathVariable Integer id, Model model) {
		Item item = itemService.detail(id);
		model.addAttribute("item", item);
		return "item/item_detail";
	}
	
	
}
