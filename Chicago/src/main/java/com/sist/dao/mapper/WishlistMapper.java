package com.sist.dao.mapper;

import java.util.*;
import com.sist.dao.*;

/* Made By Choding */ 
public interface WishlistMapper {
	
	public List<WishlistVO> inputMemberWishlist(Map map) throws Exception;
	public WishlistVO memberWishlist(Map map);
	
}
