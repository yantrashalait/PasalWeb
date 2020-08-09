package com.vortexnepal.pasal.ads.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.vortexnepal.pasal.ads.model.Question;

public interface QuestionRepository extends CrudRepository<Question, Integer>{
	List<Question> findByMainAdsId(int id);
	List<Question> findByAskedToCustomerId(int id);
	@Query(value ="SELECT COUNT(DISTINCT asked_by) from tbl_questions where asked_to = :askedTo", nativeQuery= true)
	int countAskedByUser(@Param("askedTo") int askedTo);
}
