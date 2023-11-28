package com.kopo33.resort.domain;

import java.sql.Date;
import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "BoardItem")
public class BoardItem {
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Id
	private Long id; // 번호

	@Column(nullable = false)
	private String writer; // 글쓴이
	
	@Column(nullable = false)
	private String title; // 제목

	@Column(nullable = false)
	private Date date; // 날짜

	@Column(nullable = false, length = 1100) //varchar 255자까지 허용
	private String content; // 내용

	// getter, setter 생성
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	// constructor 선언 빈 생성자와 데이터가 같이 들어있는 생성자를 같이 만들어 준다.
	public BoardItem() {
		super();
	}

	// 해당 객체를 생성할 때 여기 4개의 데이터가 들어간다.
	public BoardItem(Long id, String writer, Date date, String content) {
		super();
		this.id = id;
		this.writer = writer;
		this.date = date;
		this.content = content;
	}

}
