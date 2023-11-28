package com.kopo33.resort.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity //JPA의 엔티티 클래스로 정의
@Getter //Lombok 어노테이션으로, 필드의 getter 메서드를 자동으로 생성
@Setter //Lombok 어노테이션으로, 필드의 setter 메서드를 자동으로 생성
@Builder //Lombok 어노테이션으로, 빌더 패턴을 사용하여 객체를 생성하는 빌더 메서드를 생성
@NoArgsConstructor //Lombok 어노테이션으로, 파라미터 없는 기본 생성자를 자동으로 생성
@AllArgsConstructor //Lombok 어노테이션으로, 모든 필드를 파라미터로 받는 생성자를 자동으로 생성
@Table(name = "User") //해당 엔티티 클래스가 데이터베이스에서 사용할 테이블의 이름을 지정
public class User {
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Id
	private Long id; // 번호

	@Column(nullable = false)
	private String loginId; // 아이디

	@Column(nullable = false)
	private String password; // 비번

	@Column(nullable = false)
	private String name; // 이름

	@Column(nullable = false)
	private String email; // 메일주소
	
	@Column(nullable = false)
	private UserRole role; // 역할

	//enum(열거형):프로그래밍에서 몇 개의 고정된 상수 값을 정의할 때 사용되는 데이터 형식(이름 있는 상수들의 집합)
	public enum UserRole {
	    USER, ADMIN;  //데이터베이스에 각 0,1로 표기됨
	}
	
}