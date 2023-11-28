package com.kopo33.resort.dto;

import javax.validation.constraints.NotBlank;

import com.kopo33.resort.domain.User;
import com.kopo33.resort.domain.User.UserRole;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class JoinRequest {
	
	@NotBlank(message = "로그인 아이디가 비어있습니다.")
	private String loginId;
	
	@NotBlank(message = "비밀번호가 비어있습니다.")
	private String password;
	private String passwordCheck;
	
	@NotBlank(message = "이름이 비어있습니다.")
	private String name;
	
	@NotBlank(message = "이메일이 비어있습니다.")
	private String email;
	
    // 비밀번호 암호화 X
	public User toEntity() { 
		//toEntity(): 주로 DTO에서 엔티티 객체로 변환하는 역할을 하는 메서드, DTO 객체에서 필요한 정보를 추출하여 엔티티 객체를 생성하고 초기화 할 수 있음
		return User.builder()
				.loginId(this.loginId)
				.password(this.password)
				.name(this.name)
				.email(this.email)
				.role(UserRole.USER)
				.build();
	}
	
    // 비밀번호 암호화
    public User toEntity(String encodedPassword) {
    	return User.builder()
        		.loginId(this.loginId)
				.password(this.password)
				.name(this.name)
				.email(this.email)
				.role(UserRole.USER)
				.build();
    }
}
