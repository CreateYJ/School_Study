package com.tukorea.project_purchase;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tukorea.project_items.ItemService;

@Controller
public class PurchaseController {
    private final PurchaseService purchaseService;
	private final ItemService itemService;

    @Autowired
    public PurchaseController(PurchaseService purchaseService, ItemService itemService) {
        this.purchaseService = purchaseService;
        this.itemService = itemService;
    }

    @PostMapping("/insertPurchase")
    public String purchase(@ModelAttribute Purchase purchase) {
        // 구매 동작 처리
        purchaseService.insertPurchase(purchase);
        return "redirect:/purchase/purchase_list";
    }

    @RequestMapping("/purchase/purchase_list")
    public String purchaseList(Model model) {
        // 구매 목록 조회
    	
        List<Purchase> purchase = purchaseService.getPurchaseList();
        model.addAttribute("purchase", purchase);
        return "purchase/purchase_list";
    }
    
	/*
	 * @PostMapping("/insertPurchase") public String purchaseItem(@ModelAttribute
	 * Integer purchase, Model model) { // 구매 동작 처리
	 * purchaseService.insertPurchase(purchase);
	 * 
	 * // 구매 완료된 아이템 정보를 모델에 추가 Item purchasedItem =
	 * itemService.detail(purchase.getItemId()); model.addAttribute("purchasedItem",
	 * purchasedItem);
	 * 
	 * return "redirect:/purchase/purchase_list"; }
	 */
    
    
}
