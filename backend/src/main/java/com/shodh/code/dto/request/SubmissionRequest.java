package com.shodh.code.dto.request;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

import java.util.UUID;

public class SubmissionRequest {

    @NotNull(message = "Contest ID is required")
    private UUID contestId;

    @NotNull(message = "Problem ID is required")
    private UUID problemId;

    @NotBlank(message = "Username is required")
    private String username;

    @NotBlank(message = "Language is required")
    private String language;

    @NotBlank(message = "Code is required")
    private String code;

    // Constructors
    public SubmissionRequest() {}

    public SubmissionRequest(UUID contestId, UUID problemId, String username, String language, String code) {
        this.contestId = contestId;
        this.problemId = problemId;
        this.username = username;
        this.language = language;
        this.code = code;
    }

    // Getters and Setters
    public UUID getContestId() {
        return contestId;
    }

    public void setContestId(UUID contestId) {
        this.contestId = contestId;
    }

    public UUID getProblemId() {
        return problemId;
    }

    public void setProblemId(UUID problemId) {
        this.problemId = problemId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}