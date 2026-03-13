# Gamified Learning Dashboard

A fully functional gamified learning platform with quizzes, badges, achievements, leaderboard, and AI features.

## Features

### User System
- User registration and login with JWT authentication
- User profiles with points, badges, and achievements tracking
- Secure password encryption

### Quiz System
- Multiple categories (Math, Science, History, Technology)
- Multiple-choice questions with instant feedback
- Score tracking per user
- Progress bar for quiz completion

### Leaderboard
- Real-time ranking by points
- Display user stats (points, badges, achievements)
- Competitive gaming experience

### Badges & Achievements
- Automatic badge awarding based on milestones
- Achievement tracking
- Visual badge display in user profile

### AI Features
- AI Question Generator (simulated)
- Chatbot Assistant for user guidance
- Expandable for real AI integration

## Tech Stack

### Backend
- Java 17
- Spring Boot 3.2.0
- Spring Security with JWT
- Spring Data JPA
- MySQL Database
- Lombok

### Frontend
- HTML5
- CSS3 with animations
- Vanilla JavaScript
- Responsive design

## Setup Instructions

### Prerequisites
- Java 17 or higher
- Maven
- MySQL Server
- Modern web browser

### Database Setup

1. Install MySQL and start the server
2. Create database (auto-created by application):
```sql
CREATE DATABASE learning_dashboard;
```

3. Update credentials in `backend/src/main/resources/application.properties`:
```properties
spring.datasource.username=your_username
spring.datasource.password=your_password
```

### Backend Setup

1. Navigate to backend directory:
```bash
cd backend
```

2. Build the project:
```bash
mvn clean install
```

3. Run the application:
```bash
mvn spring-boot:run
```

The backend will start on `http://localhost:8080`

### Frontend Setup

1. Navigate to frontend directory:
```bash
cd frontend
```

2. Open `index.html` in a web browser, or use a local server:
```bash
# Using Python
python -m http.server 3000

# Using Node.js
npx http-server -p 3000
```

3. Access the application at `http://localhost:3000`

## API Endpoints

### Authentication
- `POST /api/auth/register` - Register new user
- `POST /api/auth/login` - Login user

### Users
- `GET /api/users/profile/{username}` - Get user profile
- `GET /api/users/leaderboard` - Get leaderboard

### Categories
- `GET /api/categories` - Get all categories
- `POST /api/categories` - Create category

### Quiz
- `GET /api/quiz/questions` - Get all questions
- `GET /api/quiz/questions/category/{categoryId}` - Get questions by category
- `POST /api/quiz/submit` - Submit answer

### Badges
- `GET /api/badges` - Get all badges
- `GET /api/badges/user/{userId}` - Get user badges

### AI
- `POST /api/ai/generate-question` - Generate AI question
- `POST /api/ai/chatbot` - Chat with AI assistant

## Default Data

The application initializes with:
- 4 categories (Math, Science, History, Technology)
- Sample questions for each category
- 3 badges (First Steps, Point Collector, Accurate Answerer)

## Usage

1. Register a new account or login
2. View your dashboard with stats
3. Select a category to start a quiz
4. Answer questions and earn points
5. Unlock badges and achievements
6. Check the leaderboard to see your ranking
7. Use the AI chatbot for help

## Mobile Responsive

The application is fully responsive and works on:
- Desktop browsers
- Tablets
- Mobile devices

## Future Enhancements

- Real AI integration (OpenAI, Google AI)
- Social features (friends, challenges)
- More quiz categories
- Timed quizzes
- Difficulty levels
- User avatars
- Email notifications
- Quiz creation by users
- Admin dashboard

## License

MIT License
