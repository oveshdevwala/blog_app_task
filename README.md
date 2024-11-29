![image](https://github.com/user-attachments/assets/2a3263af-d6f7-452e-bbec-571b4d062669)# Blog App with Firebase and Deep Linking

This Flutter project demonstrates a blog application with the following features:
- Fetching blog posts from **Firebase Cloud Firestore**.
- Displaying blog posts in a **scrollable list**.
- Implementing **deep linking** to navigate directly to a specific blog post.
- A responsive and visually appealing UI designed for mobile devices.

---

## 🌟 Features
1. **Firestore Integration**:
   - Blogs are fetched from Firebase Cloud Firestore.
   - Each blog includes:
     - `imageURL`: URL of the featured image.
     - `title`: Title of the blog.
     - `summary`: A short description.
     - `content`: Full content displayed in the details view.
     - `deeplink`: A unique URL for deep linking.

2. **Deep Linking**:
   - Clicking on a deep link (e.g., `https://blog-app-task-4e492.web.app/blog/2`) navigates to the corresponding blog post in the list.
   - Appropriate feedback is provided if the URL is invalid or the blog ID is not found.

3. **UI/UX**:
   - Uses `ListView.builder` for a vertically scrollable list of blogs.
   - Includes "Read More" functionality to display the full content.
   - Responsive design for mobile devices.

4. **State Management**:
   - The app uses **Bloc** for managing state and logic.

---

## 🚀 Demo
Here are some sample deep link URLs for testing:
- **General Blog App Open URL** (no parameters):  
  `https://blog-app-task-4e492.web.app/blog`
- **Valid Direct Blog URL**:  
  `https://blog-app-task-4e492.web.app/blog/2`
- **Invalid Blog URL**:  
  `https://blog-app-task-4e492.web.app/blog/31`
- Total Blog Item is 30
- Blog ids [1-30]
---

## 🛠️ Setup Instructions

### Prerequisites
1. Install [Flutter](https://flutter.dev/docs/get-started/install).
2. Set up [Firebase](https://firebase.google.com/docs/flutter/setup) for the project:
   - Add the `google-services.json` file to your `android/app` folder.
   - Add the `GoogleService-Info.plist` file to your `ios/Runner` folder.
3. Ensure Firestore is configured with a `blogs` collection containing fields:
   - `id`: Blog ID (integer).
   - `imageURL`: Featured image URL (string).
   - `title`: Blog title (string).
   - `summary`: Blog summary (string).
   - `content`: Full blog content (string).
   - `deeplink`: Blog deep link (string).

### Installation
1. Clone the repository:
   ```bash
   git clone <repository_url>
   ```
2. Navigate to the project folder:
   ```bash
   cd blog-app
   ```
3. Get dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

---

## 📂 Project Structure
```
blog-app/
├── lib/
│   ├── features/
│   │   ├── blog/
│   │   │   ├── models/
│   │   │   ├── repository/
│   │   │   ├── bloc/
│   │   │   ├── screens/
│   │   │   └── widgets/
│   ├── core/
│   │   ├── common/
│   │   └── theme/
│   └── main.dart
├── android/
├── ios/
├── pubspec.yaml
└── README.md
```

### Key Directories
- **`features/blog`**: Handles all blog-related functionality.
- **`core/theme`**: Contains the app's theme settings.

---

## 📑 Assumptions
1. Blogs have unique IDs stored as integers in Firestore.
2. Firestore rules allow read access for this demo.
3. The app is designed for mobile devices.

---

## 💡 Additional Features
- Copyable deep links in blog details.
- Snackbar for URL copy confirmation.
- Error handling for invalid or missing blog data.

---

## 📋 Testing the App
- **Deep Link Scenarios**:
  - Valid links navigate to the correct blog.
  - Invalid links show error feedback.
  - Generic blog URL opens the main blog list.

- **Firestore Data Validation**:
  - Ensure Firestore data matches the schema defined above.

---

## 🏗️ State Management
This project uses **Bloc** for state management:
- `BlogBloc`: Manages fetching blogs and handling deep linking.

---

## 📸 Screenshots
![image](https://github.com/user-attachments/assets/b04835f5-8ec9-4f68-9d70-0d8f00781143)
![image](https://github.com/user-attachments/assets/42f12246-270a-410d-ae18-d317358322f1)


--------------------------------------------------------------------------------------------------
