package com.kopo33.resort.web;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kopo33.resort.domain.User;
import com.kopo33.resort.dto.JoinRequest;
import com.kopo33.resort.dto.LoginRequest;
import com.kopo33.resort.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/resort1")
public class LoginController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/adm_join")
	public String joinPage(Model model) {

		model.addAttribute("joinRequest", new JoinRequest());
		return "adm_join";
	}
	
	@PostMapping("/join")
	public String join(@Valid @ModelAttribute JoinRequest joinRequest, BindingResult bindingResult, Model model) {
		
		// loginId 중복 체크
		if (userService.checkLoginIdDuplicate(joinRequest.getLoginId())) {
			bindingResult.addError(new FieldError("joinRequest", "loginId", "로그인 아이디가 중복됩니다."));
		}

		// password와 passwordCheck가 같은지 체크
		if (!joinRequest.getPassword().equals(joinRequest.getPasswordCheck())) {
			bindingResult.addError(new FieldError("joinRequest", "passwordCheck", "바밀번호가 일치하지 않습니다."));
		}

		if (bindingResult.hasErrors()) {
			return "/adm_join";
		}

		userService.join(joinRequest);
		return "redirect:/resort1/";
	}
	
	@GetMapping("/adm_login")
	public String loginPage(Model model) {

		model.addAttribute("loginRequest", new LoginRequest());
		return "adm_login";
	}
	
	@PostMapping("/login")
	public String login(@ModelAttribute LoginRequest loginRequest, BindingResult bindingResult,
			HttpServletRequest httpServletRequest, Model model) {

		User user = userService.login(loginRequest);

		if (user == null) { 
			bindingResult.reject("loginFail", "로그인 아이디 또는 비밀번호가 틀렸습니다.");
		}

		if (bindingResult.hasErrors()) { // 로그인 아이디나 비밀번호가 틀린 경우 global error return
			return "adm_login";
		}

		// 로그인 성공 => 세션 생성

		// 세션을 생성하기 전에 기존의 세션 파기
		httpServletRequest.getSession().invalidate();
		HttpSession session = httpServletRequest.getSession(true); // Session이 없으면 생성
		// 세션에 userId를 넣어줌
		session.setAttribute("userId", user.getId());
		session.setMaxInactiveInterval(1800); // Session이 30분동안 유지

		return "redirect:/resort1/";
	}
	
	@GetMapping("/adm_logout")
	public String logout(HttpServletRequest request) {

		HttpSession session = request.getSession(false); // Session이 없으면 null return
		if (session != null) {
			session.invalidate();
		}
		return "redirect:/resort1/";
	}
}