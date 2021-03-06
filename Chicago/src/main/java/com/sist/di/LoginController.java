package com.sist.di;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.sist.dao.MemberVO;
import com.sist.service.MemberService;

@Controller
@EnableAspectJAutoProxy
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
				int grade = ms.memberGrade(vo.getId());
				hs.setAttribute("id", vo.getId());
				hs.setAttribute("grade", grade);
				model.addAttribute("jsp", "default.jsp");
				logger.info(this.toString() + "로그인 완료");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
		return "main/main";
	}
	
	@RequestMapping("logout")
	public String logout(HttpServletRequest req){
		HttpSession session = req.getSession();
		
		String id = (String) session.getAttribute("id");
		if(id != null){
			session.removeAttribute("id");
			session.removeAttribute("grade");
		}
		
		
		return "redirect:login.do";
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
		
		HttpSession hs = req.getSession();
		//로그인중인 사람의 회원가입을 막음
		try{
			String id = (String) hs.getAttribute("id");
			if(id != null){
				return "redirect:main.do";
			}
		}catch(Exception e){
			return "redirect:main.do";
		}
		

		req.setAttribute("jsp", "login.jsp");
		req.setAttribute("login_jsp", "../login/clause.jsp");
		return "main/main";
	}
	
	@RequestMapping(value="id_check", method = RequestMethod.POST, produces="text/html;charset=UTF-8")
	public void id_check(String id, HttpServletResponse resp){
		//String data = "";
		boolean data = false;
		try {
			logger.info(id+" 호출됩니다.");
			boolean idCheck = ms.memberId(id);
			if(!idCheck && id.length()>4){
				//data = "사용 가능한 아이디 입니다.";
				data = true;
				System.out.println(data);
			}else{
				//data = "사용할 수 없습니다.";
				data = false;
				System.out.println(data);
			}
			resp.setCharacterEncoding("UTF-8");
			resp.getWriter().print(data);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		//return data;
	}
	
	@RequestMapping("join_ok")
	public String join_ok(Model model,MemberVO vo, Errors errors){
		model.addAttribute("jsp", "login.jsp");
		try {
			boolean idCheck = ms.memberId(vo.getId());
			
			if(vo.getAddr() == null || vo.getAddr().equals("")){
				vo.setZipcode(new Integer(0));
			}
			
			new MemberVOValidator().validate(vo, errors);
			if(errors.hasErrors() || idCheck) {
				System.out.println(errors.hasErrors() + " 아이디 체크 결과" + idCheck);
				model.addAttribute("login_jsp", "../login/join.jsp");
				return "main/main";
			}else{
				ms.MemberJoin(vo);
			}
			logger.info("회원가입해라");
			model.addAttribute("login_jsp", "../login/joinComplete.jsp");
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "main/main";
	}
	
	
	@RequestMapping("findPwd")
	public String find_pwd(Model model, HttpServletRequest req){
		HttpSession hs = req.getSession();
		
		try {
			String id = (String) hs.getAttribute("id");
			
			if(id != null){
				return "redirect:main.do";
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			
		}
		
		
		req.setAttribute("memberVO", new MemberVO());
		model.addAttribute("jsp", "login.jsp");
		model.addAttribute("login_jsp", "../login/findPwd.jsp");
		return "main/main";
	}
	
	@RequestMapping(value = "findPwd_ok", method = RequestMethod.POST)
	public String find_pwd_ok(Model model, MemberVO vo,RedirectAttributes redirectAttributes){
		
		if(vo.getId().equals("amdin")){
			return "redirect:main.do";
		}
		try {
			boolean bCheck = ms.findPwd(vo);
			
			if(!bCheck){
				return "redirect:login.do";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		redirectAttributes.addFlashAttribute("id", vo.getId());
		return "redirect:changePwd.do";
	}
	
	@RequestMapping(value = "findPwd_ok", method = RequestMethod.GET)
	public String find_pwd_ok(Model model){
		
		return "redirect:login.do";
	}
	
	@RequestMapping("changePwd")
	public String changePwd(Model model, HttpServletRequest request){
		
		try{
			Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
			String id = (String) flashMap.get("id");
			model.addAttribute("id", id);
		}catch(Exception e){
			return "redirect:findPwd.do";
		}
		
		model.addAttribute("jsp", "login.jsp");
		model.addAttribute("login_jsp", "../login/changePwd.jsp");
		
		return "main/main";
	}
	
	@RequestMapping("changePwd_ok")
	public String changePwd_Ok(Model model, String pwd, String pwdCheck, String id){
		logger.info(id);
		logger.info(pwdCheck + ", pwd : " + pwd);
		try{
			if(pwd.equals(pwdCheck) && id != null){
				Map map = new HashMap();
				map.put("id", id);
				map.put("pwd", pwd);
				ms.modyfyMemberPwd(map);
			}else{
				return "redirect:findPwd.do";
			}
		}catch(Exception e){
			return "redirect:findPwd.do";
		}
		
		
		return "redirect:login.do";
	}
	
}
