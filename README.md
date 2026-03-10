<p align="center">
  <img src="https://raw.githubusercontent.com/Omarsalama2001/linko/main/lib/assets/screenshots/home2_image-portrait.png"
       width="200" 
       alt="Linko Logo"/>
</p>

<h1 align="center">Linko</h1>
<p align="center">
  A Flutter-based live streaming and chat application powered by ZegoCloud & Firebase.
</p>

<p align="center">
  <a href="https://github.com/Omarsalama2001/Linko">
    <img src="https://img.shields.io/badge/GitHub-View%20Code-100000?style=for-the-badge&logo=github&logoColor=white"/>
  </a>
  <img src="https://img.shields.io/badge/Flutter-Mobile-02569B?style=for-the-badge&logo=flutter&logoColor=white"/>
  <img src="https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black"/>
  <img src="https://img.shields.io/badge/ZegoCloud-Live%20Streaming-blue?style=for-the-badge"/>
</p>

---

## ✨ Features

<table>
  <tr>
    <td align="center" width="50%">
      <h3>🔐 Authentication</h3>
      <p>Full authentication system with <strong>Email & Password</strong> login and registration with email verification</p>
    </td>
    <td align="center" width="50%">
      <h3>🎥 Live Streaming</h3>
      <p>Host or join live streams in real-time powered by <strong>ZegoCloud</strong></p>
    </td>
  </tr>
  <tr>
    <td align="center" width="50%">
      <h3>💬 Lounge & Chat</h3>
      <p>Discover other users in the Lounge and start <strong>real-time conversations</strong> with them</p>
    </td>
    <td align="center" width="50%">
      <h3>👤 Profile</h3>
      <p>Full user profile with <strong>avatar, birthdate, country</strong> and personal information</p>
    </td>
  </tr>
  <tr>
    <td align="center" width="50%">
      <h3>⚙️ Settings</h3>
      <p>Manage your account settings with <strong>logout</strong> functionality and app preferences</p>
    </td>
    <td align="center" width="50%">
      <h3>🌍 Multi-language</h3>
      <p>Full support for <strong>Arabic & English</strong> languages with easy switching</p>
    </td>
  </tr>
  <tr>
    <td align="center" width="50%">
      <h3>🔍 Search <em>(Coming Soon)</em></h3>
      <p>Search for users and live streams easily</p>
    </td>
    <td align="center" width="50%">
      <h3>🔑 Google Sign In <em>(Coming Soon)</em></h3>
      <p>Sign in quickly and securely with your <strong>Google account</strong></p>
    </td>
  </tr>
</table>

---

## 🛠️ Tech Stack

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white"/>
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white"/>
  <img src="https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black"/>
  <img src="https://img.shields.io/badge/Flutter_Bloc-02569B?style=for-the-badge&logo=flutter&logoColor=white"/>
  <img src="https://img.shields.io/badge/GetX-8B0000?style=for-the-badge&logo=flutter&logoColor=white"/>
</p>

---

### 📦 Key Packages

<details>
<summary>🔍 View All Packages</summary>

<br/>

#### 🔐 Authentication & Security
| Package | Description |
|---------|-------------|
| `firebase_auth` | User authentication with Firebase |
| `google_sign_in` | Sign in with Google account |
| `envied` | Secure environment variables |

---

#### 🎥 Live Streaming & Chat
| Package | Description |
|---------|-------------|
| `zego_uikit` | ZegoCloud UI Kit |
| `zego_uikit_prebuilt_live_streaming` | Prebuilt live streaming UI |
| `zego_uikit_signaling_plugin` | Signaling for real-time communication |
| `zego_zimkit` | In-app chat & messaging |
| `zego_zpns` | Push notifications for Zego |

---

#### 🔥 Firebase Services
| Package | Description |
|---------|-------------|
| `firebase_core` | Firebase core setup |
| `cloud_firestore` | Real-time NoSQL database |
| `firebase_storage` | Cloud file storage |

---

#### 🌐 Networking & Connectivity
| Package | Description |
|---------|-------------|
| `connectivity_plus` | Monitor internet connection |
| `internet_connection_checker` | Check internet availability |
| `internet_connection_checker_plus` | Advanced internet checker |

