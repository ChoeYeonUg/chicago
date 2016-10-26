package com.sist.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public interface MemberService {
	public boolean memberId(String id) throws Exception;
	public boolean memberPwd(String id,String pwd) throws Exception;
}
