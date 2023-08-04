package com.tukorea.project_user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class UserController {
private final UserService userService;
	
	@Autowired
	public UserController(UserService userService) {
		this.userService = userService;
	}
	
	@GetMapping("/users/login") //url구성
	public String login() {
		return "user/user_login";
	}
	
	@PostMapping("/loginProcess")
    public String loginProcess(HttpServletRequest request, HttpSession session) {
        // 로그인 관련 프로세스
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // 이메일과 비밀번호로 사용자 정보를 조회합니다.
        User user = userService.loginProcess(username, password);

        if (user != null) {
            session.setAttribute("user", user);
            System.out.println(user);
            return "redirect:/";
        } else {
            // 로그인 실패
            return "redirect:/users/login";
        }
    }
	
	@GetMapping("/logoutProcess")
	public String logoutProcess(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@PostMapping("/registerUser")
	public String registerUser(@ModelAttribute User user) {
		// 이미 존재하는 아이디 확인
		if(userService.findUser(user.getUsername()) != null) {
			return "redirect:/users/register?error=true";
		}
		
		//새로운 사용자 추가
		userService.registerUser(user);
		
		// 회원 가입 성공 후, 홈페이지로 리다이렉트
		return "redirect:/";
	}
	
	@GetMapping("/users/register")
	public String register() {
		return "user/user_register";
	}
	
	@PostMapping("/checkUsername")
	public ResponseEntity<Map<String, Boolean>> checkUsername(@RequestBody Map<String, String> request) {
        String username = request.get("username");
        boolean exists = (userService.findUser(username) != null);
        return ResponseEntity.ok(Map.of("exists", exists));
    }
	

}
