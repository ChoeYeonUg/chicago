package com.sist.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.sist.dao.MemberVO;
import com.sist.dao.mapper.MemberMapper;
import com.sist.service.MemberService;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
	
	@Resource(name="memberMapper")
	private MemberMapper mapper;

	@Override
	public boolean memberId(String id) throws Exception {
		// TODO Auto-generated method stub
		boolean check = false;
		
		int idCheck = mapper.idCheck(id);
		if(idCheck == 1){
			check = true;
		}
		
		return check;
	}

	@Override
	public boolean memberPwd(String id,String pwd) throws Exception {
		// TODO Auto-generated method stub
		
		boolean check = false;
		
		String dbPwd = mapper.pwdCheck(id);
		
		if(pwd.equals(pwd)){
			check = true;
		}
		
		return check;
	}

	@Override
	public int memberGrade(String id) throws Exception {
		// TODO Auto-generated method stub
		return mapper.getGrade(id);
	}

	@Override
	public void MemberJoin(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		mapper.joinMember(vo);
		
	}

	@Override
	public void memberDelete(String id) throws Exception {
		// TODO Auto-generated method stub
		mapper.memberDelete(id);
		
	}

	@Override
	public void updateGrade(Map map) throws Exception {
		// TODO Auto-generated method stub
		mapper.updateGrade(map);
	}

	@Override
	public List<MemberVO> memberList(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mapper.memberlist(map);
	}

	@Override
	public int memberTotalPage(int rowSize) throws Exception {
		// TODO Auto-generated method stub
		return mapper.memberTotalPage(rowSize);
	}



}
