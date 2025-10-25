-- Database Schema for Shodh Code Platform
-- PostgreSQL 15+

-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Users Table
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    username VARCHAR(64) UNIQUE NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    CONSTRAINT username_not_empty CHECK (LENGTH(TRIM(username)) > 0)
);

-- Contests Table
CREATE TABLE contests (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL,
    description TEXT,
    start_at TIMESTAMP WITH TIME ZONE NOT NULL,
    end_at TIMESTAMP WITH TIME ZONE NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    metadata JSONB DEFAULT '{}',
    CONSTRAINT valid_contest_duration CHECK (end_at > start_at),
    CONSTRAINT name_not_empty CHECK (LENGTH(TRIM(name)) > 0)
);

-- Problems Table
CREATE TABLE problems (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    contest_id UUID NOT NULL REFERENCES contests(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    input_format TEXT,
    output_format TEXT,
    constraints TEXT,
    score INTEGER DEFAULT 100,
    time_limit_ms INTEGER DEFAULT 2000,
    memory_limit_kb INTEGER DEFAULT 65536,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    CONSTRAINT title_not_empty CHECK (LENGTH(TRIM(title)) > 0),
    CONSTRAINT positive_score CHECK (score > 0),
    CONSTRAINT positive_time_limit CHECK (time_limit_ms > 0),
    CONSTRAINT positive_memory_limit CHECK (memory_limit_kb > 0)
);

-- Test Cases Table
CREATE TABLE test_cases (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    problem_id UUID NOT NULL REFERENCES problems(id) ON DELETE CASCADE,
    input TEXT NOT NULL,
    expected_output TEXT NOT NULL,
    is_sample BOOLEAN DEFAULT FALSE,
    is_public BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Submissions Table
CREATE TABLE submissions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    problem_id UUID NOT NULL REFERENCES problems(id) ON DELETE CASCADE,
    contest_id UUID NOT NULL REFERENCES contests(id) ON DELETE CASCADE,
    language VARCHAR(32) NOT NULL,
    code TEXT NOT NULL,
    status VARCHAR(32) NOT NULL DEFAULT 'PENDING',
    result JSONB DEFAULT '{}',
    score INTEGER DEFAULT 0,
    execution_time_ms INTEGER,
    memory_used_kb INTEGER,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    CONSTRAINT valid_status CHECK (
        status IN (
            'PENDING',
            'RUNNING',
            'ACCEPTED',
            'WRONG_ANSWER',
            'RUNTIME_ERROR',
            'TIME_LIMIT_EXCEEDED',
            'MEMORY_LIMIT_EXCEEDED',
            'COMPILATION_ERROR',
            'ERROR'
        )
    ),
    CONSTRAINT valid_language CHECK (language IN ('java', 'python', 'cpp')),
    CONSTRAINT non_negative_score CHECK (score >= 0)
);

-- Indexes for performance
CREATE INDEX idx_contests_dates ON contests(start_at, end_at);
CREATE INDEX idx_problems_contest ON problems(contest_id);
CREATE INDEX idx_test_cases_problem ON test_cases(problem_id);
CREATE INDEX idx_test_cases_public ON test_cases(is_public);
CREATE INDEX idx_submissions_user ON submissions(user_id);
CREATE INDEX idx_submissions_problem ON submissions(problem_id);
CREATE INDEX idx_submissions_contest ON submissions(contest_id);
CREATE INDEX idx_submissions_status ON submissions(status);
CREATE INDEX idx_submissions_created ON submissions(created_at DESC);

-- Composite indexes for leaderboard queries
CREATE INDEX idx_submissions_contest_user_status ON submissions(contest_id, user_id, status);
CREATE INDEX idx_submissions_problem_user_status ON submissions(problem_id, user_id, status);

-- Function to update updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger to automatically update updated_at on submissions
CREATE TRIGGER update_submissions_updated_at
    BEFORE UPDATE ON submissions
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- Comments for documentation
COMMENT ON TABLE users IS 'Platform users who participate in contests';
COMMENT ON TABLE contests IS 'Coding contests with start and end times';
COMMENT ON TABLE problems IS 'Problems belonging to contests';
COMMENT ON TABLE test_cases IS 'Test cases for validating problem solutions';
COMMENT ON TABLE submissions IS 'Code submissions by users for problems';

COMMENT ON COLUMN test_cases.is_sample IS 'Whether this test case is shown as an example';
COMMENT ON COLUMN test_cases.is_public IS 'Whether this test case is visible to users';
COMMENT ON COLUMN submissions.result IS 'JSON object containing per-test-case results';