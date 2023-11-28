package com.kopo33.resort.domain;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "UserBoardItem")
public class UserBoardItem {
	
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Id
	private Long id; // 번호

	@Column(nullable = false)
	private String writer; // 글쓴이

	@Column(nullable = false)
	private String title; // 제목

	@Column(nullable = false)
	private Date date; // 날짜
	
	@Column(nullable = false)
	private int viewcnt; //조회수

	@Column(nullable = false, length = 1100) // varchar 255자까지 허용
	private String content; // 내용

	// cascade : 부모엔티티와 연관된 모든 자식 엔티티에 대해 모든 작업(ex)저장,업데이트,삭제)을 수행할 때 자식 엔티티에도 적용
	// mappedBy : 양방향 관계 설정. BoardComment 엔티티의 boardItem 필드에 의해 관계가 관리됨을 나타냄(연관관계의
	// 주인이 되는 쪽의 필드명을 지정)
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "userBoardItem", fetch = FetchType.LAZY)
	private Collection<UserBoardComment> userBoardComments; // 댓글

	public Collection<UserBoardComment> getUserBoardComments() {
		if (userBoardComments == null) {
			userBoardComments = new ArrayList<UserBoardComment>();
		} // 필드가 null인 경우 빈 ArrayList 할당하여 NullPointerException 방지
		return userBoardComments; // boardComments 필드 반환
	}

	// boardComments 필드를 설정하는 설정자 메서드
	public void setBoardComments(Collection<UserBoardComment> userBoardComments) {
		this.userBoardComments = userBoardComments;
	}

	// BoardComment를 BoardItem에 추가하는 메서드 -> 댓글 작성 후 해당 댓글을 BoardItem에 연결
	public void addBoardComments(UserBoardComment c) {
		Collection<UserBoardComment> userBoardComments = getUserBoardComments();
		c.setUserBoardItem(this);
		userBoardComments.add(c);
	}

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
	
	public int getViewcnt() {
		return viewcnt;
	}

	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	
	//조회수 증가
	public void updateViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}

	public void setUserBoardComments(Collection<UserBoardComment> userBoardComments) {
		this.userBoardComments = userBoardComments;
	}

	// constructor 선언 빈 생성자와 데이터가 같이 들어있는 생성자를 같이 만들어 준다.
	public UserBoardItem() {
		super();
	}

	// 해당 객체를 생성할 때 여기 6개의 데이터가 들어간다.
	public UserBoardItem(Long id, String writer, Date date, String content, Collection<UserBoardComment> userBoardComments) {
		super();
		this.id = id;
		this.writer = writer;
		this.date = date;
		this.content = content;
		this.userBoardComments = userBoardComments;
	}

}
