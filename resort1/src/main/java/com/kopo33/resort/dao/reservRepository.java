package com.kopo33.resort.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.kopo33.resort.domain.Reservation;
import java.util.List;

@Repository
public interface reservRepository extends JpaRepository<Reservation, Long>{
		List<Reservation> findAllByDate(String date);

		List<Reservation> findByName(String name);
}
