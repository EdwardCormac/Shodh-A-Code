-- Seed Data for Shodh Code Platform
-- Sample contest with problems and test cases

-- Sample Users
INSERT INTO users (id, username, created_at) VALUES
    ('00000000-0000-0000-0000-000000000001', 'alice', NOW()),
    ('00000000-0000-0000-0000-000000000002', 'bob', NOW()),
    ('00000000-0000-0000-0000-000000000003', 'charlie', NOW()),
    ('00000000-0000-0000-0000-000000000004', 'diana', NOW());

-- Sample Contest
INSERT INTO contests (id, name, description, start_at, end_at, metadata) VALUES
    (
        '10000000-0000-0000-0000-000000000001',
        'Shodh Beginner Contest 2024',
        'A beginner-friendly programming contest to test your coding skills with fundamental algorithmic problems.',
        NOW() - INTERVAL '1 day',
        NOW() + INTERVAL '7 days',
        '{"difficulty": "beginner", "tags": ["algorithms", "practice"]}'::jsonb
    );

-- Problem 1: Two Sum
INSERT INTO problems (id, contest_id, title, description, input_format, output_format, constraints, score, time_limit_ms, memory_limit_kb) VALUES
    (
        '20000000-0000-0000-0000-000000000001',
        '10000000-0000-0000-0000-000000000001',
        'Two Sum',
        E'Given an array of integers and a target sum, find two numbers in the array that add up to the target.\n\n' ||
        E'Write a program that reads:\n' ||
        E'- First line: n (number of elements) and target (target sum)\n' ||
        E'- Second line: n space-separated integers (the array)\n\n' ||
        E'Output the indices (0-based) of the two numbers that sum to target, separated by a space.\n' ||
        E'If multiple pairs exist, output any valid pair. If no pair exists, output "-1 -1".',
        E'Line 1: n target\nLine 2: n space-separated integers',
        E'Two space-separated integers: index1 index2',
        E'• 2 ≤ n ≤ 10^4\n• -10^9 ≤ array[i] ≤ 10^9\n• -10^9 ≤ target ≤ 10^9',
        100,
        2000,
        65536
    );

-- Test Cases for Problem 1
INSERT INTO test_cases (problem_id, input, expected_output, is_sample, is_public) VALUES
    -- Sample test case (visible)
    (
        '20000000-0000-0000-0000-000000000001',
        E'4 9\n2 7 11 15',
        E'0 1',
        TRUE,
        TRUE
    ),
    -- Sample test case 2 (visible)
    (
        '20000000-0000-0000-0000-000000000001',
        E'3 6\n3 2 4',
        E'1 2',
        TRUE,
        TRUE
    ),
    -- Hidden test case 1
    (
        '20000000-0000-0000-0000-000000000001',
        E'5 10\n1 5 3 7 9',
        E'1 3',
        FALSE,
        FALSE
    ),
    -- Hidden test case 2 (no solution)
    (
        '20000000-0000-0000-0000-000000000001',
        E'3 100\n1 2 3',
        E'-1 -1',
        FALSE,
        FALSE
    );

-- Problem 2: Palindrome Check
INSERT INTO problems (id, contest_id, title, description, input_format, output_format, constraints, score, time_limit_ms, memory_limit_kb) VALUES
    (
        '20000000-0000-0000-0000-000000000002',
        '10000000-0000-0000-0000-000000000001',
        'Palindrome Checker',
        E'A palindrome is a string that reads the same forwards and backwards.\n\n' ||
        E'Write a program that reads a string and determines if it is a palindrome.\n' ||
        E'Ignore case and non-alphanumeric characters.\n\n' ||
        E'Input: A single line containing a string\n' ||
        E'Output: "YES" if the string is a palindrome, "NO" otherwise',
        E'A single line containing a string',
        E'"YES" or "NO"',
        E'• 1 ≤ string length ≤ 10^5\n• String may contain letters, numbers, spaces, and punctuation',
        100,
        2000,
        65536
    );

-- Test Cases for Problem 2
INSERT INTO test_cases (problem_id, input, expected_output, is_sample, is_public) VALUES
    -- Sample test case 1
    (
        '20000000-0000-0000-0000-000000000002',
        E'racecar',
        E'YES',
        TRUE,
        TRUE
    ),
    -- Sample test case 2
    (
        '20000000-0000-0000-0000-000000000002',
        E'hello',
        E'NO',
        TRUE,
        TRUE
    ),
    -- Sample test case 3 (with spaces and punctuation)
    (
        '20000000-0000-0000-0000-000000000002',
        E'A man, a plan, a canal: Panama',
        E'YES',
        TRUE,
        TRUE
    ),
    -- Hidden test case 1
    (
        '20000000-0000-0000-0000-000000000002',
        E'Was it a car or a cat I saw',
        E'YES',
        FALSE,
        FALSE
    ),
    -- Hidden test case 2
    (
        '20000000-0000-0000-0000-000000000002',
        E'programming',
        E'NO',
        FALSE,
        FALSE
    );

-- Problem 3: Factorial
INSERT INTO problems (id, contest_id, title, description, input_format, output_format, constraints, score, time_limit_ms, memory_limit_kb) VALUES
    (
        '20000000-0000-0000-0000-000000000003',
        '10000000-0000-0000-0000-000000000001',
        'Factorial Calculator',
        E'Calculate the factorial of a given number.\n\n' ||
        E'The factorial of n (denoted as n!) is the product of all positive integers less than or equal to n.\n' ||
        E'For example: 5! = 5 × 4 × 3 × 2 × 1 = 120\n\n' ||
        E'Special case: 0! = 1\n\n' ||
        E'Input: A single integer n\n' ||
        E'Output: The factorial of n',
        E'A single integer n',
        E'A single integer (the factorial of n)',
        E'• 0 ≤ n ≤ 20',
        100,
        1000,
        32768
    );

-- Test Cases for Problem 3
INSERT INTO test_cases (problem_id, input, expected_output, is_sample, is_public) VALUES
    -- Sample test case 1
    (
        '20000000-0000-0000-0000-000000000003',
        E'5',
        E'120',
        TRUE,
        TRUE
    ),
    -- Sample test case 2
    (
        '20000000-0000-0000-0000-000000000003',
        E'0',
        E'1',
        TRUE,
        TRUE
    ),
    -- Hidden test case 1
    (
        '20000000-0000-0000-0000-000000000003',
        E'10',
        E'3628800',
        FALSE,
        FALSE
    ),
    -- Hidden test case 2
    (
        '20000000-0000-0000-0000-000000000003',
        E'1',
        E'1',
        FALSE,
        FALSE
    ),
    -- Hidden test case 3
    (
        '20000000-0000-0000-0000-000000000003',
        E'15',
        E'1307674368000',
        FALSE,
        FALSE
    );

-- Verification Info
SELECT 'Database seeded successfully!' AS status;
SELECT COUNT(*) AS user_count FROM users;
SELECT COUNT(*) AS contest_count FROM contests;
SELECT COUNT(*) AS problem_count FROM problems;
SELECT COUNT(*) AS test_case_count FROM test_cases;