# Shodh Code Contest Platform

A lightweight, real-time coding contest platform with live Docker-based code execution and judging.

## Tech Stack

- **Backend**: Spring Boot (Java 21), PostgreSQL, Docker
- **Frontend**: Next.js 14, Tailwind CSS
- **Infrastructure**: Docker, Docker Compose

## Features

- Real-time code submission and judging
- Dockerized sandbox execution environment
- Live leaderboard with automatic updates
- Support for multiple programming languages
- Time and memory limit enforcement

## Prerequisites

- Docker & Docker Compose
- JDK 21 (for local development)
- Node.js 18+ (for local frontend development)
- Git

## Quick Start

### 1. Clone the repository

```bash
git clone <your-repo-url>
cd shodh-code-platform
```

### 2. Build the judge Docker image

```bash
cd infra/judge
docker build -t shodh-code-judge:latest .
cd ../..
```

### 3. Start all services

```bash
docker-compose up --build
```

### 4. Access the application

- **Frontend**: http://localhost:3000
- **Backend API**: http://localhost:8080/api
- **Database**: localhost:5432 (user: shodh, password: shodh123, db: shodh)

## Project Structure

```
shodh-code-platform/
├── backend/          # Spring Boot application
├── frontend/         # Next.js application
├── infra/           # Infrastructure configs
│   ├── sql/         # Database init and seed scripts
│   └── judge/       # Judge Docker image
├── docker-compose.yml
└── README.md
```

## Development

### Backend Development

```bash
cd backend
./mvnw spring-boot:run
```

### Frontend Development

```bash
cd frontend
npm install
npm run dev
```

## API Endpoints

- `GET /api/contests/{contestId}` - Get contest details
- `POST /api/submissions` - Submit code
- `GET /api/submissions/{submissionId}` - Get submission status
- `GET /api/contests/{contestId}/leaderboard` - Get leaderboard

## Architecture

The platform uses an asynchronous submission queue:

1. User submits code via frontend
2. Backend creates a PENDING submission in PostgreSQL
3. Background worker picks up pending submissions
4. Code is executed in an isolated Docker container
5. Results are stored and leaderboard is updated
6. Frontend polls for updates

# Shodh Code Contest Platform

A lightweight, real-time coding contest platform with live Docker-based code execution and judging.

## Tech Stack

- **Backend**: Spring Boot (Java 21), PostgreSQL, Docker
- **Frontend**: Next.js 14, Tailwind CSS, Monaco Editor
- **Infrastructure**: Docker, Docker Compose

## Features

- Real-time code submission and judging
- Dockerized sandbox execution environment
- Live leaderboard with automatic updates
- Support for multiple programming languages
- Time and memory limit enforcement

## Prerequisites

- Docker & Docker Compose
- JDK 21 (for local development)
- Node.js 18+ (for local frontend development)
- Git

## Quick Start

### 1. Clone the repository

```bash
git clone <your-repo-url>
cd shodh-code-platform
```

### 2. Build the judge Docker image

```bash
cd infra/judge
docker build -t shodh-code-judge:latest .
cd ../..
```

### 3. Start all services

```bash
docker-compose up --build
```

### 4. Access the application

- **Frontend**: http://localhost:3000
- **Backend API**: http://localhost:8080/api
- **Database**: localhost:5432 (user: shodh, password: shodh123, db: shodh)

## Project Structure

```
shodh-code-platform/
├── backend/          # Spring Boot application
│   ├── src/
│   │   └── main/
│   │       ├── java/com/shodh/code/
│   │       └── resources/
│   ├── pom.xml
│   ├── Dockerfile
│   └── .gitignore
├── frontend/         # Next.js application
│   ├── src/
│   │   ├── app/
│   │   └── components/
│   ├── package.json
│   ├── next.config.js
│   ├── tailwind.config.js
│   ├── Dockerfile
│   └── .gitignore
├── infra/           # Infrastructure configs
│   ├── sql/         # Database init and seed scripts
│   │   ├── init.sql
│   │   └── seed.sql
│   └── judge/       # Judge Docker image
│       ├── Dockerfile
│       └── runner.sh
├── docker-compose.yml
├── .gitignore
└── README.md
```

## Development Phases

This project is being developed in structured phases with clear checkpoints:

### Phase 1: Project Infrastructure Setup ✅

- [x] Create project structure
- [x] GitHub repository setup with `.gitignore`
- [x] `docker-compose.yml` configuration
- [x] README documentation

### Phase 2: Database Schema & Seed Data

- [ ] SQL init scripts for schema creation
- [ ] SQL seed data (sample contests, problems, test cases, users)
- [ ] Verify database initialization

### Phase 3: Backend Core - Entities & Repositories

- [ ] Spring Boot setup (JDK 21)
- [ ] JPA entities (Contest, Problem, TestCase, Submission, User)
- [ ] Repository interfaces (Spring Data JPA)
- [ ] DTOs and validation

### Phase 4: API Controllers

- [ ] Implement REST endpoints
- [ ] Error handling
- [ ] Request/Response DTOs

### Phase 5: Async Submission Queue Worker

- [ ] `@Async` configuration
- [ ] Queue processing with `SELECT FOR UPDATE SKIP LOCKED`
- [ ] Submission state machine
- [ ] Restart resilience

### Phase 6: Judge Docker Setup

- [ ] Dockerfile for judge (JDK 21)
- [ ] `runner.sh` script
- [ ] Build and verify judge image

### Phase 7: Judge Integration

- [ ] ProcessBuilder integration
- [ ] Docker execution with resource limits
- [ ] Test case processing
- [ ] Output comparison logic
- [ ] Cleanup mechanisms

### Phase 8: Leaderboard Logic

- [ ] Aggregation queries
- [ ] Leaderboard endpoint implementation

### Phase 9: Frontend Setup & UI

- [ ] Next.js + Tailwind setup
- [ ] Routing and pages
- [ ] UI components
- [ ] Monaco Editor integration

### Phase 10: Frontend-Backend Integration

- [ ] API client implementation
- [ ] Join contest flow
- [ ] Submission with polling
- [ ] Leaderboard with polling

### Phase 11: End-to-End Verification

- [ ] Complete flow testing
- [ ] Bug fixes
- [ ] Container cleanup verification

### Phase 12: Documentation & Final Polish

- [ ] Complete README
- [ ] Code cleanup
- [ ] Optional enhancements

## Development

### Backend Development

```bash
cd backend
./mvnw spring-boot:run
```

### Frontend Development

```bash
cd frontend
npm install
npm run dev
```

## API Endpoints

- `GET /api/contests/{contestId}` - Get contest details
- `POST /api/submissions` - Submit code
- `GET /api/submissions/{submissionId}` - Get submission status
- `GET /api/contests/{contestId}/leaderboard` - Get leaderboard

## Architecture

The platform uses an asynchronous submission queue:

1. User submits code via frontend
2. Backend creates a PENDING submission in PostgreSQL
3. Background worker picks up pending submissions using `SELECT FOR UPDATE SKIP LOCKED`
4. Code is executed in an isolated Docker container with resource limits
5. Results are stored and leaderboard is updated
6. Frontend polls for submission status (2-3s) and leaderboard (15-30s)

### Security Features

- Network isolation for code execution (--network none)
- Resource limits (CPU, memory)
- Non-root user in containers
- Input sanitization
- Process locking to prevent duplicate processing

## Contributing

This is a single-developer prototype following professional development practices:

- Clear phase-based development
- Proper git workflow with meaningful commits
- No environment variables in version control
- Clean, readable, and refactored code
- Following Spring Boot and Next.js best practices
