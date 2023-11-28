package com.kopo33.resort.domain;

import java.time.LocalDateTime;
import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "reservation")
public class Reservation {
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Id // 키 필드 설정
	private Long id; // 식별번호

	@Column(nullable = false)
	private String date; // 예약일
	
	@Column(nullable = false)
	private int room; // 방 번호
	
	@Column(nullable = false)
	private String name; // 이름
	
	@Column(nullable = false)
	private String tel; // 휴대폰 번호
	
	@Column(nullable = false)
	private String email; // 이메일 아이디
	
	@Column(nullable = false)
	private String depname; // 입금자명
	
	@Column(nullable = false, length = 1100) //varchar 255자까지 허용
	private String comment; // 남기실말

	@Column(nullable = false)
	private LocalDateTime regdate; // 예약등록 날짜(관리자용)
	
	@Column(nullable = false)
	private int processing; // 진행상황(관리자용)

	// getter, setter 메소드 생성 : 데이터를 불러오고 적용할 때 사용한다.
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getRoom() {
		return room;
	}

	public void setRoom(int room) {
		this.room = room;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDepname() {
		return depname;
	}

	public void setDepname(String depname) {
		this.depname = depname;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
	    if (comment == null || comment.trim().isEmpty()) { //null값 입력시 처리
	        this.comment = "-";
	    } else {
	        this.comment = comment;
	    }
	}

	public LocalDateTime getRegdate() {
		return regdate;
	}

	public void setRegdate(LocalDateTime regdate) {
		this.regdate = regdate;
	}

	public int getProcessing() {
		return processing;
	}

	public void setProcessing(int processing) {
		this.processing = processing;
	}

	// constructor 선언 빈 생성자와 데이터가 같이 들어있는 생성자를 같이 만들어 준다.
	public Reservation() {
		super();
	}

	// 해당 객체를 생성할 때 여기 5개의 데이터가 들어간다.
	public Reservation(String date, int room, String name, String tel, String email, String depname, String comment,
			LocalDateTime regdate, int processing) {
		super();
		this.date = date;
		this.room = room;
		this.name = name;
		this.tel = tel;
		this.email = email;
		this.depname = depname;
		this.comment = comment;
		this.regdate = regdate;
		this.processing = processing;
	}

}

