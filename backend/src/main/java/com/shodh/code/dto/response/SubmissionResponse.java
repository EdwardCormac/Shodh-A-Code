package com.shodh.code.dto.response;

import java.time.ZonedDateTime;
import java.util.Map;
import java.util.UUID;

public class SubmissionResponse {

    private UUID submissionId;
    private String status;
    private Map<String, Object> result;
    private Integer score;
    private Integer executionTimeMs;
    private Integer memoryUsedKb;
    private ZonedDateTime createdAt;
    private ZonedDateTime updatedAt;

    // Constructors
    public SubmissionResponse() {}

    public SubmissionResponse(UUID submissionId, String status) {
        this.submissionId = submissionId;
        this.status = status;
    }

    // Getters and Setters
    public UUID getSubmissionId() {
        return submissionId;
    }

    public void setSubmissionId(UUID submissionId) {
        this.submissionId = submissionId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Map<String, Object> getResult() {
        return result;
    }

    public void setResult(Map<String, Object> result) {
        this.result = result;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Integer getExecutionTimeMs() {
        return executionTimeMs;
    }

    public void setExecutionTimeMs(Integer executionTimeMs) {
        this.executionTimeMs = executionTimeMs;
    }

    public Integer getMemoryUsedKb() {
        return memoryUsedKb;
    }

    public void setMemoryUsedKb(Integer memoryUsedKb) {
        this.memoryUsedKb = memoryUsedKb;
    }

    public ZonedDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(ZonedDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public ZonedDateTime getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(ZonedDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }
}