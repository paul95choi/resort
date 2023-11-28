package com.kopo33.resort.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.kopo33.resort.domain.BoardItem;

@Repository
public interface BoardItemRepository extends JpaRepository<BoardItem, Long>{
	Page<BoardItem> findAll(Pageable pageable);

	Page<BoardItem> findAllByTitleContaining(String search, Pageable pageable);
}