---

#### 💾 Local Storage
| Package | Description |
|---------|-------------|
| `shared_preferences` | Local key-value storage |

---

#### 🎨 UI & UX
| Package | Description |
|---------|-------------|
| `flutter_screenutil` | Responsive UI design |
| `lottie` | Beautiful animations |
| `shimmer` | Loading shimmer effect |
| `cached_network_image` | Efficient image caching |
| `flutter_card_swiper` | Card swipe UI |
| `auto_size_text` | Auto-sizing text widget |
| `country_picker` | Country selection picker |
| `image_picker` | Pick images from gallery/camera |

---

#### 🔧 Utilities
| Package | Description |
|---------|-------------|
| `get_it` | Dependency injection |
| `dartz` | Functional programming |
| `equatable` | Value equality |
| `intl` | Internationalization & localization |
| `flutter_localization` | Multi-language support |

</details>

---

## 🏗️ Architecture

This app is built using **Clean Architecture** pattern:

| Layer | Responsibility |
|-------|---------------|
| 📊 **Data** | Remote & Local data sources, Models, Repository implementations |
| 🧠 **Domain** | Entities, Repository interfaces, Use cases (Business logic) |
| 🎨 **Presentation** | UI Screens, Widgets, Bloc/Cubit State Management |

<details>
<summary>📂 View Full Project Structure</summary>

```
📦 lib
 ├── 📄 bloc_observer.dart
 ├── 📄 firebase_options.dart
 ├── 📄 injectionContainer.dart
 ├── 📄 main.dart
 │
 ├── 📂 env
 │   ├── 📄 env.dart
 │   └── 📄 env.g.dart
 │
 ├── 📂 core
 │   ├── 📄 services.dart
 │   ├── 📂 constants
 │   ├── 📂 error
 │   ├── 📂 extensions
 │   ├── 📂 network
 │   ├── 📂 strings
 │   ├── 📂 utils
 │   │   ├── 📂 Localization
 │   │   ├── 📂 styles
 │   │   └── 📂 theme
 │   └── 📂 widgets
 │
 └── 📂 features
     ├── 📂 auth
     │   ├── 📂 data
     │   ├── 📂 domain
     │   └── 📂 presentation
     │       ├── 📂 blocs
     │       ├── 📂 pages
     │       └── 📂 widgets
     │
     ├── 📂 home
     │   ├── 📂 data
     │   ├── 📂 domain
     │   └── 📂 presentation
     │
     ├── 📂 lounge
     │   ├── 📂 data
     │   ├── 📂 domain
     │   └── 📂 presentation
     │
     ├── 📂 profile
     │   ├── 📂 data
     │   ├── 📂 domain
     │   └── 📂 presentation
     │
     └── 📂 streaming
         ├── 📂 data
         ├── 📂 domain
         └── 📂 presentation
```

</details>

---

## 📸 Screenshots

### 🔐 Login
<table>
  <tr>
    <td align="center">
      <strong>Login</strong><br/><br/>
      <img src="https://raw.githubusercontent.com/Omarsalama2001/linko/main/lib/assets/screenshots/login_image-portrait.png" width="250"/>
    </td>
    <td align="center">
      <strong>Forgot Password</strong><br/><br/>
      <img src="https://raw.githubusercontent.com/Omarsalama2001/linko/main/lib/assets/screenshots/forget_password-portrait.png" width="250"/>
    </td>
  </tr>
</table>

---

### 📝 Sign Up
<table>
  <tr>
    <td align="center">
      <strong>Sign Up</strong><br/><br/>
      <img src="https://raw.githubusercontent.com/Omarsalama2001/linko/main/lib/assets/screenshots/register_image-portrait.png" width="220"/>
    </td>
    <td align="center">
      <strong>Pick Photo</strong><br/><br/>
      <img src="https://raw.githubusercontent.com/Omarsalama2001/linko/main/lib/assets/screenshots/pickimage_image-portrait.png" width="220"/>
    </td>
    <td align="center">
      <strong>Birth Date</strong><br/><br/>
      <img src="https://raw.githubusercontent.com/Omarsalama2001/linko/main/lib/assets/screenshots/pickbirthday_image-portrait.png" width="220"/>
    </td>
    <td align="center">
      <strong>Pick Country</strong><br/><br/>
      <img src="https://raw.githubusercontent.com/Omarsalama2001/linko/main/lib/assets/screenshots/pickcountry_image-portrait.png" width="220"/>
    </td>
    <td align="center">
      <strong>Gender</strong><br/><br/>
      <img src="https://raw.githubusercontent.com/Omarsalama2001/linko/main/lib/assets/screenshots/pickgender_image-portrait.png" width="220"/>
    </td>
  </tr>
