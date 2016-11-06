package com.sist.di;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.context.request.RequestAttributes;

import com.sist.dao.*;
import com.sist.service.MemberService;

/* Made By Choding */
@Controller
public class MemberController {
	
	/* private */
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	@Resource(name="memberService")
	private MemberService ms;
	
	/* HeadMenu */
	@RequestMapping("mypage")
	public String member_page(Model model, HttpServletRequest request) {
		
		model.addAttribute("jsp", "member");
		model.addAttribute("jsp", "../member/memberinfomodify/MemberMain.jsp");
		
		model.addAttribute("cmi", "MemberMain");
		model.addAttribute("cmi", "../memberinfomodify/ModifyMemderInfo.jsp");
		
		return "main/main";
		
	}
	
	/* Member Info HeadMenu  */
	@RequestMapping("memberinfo")
	public String member_info_page(Model model, HttpServletRequest request) throws Exception {
		HttpSession hs = request.getSession();
		String sessionid = (String) hs.getAttribute("id");
		
		MemberVO vo = ms.selectMember(sessionid);
		model.addAttribute("vo", vo);
		
		model.addAttribute("jsp", "member");
		model.addAttribute("jsp", "../member/memberinfomodify/MemberMain.jsp");
		
		model.addAttribute("cmi", "MemberMain");
		model.addAttribute("cmi", "../memberinfomodify/ModifyMemderInfo.jsp");
		
		return "main/main";
		
	}
	
	/* Member Info SideMenu Include */
	@RequestMapping("modyfyMemberInfo.do")
	public String member_side_info_page(Model model, HttpServletRequest request) throws Exception {
		HttpSession hs = request.getSession();
		String sessionid = (String) hs.getAttribute("id");
		
		MemberVO vo = ms.selectMember(sessionid);
		model.addAttribute("vo", vo);
		
		model.addAttribute("jsp", "member");
		model.addAttribute("jsp", "../member/memberinfomodify/MemberMain.jsp");
		
		model.addAttribute("cmi", "MemberMain");
		model.addAttribute("cmi", "../memberinfomodify/ModifyMemderInfo.jsp");
		
		return "main/main";
		
	}
	
	@RequestMapping(value="modyfyMemberInfo_ok.do", method = RequestMethod.POST)
	public String modyfyMemberInfo_ok(Model model, MemberVO vo, HttpServletRequest request, int zipcode, String addr, String addr2, String email, String phone) throws Exception {
		
		logger.info(vo.getId() + " : " + vo.getPwd());
		
		HttpSession hs = request.getSession();
		String sessionid = (String) hs.getAttribute("id");
		
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/memberinfomodify/MemberMain.jsp");
		
		
		//if(ms.memberId(sessionid) && ms.memberPwd(sessionid,vo.getPwd())) {
		if(ms.memberId(sessionid)) {
				
				vo = new MemberVO();
				vo.setZipcode(zipcode);
				vo.setAddr(addr);
				vo.setEmail(email);
				vo.setPhone(phone);
				vo.setId(sessionid);
				ms.modyfyMemberInfo(vo);
				
				model.addAttribute("jsp", "../main/main.jsp");
				
		} else {
			
			model.addAttribute("cmi", "../memberinfomodify/ModifyMemderInfo.jsp");
			
		}
		
		return "main/main";
		
	}
	
	@RequestMapping("modyfyMemberPwd.do")
	public String member_side_pwd_page(Model model, HttpServletRequest request) {
		
		model.addAttribute("jsp", "member");
		model.addAttribute("jsp", "../member/memberinfomodify/MemberMain.jsp");
		
		model.addAttribute("memberVO", new MemberVO());
		model.addAttribute("cmi", "MemberMain");
		model.addAttribute("cmi", "../memberinfomodify/ModifyMemberPassword.jsp");
		
		return "main/main";
		
	}
	
	
	@RequestMapping(value="modyfyMemberPwd_ok.do", method = RequestMethod.POST)
	public String modyfyMemberPwd_ok(Model model, MemberVO vo, HttpServletRequest request,String USER_NewPWD, String USER_C_NewPWD) throws Exception {
		
		logger.info(vo.getId() + " : " + vo.getPwd());
		
		HttpSession hs = request.getSession();
		String sessionid = (String) hs.getAttribute("id");
		
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/memberinfomodify/MemberMain.jsp");
		
		
		if(ms.memberId(sessionid) && ms.memberPwd(sessionid,vo.getPwd())) {
			if(USER_NewPWD.equals(USER_C_NewPWD)) {
				
				Map map = new HashMap();
				map.put("pwd", USER_NewPWD);
				map.put("id", sessionid);
				ms.modyfyMemberPwd(map);
				model.addAttribute("cmi", "../memberinfomodify/ModifyMemderInfo.jsp");
				
			} else {
				
				model.addAttribute("cmi", "../memberinfomodify/ModifyMemberPassword.jsp");
				
			}
			
		} else {
			
			model.addAttribute("cmi", "../memberinfomodify/ModifyMemberPassword.jsp");
			
		}
		
		return "main/main";
		
	}
	
