package com.shodh.code.dto.response;

import java.time.ZonedDateTime;
import java.util.List;
import java.util.UUID;

public class ContestResponse {

    private UUID id;
    private String name;
    private String description;
    private ZonedDateTime startAt;
    private ZonedDateTime endAt;
    private List<ProblemSummary> problems;

    // Nested class for problem summary
    public static class ProblemSummary {
        private UUID id;
        private String title;
        private Integer score;

        public ProblemSummary() {}

        public ProblemSummary(UUID id, String title, Integer score) {
            this.id = id;
            this.title = title;
            this.score = score;
        }

        // Getters and Setters
        public UUID getId() {
            return id;
        }

        public void setId(UUID id) {
            this.id = id;
        }

        public String getTitle() {
            return title;
        }

        public void setTitle(String title) {
            this.title = title;
        }

        public Integer getScore() {
            return score;
        }

        public void setScore(Integer score) {
            this.score = score;
        }
    }

    // Constructors
    public ContestResponse() {}

    public ContestResponse(UUID id, String name, String description, ZonedDateTime startAt, ZonedDateTime endAt) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.startAt = startAt;
        this.endAt = endAt;
    }

    // Getters and Setters
    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public ZonedDateTime getStartAt() {
        return startAt;
    }

    public void setStartAt(ZonedDateTime startAt) {
        this.startAt = startAt;
    }

    public ZonedDateTime getEndAt() {
        return endAt;
    }

    public void setEndAt(ZonedDateTime endAt) {
        this.endAt = endAt;
    }

    public List<ProblemSummary> getProblems() {
        return problems;
    }

    public void setProblems(List<ProblemSummary> problems) {
        this.problems = problems;
    }
}