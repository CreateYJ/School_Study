package com.tukorea.project_purchase;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tukorea.project_items.Item;
import com.tukorea.project_items.ItemMapper;

@Service
public class PurchaseService {
	private final PurchaseMapper purchaseMapper;

	public PurchaseService(PurchaseMapper purchaseMapper) {
		this.purchaseMapper = purchaseMapper;
	}

	public void insertPurchase(Purchase purchase) {
		purchaseMapper.insertPurchase(purchase);
	}

	public List<Purchase> getPurchaseList() {
		return purchaseMapper.getPurchaseList();
	}

	/*
	 * public void insertPurchase(Integer itemId, String userName) { // 아이템 정보 조회 및
	 * 구매 처리 Item item = ItemMapper.detail(itemId);
	 * 
	 * Purchase purchase = new Purchase(); purchase.setUser_name(userName);
	 * purchase.setItem_id(item.getId()); purchase.setItem_name(item.getName());
	 * purchase.setAmount( 구매 수량 설정 로직 ); purchase.setPrice(item.getPrice());
	 * 
	 * purchaseMapper.insertPurchase(purchase); }
	 */

}
