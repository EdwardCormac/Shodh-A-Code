package com.shodh.code.controller;

import com.shodh.code.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/health")
public class HealthController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ContestRepository contestRepository;

    @Autowired
    private ProblemRepository problemRepository;

    @Autowired
    private TestCaseRepository testCaseRepository;

    @Autowired
    private SubmissionRepository submissionRepository;

    @GetMapping
    public ResponseEntity<Map<String, Object>> health() {
        Map<String, Object> health = new HashMap<>();
        health.put("status", "UP");
        health.put("database", "Connected");
        
        Map<String, Long> counts = new HashMap<>();
        counts.put("users", userRepository.count());
        counts.put("contests", contestRepository.count());
        counts.put("problems", problemRepository.count());
        counts.put("testCases", testCaseRepository.count());
        counts.put("submissions", submissionRepository.count());
        
        health.put("data", counts);
        
        return ResponseEntity.ok(health);
    }
}