</table>

---

### 🎥 Streaming
<table>
  <tr>
    <td align="center">
      <strong>No Live</strong><br/><br/>
      <img src="https://raw.githubusercontent.com/Omarsalama2001/linko/main/lib/assets/screenshots/home_image-portrait.png" width="250"/>
    </td>
    <td align="center">
      <strong>Users Available</strong><br/><br/>
      <img src="https://raw.githubusercontent.com/Omarsalama2001/linko/main/lib/assets/screenshots/home2_image-portrait.png" width="250"/>
    </td>
    <td align="center">
      <strong>Live Stream</strong><br/><br/>
      <img src="https://raw.githubusercontent.com/Omarsalama2001/linko/main/lib/assets/screenshots/live_image-portrait.png" width="250"/>
    </td>
  </tr>
</table>

---

### 💬 Lounge & Chat
<table>
  <tr>
    <td align="center">
      <strong>Lounge</strong><br/><br/>
      <img src="https://raw.githubusercontent.com/Omarsalama2001/linko/main/lib/assets/screenshots/lounge_image-portrait.png" width="250"/>
    </td>
    <td align="center">
      <strong>Messages</strong><br/><br/>
      <img src="https://raw.githubusercontent.com/Omarsalama2001/linko/main/lib/assets/screenshots/messages_image-portrait.png" width="250"/>
    </td>
    <td align="center">
      <strong>Chat</strong><br/><br/>
      <img src="https://raw.githubusercontent.com/Omarsalama2001/linko/main/lib/assets/screenshots/chat_image-portrait.png" width="250"/>
    </td>
  </tr>
</table>

---

### 👤 Profile & Settings
<table>
  <tr>
    <td align="center">
      <strong>Profile</strong><br/><br/>
      <img src="https://raw.githubusercontent.com/Omarsalama2001/linko/main/lib/assets/screenshots/profile_image-portrait.png" width="250"/>
    </td>
    <td align="center">
      <strong>Settings</strong><br/><br/>
      <img src="https://raw.githubusercontent.com/Omarsalama2001/linko/main/lib/assets/screenshots/setting_image-portrait.png" width="250"/>
    </td>
    <td align="center">
      <strong>Language</strong><br/><br/>
      <img src="https://raw.githubusercontent.com/Omarsalama2001/linko/main/lib/assets/screenshots/lang1_image-portrait.png" width="250"/>
    </td>
  </tr>
</table>

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK >= 3.4.1
- Firebase Account
- ZegoCloud Account

### Installation
1. Clone the repo
   ```bash
   git clone https://github.com/Omarsalama2001/Linko.git
   ```
2. Install dependencies
   ```bash
   flutter pub get
   ```
3. Create `.env` file and add your keys
   ```
   ZEGO_CHAT_APP_ID=your_chat_app_id_here
   ZEGO_CHAT_APP_SIGN=your_chat_app_sign_here
   ZEGO_LIVE_STREAMING_APP_ID=your_live_streaming_app_id_here
   ZEGO_LIVE_STREAMING_APP_SIGN=your_live_streaming_app_sign_here
   ```
4. Run the app
   ```bash
   flutter run
   ```

---

## 📬 Contact

<p align="left">
  <a href="mailto:omarrsalama90111@gmail.com">
    <img src="https://img.shields.io/badge/Email-D14836?style=for-the-badge&logo=gmail&logoColor=white"/>
  </a>
  <a href="https://www.linkedin.com/in/0marsalama">
    <img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white"/>
  </a>
  <a href="https://github.com/Omarsalama2001">
    <img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white"/>
  </a>
</p>
