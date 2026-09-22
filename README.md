# Learning Portal 🎓

A full-stack online learning platform built with **Spring Boot** and **React**. Supports three roles — Admin, Instructor, and Learner — with JWT-based authentication, course management, lesson tracking, and enrollment system. I didn't add front end cuz it's way too large , my bad.

---

## Features

### 👨‍🎓 Learner
- Browse and search all available courses
- Enroll in courses
- Track enrolled courses and mark as complete
- View course lessons and details

### 👨‍🏫 Instructor
- Create, update, and delete courses
- Add and remove lessons per course
- View enrollments for each course

### 🛡️ Admin
- View and manage all users
- Update user roles
- Delete users and courses
- View all enrollments across the platform

---

## Tech Stack

### Backend
| Tech | Usage |
|---|---|
| Spring Boot 3.2 | REST API framework |
| Spring Security + JWT | Authentication & role-based authorization |
| Spring Data JPA | ORM |
| MySQL 8 | Relational database |
| Lombok | Boilerplate reduction |

### Frontend
| Tech | Usage |
|---|---|
| React 18 | UI framework |
| React Router v6 | Client-side routing with protected routes |
| Axios | HTTP client with JWT interceptor |
| Context API | Global auth state management |

---

## Project Structure

```
learning-portal/
├── backend/
│   └── src/main/java/com/learningportal/app/
│       ├── entity/         # User, Course, Lesson, Enrollment
│       ├── repository/     # JPA repositories
│       ├── service/        # Business logic per role
│       ├── controller/     # Auth, Admin, Instructor, Learner, Course
│       ├── security/       # JwtUtil, JwtFilter
│       ├── config/         # SecurityConfig
│       └── dto/            # Request/Response DTOs
│
└── frontend/
    └── src/
        ├── pages/          # Home, Login, Register, Courses, CourseDetail
        │                     AdminDashboard, InstructorDashboard, LearnerDashboard
        ├── components/     # Navbar
        ├── services/       # api.js (all Axios calls)
        ├── AuthContext.js  # Global auth state
        └── App.js          # Routes with role-based ProtectedRoute
```

---

## API Endpoints

### Auth
| Method | Endpoint | Description |
|---|---|---|
| POST | `/api/auth/register` | Register new user |
| POST | `/api/auth/login` | Login and receive JWT token |

### Courses (Public)
| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/courses` | Get all courses (supports `?search=`) |
| GET | `/api/courses/{id}` | Get course by ID |
| GET | `/api/courses/{id}/lessons` | Get lessons for a course |

### Learner
| Method | Endpoint | Description |
|---|---|---|
| POST | `/api/learner/enroll/{courseId}` | Enroll in a course |
| PUT | `/api/learner/complete/{courseId}` | Mark course as complete |
| GET | `/api/learner/my-courses` | Get enrolled courses |

### Instructor
| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/instructor/courses` | Get own courses |
| POST | `/api/instructor/courses` | Create course |
| PUT | `/api/instructor/courses/{id}` | Update course |
| DELETE | `/api/instructor/courses/{id}` | Delete course |
| POST | `/api/instructor/courses/{id}/lessons` | Add lesson |
| DELETE | `/api/instructor/lessons/{id}` | Delete lesson |
| GET | `/api/instructor/courses/{id}/enrollments` | View enrollments |

### Admin
| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/admin/users` | Get all users |
| PUT | `/api/admin/users/{id}/role` | Update user role |
| DELETE | `/api/admin/users/{id}` | Delete user |
| GET | `/api/admin/courses` | Get all courses |
| DELETE | `/api/admin/courses/{id}` | Delete course |
| GET | `/api/admin/enrollments` | Get all enrollments |

---

## Getting Started

### Prerequisites
- Java 17
- Maven 3.9+
- MySQL 8
- Node.js 18+

### Backend Setup
```bash
# 1. Start MySQL
# 2. Update password in application.properties if needed
#    spring.datasource.password=your_password

cd backend
mvn spring-boot:run
```
Backend runs on `http://localhost:8080`  
Database `learning_portal` is auto-created on first run.

### Frontend Setup
```bash
cd frontend
npm install
npm start
```
Frontend runs on `http://localhost:3000`

---

## Roles & Access

| Role | Access |
|---|---|
| LEARNER | Browse courses, enroll, track progress |
| INSTRUCTOR | Manage own courses and lessons |
| ADMIN | Full platform control |

> Default role on register is **LEARNER**. Admin can promote users via dashboard.

---

## License

MIT License — free to use and modify.
