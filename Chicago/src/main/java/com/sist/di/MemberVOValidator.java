package com.sist.di;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.sist.dao.MemberVO;

public class MemberVOValidator implements Validator{
	private static final String emailRegExp="^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
			+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
	private static final String idCheck = "^[a-zA-Z]*[a-zA-Z0-9]*$";
	private static final String phoneCheck = "^[0-9]*$";
	private static final String nameCheck = "^[ㄱ-ㅎ가-힣a-zA-Z]*?\\s*[ㄱ-ㅎ가-힣a-zA-Z]*$";
	private Pattern ptnEamil;
	private Pattern ptnId;
	private Pattern ptnPhone;
	private Pattern ptnName;
	public MemberVOValidator(){
		ptnEamil = Pattern.compile(emailRegExp);
		ptnId = Pattern.compile(idCheck);
		ptnPhone = Pattern.compile(phoneCheck);
		ptnName = Pattern.compile(nameCheck);
	}
	
	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return MemberVO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		MemberVO vo = (MemberVO)target;
		if(vo.getEmail().length()!=0){
			Matcher matcher = ptnEamil.matcher(vo.getEmail());
			if(!matcher.matches()){
				errors.rejectValue("email","bad");
			}
		}

		if(vo.getId().length()>=5){
			Matcher ma = ptnId.matcher(vo.getId());
			if(!ma.matches()){
				errors.rejectValue("id", "bad");
			}
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "id", "error");
			
		}else{
			errors.rejectValue("id","short");
		}

		if(vo.getPwd().length()>=5){
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "pwd", "error");
		}else{
			errors.rejectValue("pwd","short");
		}
		if(vo.getName().length() >= 2){
			Matcher nameMat = ptnName.matcher(vo.getName());
			if(!nameMat.matches()){
				errors.rejectValue("name","notName");
			}
			ValidationUtils.rejectIfEmpty(errors, "name", "error");
		}else{
			errors.rejectValue("name","short");
		}		
		
		if(vo.getPhone().length()>=9){
			Matcher ma = ptnPhone.matcher(vo.getPhone());
			if(!ma.matches()){
				errors.rejectValue("phone", "bad");
			}
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phone", "error");
			
		}else{
			errors.rejectValue("phone","phonemiss");
		}
		

	}

}
