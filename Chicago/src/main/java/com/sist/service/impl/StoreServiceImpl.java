package com.sist.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sist.dao.mapper.StoreMapper;
import com.sist.service.StoreService;
import com.sist.vo.StoreVO;

@Service("storeService")
public class StoreServiceImpl implements StoreService{
	@Resource(name="storeMapper")
	private StoreMapper sm;
	
	@Override
	public int storeCount() {
		// TODO Auto-generated method stub
		return sm.storeCount();
	}

	@Override
	public String[] storeAllName() {
		// TODO Auto-generated method stub
		return sm.storeAllName();
	}

	@Override
	public StoreVO storeInfo(String store_name) {
		// TODO Auto-generated method stub
		return sm.storeInfo(store_name);
	}

}
