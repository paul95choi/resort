package com.kopo33.resort.dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.kopo33.resort.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long>{
	boolean existsByLoginId(String loginId);
	Optional<User> findByLoginId(String loginId); //null값 있을 수 있기때문
}
