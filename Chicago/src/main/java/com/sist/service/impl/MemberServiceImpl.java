package com.sist.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.sist.dao.AddressVO;
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
		

		if(pwd.equals(dbPwd)){
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

	@Override
	public List<MemberVO> memberSearch(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mapper.memberSearch(map);
	}
	
	@Override
	public int memberSearchPage(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mapper.memberSearchPage(map);
	}

	/* Choding Part */
	@Override 
	public String pwdCheck(String id) throws Exception {
		return mapper.pwdCheck(id);
	}
	
	@Override
	public MemberVO selectMember(String id) throws Exception {
		return mapper.selectMember(id);
	}
	
	@Override
	public void modyfyMemberInfo(MemberVO vo) throws Exception {
		mapper.modyfyMemberInfo(vo);
	}
	
	@Override
	public void modyfyMemberPwd(Map map) throws Exception {
		mapper.modyfyMemberPwd(map);
	}
	
	@Override
	public AddressVO selectMemberDeliveryAddrs(String id) throws Exception {
		return mapper.selectMemberDeliveryAddrs(id);
	}
	
	@Override
	public void insertMemberDeliveryAddrs(AddressVO avo) throws Exception {
		mapper.insertMemberDeliveryAddrs(avo);
		
	}
	
	@Override
	public void modyfyMemberDeliveryAddrs(AddressVO avo) throws Exception {
		mapper.modyfyMemberDeliveryAddrs(avo);
	}
	
	@Override
	public void withdrawMember(Map map) throws Exception {
		mapper.withdrawMember(map);
	}

	@Override
	public MemberVO orderData(String id) throws Exception {
		// TODO Auto-generated method stub
		return mapper.orderData(id);
	}

	@Override
	public boolean findPwd(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		boolean bCheck = false;
		int result = mapper.findPwd(vo);
		
		if(result == 1){
			bCheck = true;
		}
		
		return bCheck;
	}
	

}
