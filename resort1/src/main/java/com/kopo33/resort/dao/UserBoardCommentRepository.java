package com.kopo33.resort.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.kopo33.resort.domain.UserBoardComment;

@Repository
public interface UserBoardCommentRepository extends JpaRepository<UserBoardComment, Long>{

}
