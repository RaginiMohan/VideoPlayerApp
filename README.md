# 🎥 Video Player App

Developed a dynamic, two-page mobile application that leverages the Pexels API to provide a seamless video discovery and playback experience.

---

## 🚀 Features

### 📱 Home Screen (Video Discovery)
- Displays videos in a responsive **3-column grid**
- Shows video thumbnail, duration, and creator name
- Supports smooth scrolling and fast loading

### ▶️ Player Screen (Playback Experience)
- High-quality video playback using **AVKit**
- Clean and immersive UI
- Tap on any video to start playback

### 🔄 Continuous Play / Next Up
- “Next Up” section with **3 items per row grid**
- Highlights currently playing video
- Tap any item to switch instantly

### ⏭️ Autoplay Logic
- Automatically plays the next video when current video ends
- Seamless transition without user interaction

---

## 🏗️ Architecture

- **MVVM (Model-View-ViewModel)**
- Separation of concerns for scalability and maintainability

---

## 🛠️ Tech Stack

- SwiftUI
- AVKit (Video Playback)
- Combine / Async-Await
- URLSession (Networking)

---

## 🌐 API

- Integrated with **Pexels API** for fetching video content  
- Handles pagination and dynamic data loading

---

## ⚡ Performance & Optimization

- Efficient rendering using **LazyVGrid**
- Avoided retain cycles in AVPlayer handling
- Smooth scrolling and playback transitions

---

## 📸 Screenshots

> Add screenshots here (optional but recommended)

---

## 📌 Notes

- Designed with focus on **UX and performance**
- Clean, modular, and reusable components
- Easily extendable for features like fullscreen, reels-style UI, etc.

---

## 👩‍💻 Author

Ragini M
ragini.official2722@gmail.com
