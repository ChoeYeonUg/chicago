package com.sist.service;

import com.sist.dao.StoreVO;

public interface StoreService {
	public int storeCount();
	public String[] storeAllName();
	public StoreVO storeInfo(String store_name);
}
