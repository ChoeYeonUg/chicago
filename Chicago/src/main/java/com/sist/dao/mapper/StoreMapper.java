package com.sist.dao.mapper;

import com.sist.dao.StoreVO;

public interface StoreMapper {
	public int storeCount();
	public String[] storeAllName();
	public StoreVO storeInfo(String store_name);
}
