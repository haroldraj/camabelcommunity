# Camabel Community

Camabel Community is a mobile application designed to **connect, inform, and strengthen the Malagasy Catholic community in Belgium**.

The app centralizes events, liturgical programs, songs, and community information in one place, replacing scattered communication across social media and messaging apps.

---

## ✨ Purpose

The Camabel community currently shares important information through Facebook posts, WhatsApp messages, and word of mouth. This makes it difficult for members to stay informed.

This application provides a **single, accessible, and structured platform** to:

- stay informed about upcoming events  
- access Mass programs and schedules  
- view song lyrics used during celebrations  
- revisit past events and community activities  

---

## 📱 Features

### Events Management
- View upcoming community events  
- Access event details and schedules  
- Browse past events history  

### Mass & Program Timeline
- Timeline view of Mass programs  
- Structured display of celebrations and activities  

### Song Library
- Access songs used during Mass  
- View lyrics and references  
- Designed for quick access during celebrations  

### Offline-first Experience
- Firebase caching enables data access even with poor connectivity  

---

## 🏗 Architecture

The project follows **Clean Architecture principles** to ensure scalability, maintainability, and testability.

### Layers

- **Presentation** — Flutter UI + BLoC  
- **Domain** — Entities & Use Cases  
- **Data** — Repositories & Data Sources  
- **Core** — Utilities, helpers, constants  

---

## 🛠 Tech Stack

### Frontend
- Flutter  
- Dart  

### State Management
- BLoC  

### Backend & Services
- Firebase Firestore  
- Firebase Authentication *(planned)*  
- Firebase Hosting *(future admin panel)*  

### Architecture & Tools
- Clean Architecture  
- Dependency Injection  
- Unit & Widget Testing  

---

## 📸 Screens (Coming Soon)

Screenshots will be added as the UI evolves.

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK installed  
- Firebase project configured  

### Installation

```bash
git clone https://github.com/your-username/camabelcommunity.git
cd camabelcommunity
flutter pub get