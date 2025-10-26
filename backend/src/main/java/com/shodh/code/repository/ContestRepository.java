package com.shodh.code.repository;

import com.shodh.code.entity.Contest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.time.ZonedDateTime;
import java.util.List;
import java.util.UUID;

@Repository
public interface ContestRepository extends JpaRepository<Contest, UUID> {
    
    @Query("SELECT c FROM Contest c WHERE c.startAt <= :now AND c.endAt >= :now")
    List<Contest> findActiveContests(ZonedDateTime now);
    
    @Query("SELECT c FROM Contest c WHERE c.endAt < :now")
    List<Contest> findPastContests(ZonedDateTime now);
    
    @Query("SELECT c FROM Contest c WHERE c.startAt > :now")
    List<Contest> findUpcomingContests(ZonedDateTime now);
}