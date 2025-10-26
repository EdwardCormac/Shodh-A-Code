package com.shodh.code.dto.response;

import java.util.UUID;

public class LeaderboardEntry {

    private UUID userId;
    private String username;
    private Integer totalScore;
    private Integer problemsSolved;
    private Long totalTimeMs;
    private Integer rank;

    // Constructors
    public LeaderboardEntry() {}

    public LeaderboardEntry(UUID userId, String username, Integer totalScore, Integer problemsSolved, Long totalTimeMs) {
        this.userId = userId;
        this.username = username;
        this.totalScore = totalScore;
        this.problemsSolved = problemsSolved;
        this.totalTimeMs = totalTimeMs;
    }

    // Getters and Setters
    public UUID getUserId() {
        return userId;
    }

    public void setUserId(UUID userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Integer getTotalScore() {
        return totalScore;
    }

    public void setTotalScore(Integer totalScore) {
        this.totalScore = totalScore;
    }

    public Integer getProblemsSolved() {
        return problemsSolved;
    }

    public void setProblemsSolved(Integer problemsSolved) {
        this.problemsSolved = problemsSolved;
    }

    public Long getTotalTimeMs() {
        return totalTimeMs;
    }

    public void setTotalTimeMs(Long totalTimeMs) {
        this.totalTimeMs = totalTimeMs;
    }

    public Integer getRank() {
        return rank;
    }

    public void setRank(Integer rank) {
        this.rank = rank;
    }
}