package com.shodh.code.repository;

import com.shodh.code.entity.Submission;
import com.shodh.code.enums.SubmissionStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Lock;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import jakarta.persistence.LockModeType;
import java.util.List;
// import java.util.Optional;
import java.util.UUID;

@Repository
public interface SubmissionRepository extends JpaRepository<Submission, UUID> {
    
    List<Submission> findByUserId(UUID userId);
    List<Submission> findByProblemId(UUID problemId);
    List<Submission> findByContestId(UUID contestId);
    
    @Lock(LockModeType.PESSIMISTIC_WRITE)
    @Query("SELECT s FROM Submission s WHERE s.status = :status ORDER BY s.createdAt ASC")
    List<Submission> findPendingSubmissionsForUpdate(@Param("status") SubmissionStatus status);
    
    @Query("SELECT s FROM Submission s WHERE s.contest.id = :contestId AND s.status = 'ACCEPTED' ORDER BY s.user.username")
    List<Submission> findAcceptedSubmissionsByContest(@Param("contestId") UUID contestId);
}