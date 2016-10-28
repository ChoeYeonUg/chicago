package com.sist.di;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sist.dao.MemberVO;
import com.sist.dao.loginVO;
import com.sist.service.MemberService;

@Controller
public class LoginController {
	/* private */
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	@Resource(name="memberService")
	private MemberService ms;

	@RequestMapping("login")
	public String login_page(Model model) {
		/*model.addAttribute("loginVO", new loginVO());*/
		model.addAttribute("memberVO", new MemberVO());
		model.addAttribute("jsp", "login.jsp");
		model.addAttribute("login_jsp", "../login/login.jsp");
		return "main/main";
	}
	
	@RequestMapping(name="login_ok", method = RequestMethod.POST)
	public String login_ok_page(Model model, MemberVO vo, HttpServletRequest req) {		
		
		logger.info(vo.getId() + " : " + vo.getPwd());
		
		try {
			if(!ms.memberId(vo.getId())){
				model.addAttribute("jsp", "login.jsp");
				model.addAttribute("login_jsp", "../login/login.jsp");
				logger.info(this.toString() + "ID 틀림");
			}else if(!ms.memberPwd(vo.getId(),vo.getPwd())){
				model.addAttribute("jsp", "login.jsp");
				model.addAttribute("login_jsp", "../login/login.jsp");
				logger.info(this.toString() + "PWD 틀림");
			}else{
				HttpSession hs = req.getSession();
				
				hs.setAttribute("id", vo.getId());
				
				model.addAttribute("jsp", "default.jsp");
				logger.info(this.toString() + "로그인 완료");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
		return "main/main";
	}

	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String join_page(HttpServletRequest req) {
		req.setAttribute("jsp", "login.jsp");
		req.setAttribute("login_jsp", "../login/clause.jsp");
		return "main/main";
	}

	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String join_page(HttpServletRequest req,
			@RequestParam(value = "agree", defaultValue = "false") Boolean agreeVal) {
		req.setAttribute("jsp", "login.jsp");
		String[] gender = { "남", "여" };
		req.setAttribute("gender", gender);
		if (!agreeVal) {
			req.setAttribute("login_jsp", "../login/clause.jsp");
		} else {
			req.setAttribute("memberVO", new MemberVO());
			req.setAttribute("login_jsp", "../login/join.jsp");
		}
		return "main/main";
	}

	@RequestMapping("clause")
	public String clause_page(HttpServletRequest req) {

		req.setAttribute("jsp", "login.jsp");
		req.setAttribute("login_jsp", "../login/clause.jsp");
		return "main/main";
	}
	
	@RequestMapping(value="id_check", method = RequestMethod.POST, produces="text/html;charset=UTF-8")
	public void id_check(@ModelAttribute("MemberVO") MemberVO memberVO, HttpServletResponse resp){
		String data = "";
		try {
			logger.info(memberVO.getId()+" 호출됩니다.");
			boolean idCheck = ms.memberId(memberVO.getId());
			if(!idCheck && memberVO.getId().length()>4){
				data = "사용 가능한 아이디 입니다.";
			}else{
				data = "사용할 수 없습니다.";
			}
			System.out.println(data);
			resp.setCharacterEncoding("UTF-8");
			resp.getWriter().print(data);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		//return data;
	}
	
	@RequestMapping("join_ok")
	public String join_ok(Model model,MemberVO vo, String addr){
		logger.info(addr);
		logger.info(vo.getAddr());
		model.addAttribute("jsp", "login.jsp");
		model.addAttribute("login_jsp", "../login/join.jsp");
		return "main/main";
	}
	
}
