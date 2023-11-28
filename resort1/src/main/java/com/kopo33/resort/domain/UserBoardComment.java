package com.kopo33.resort.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "UserBoardComment")
public class UserBoardComment {

	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Id
	private Long id; // 번호

	@Column(nullable = false)
	private String writer; // 글쓴이

	@Column(nullable = false, length = 500) // varchar 255자까지 허용
	private String content; // 내용

	@ManyToOne(optional = false)
	@JoinColumn(name = "userBoardItem_id") // UserBoardComment 테이블과의 관계를 표현하는 외래키 이름
	private UserBoardItem userBoardItem;

	// getter, setter 생성
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public UserBoardItem getUserBoardItem() {
		return userBoardItem;
	}

	public void setUserBoardItem(UserBoardItem userBoardItem) {
		this.userBoardItem = userBoardItem;
	}

	// constructor 선언 빈 생성자와 데이터가 같이 들어있는 생성자를 같이 만들어 준다.
	public UserBoardComment() {
			super();
		}

	// 해당 객체를 생성할 때 여기 3개의 데이터가 들어간다.
	public UserBoardComment(Long id, String writer, String content) {
			super();
			this.id = id;
			this.writer = writer;
			this.content = content;
		}

}