	@RequestMapping("modifyMemberAddrs.do")
	public String member_side_addrs_page(Model model, HttpServletRequest request) {
		
		model.addAttribute("jsp", "member");
		model.addAttribute("jsp", "../member/memberinfomodify/MemberMain.jsp");
			
		model.addAttribute("cmi", "MemberMain");
		model.addAttribute("cmi", "../memberinfomodify/ModifyMemberAddress.jsp");
			
		return "main/main";
		
	}
	
	@RequestMapping("memberPoint.do")
	public String member_side_point_page(Model model, HttpServletRequest request) {
		
		model.addAttribute("jsp", "member");
		model.addAttribute("jsp", "../member/memberinfomodify/MemberMain.jsp");
		
		
		model.addAttribute("cmi", "MemberMain");
		model.addAttribute("cmi", "../memberinfomodify/MemberPoint.jsp");
			
		
		return "main/main";
		
	}
	
	@RequestMapping("WithdrawMember")
	public String member_side_withdraw_page(Model model, HttpServletRequest request) {
		
		model.addAttribute("jsp", "member");
		model.addAttribute("jsp", "../member/memberinfomodify/MemberMain.jsp");
		
		model.addAttribute("cmi", "MemberMain");
		model.addAttribute("cmi", "../memberinfomodify/WithdrawMember.jsp");
			
		return "main/main";
		
	}
	
	@RequestMapping(value="withdrawMember_ok.do", method = RequestMethod.POST)
	public String withdrawMember_ok(Model model, MemberVO vo, HttpServletRequest request,String USER_PWD, String USER_C_PWD) throws Exception {
		
		logger.info(vo.getId() + " : " + vo.getPwd());
		
		HttpSession hs = request.getSession();
		String sessionid = (String) hs.getAttribute("id");
		
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/memberinfomodify/MemberMain.jsp");
		
		
		if(ms.memberPwd(sessionid, USER_PWD) && !sessionid.equals("admin")) {
			
			Map map = new HashMap();
			map.put("id", sessionid);
			map.put("pwd", USER_PWD);
			ms.withdrawMember(map);
			hs.invalidate();
				
		} else {
			model.addAttribute("cmi", "../memberinfomodify/WithdrawMember.jsp");		
		}
		
		return "redirect:main.do";
		
	}
	
	/* Member Orderlist HeadMenu */ 
	@RequestMapping("order")
	public String member_order_page(Model model, HttpServletRequest request) {
		
		model.addAttribute("jsp", "member");
		model.addAttribute("jsp", "../member/memberinfomodify/MemberMain.jsp");
		
		model.addAttribute("cmi", "MemberMain");
		model.addAttribute("cmi", "../orderlist/OrderListMain.jsp");
			
		return "main/main";
		
	}
	
	/* Member Wishlist HeadMenu */ 
	@RequestMapping("wish")
	public String member_wish_page(Model model, HttpServletRequest request) {
		
		model.addAttribute("jsp", "member");
		model.addAttribute("jsp", "../member/memberinfomodify/MemberMain.jsp");
		
		model.addAttribute("cmi", "MemberMain");
		model.addAttribute("cmi", "../memberwishlist/MemberWishList.jsp");
		
		return "main/main";
		
	}
	
	
	
	/* Member Question HeadMenu */ 
	@RequestMapping("memberquestion")
	public String member_question_page(Model model, HttpServletRequest request) {
		
		model.addAttribute("jsp", "member");
		model.addAttribute("jsp", "../member/memberinfomodify/MemberMain.jsp");
		
		model.addAttribute("cmi", "MemberMain");
		model.addAttribute("cmi", "../memberquestion/MemberQuestionMain.jsp");
		
		return "main/main";
		
	}
	
}
