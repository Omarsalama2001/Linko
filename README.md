## Linko Mobile App

<p align="center">
  <img src="https://imgs.search.brave.com/2lyRE-4XshkbU5dXMWjGUX_6KQQ7s5khROzKVASuoE8/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jZG4z/ZC5pY29uc2NvdXQu/Y29tLzNkL2ZyZWUv/dGh1bWIvZnJlZS1m/bHV0dGVyLWxvZ28t/M2QtaWNvbi1wbmct/ZG93bmxvYWQtNDY0/Mjc2MS5wbmc" 
       width="300" 
       alt="Islamina Logo"/>
</p>




### 🔐 Authentication

#### Login
| Login | Forgot Password |
|-------|-----------------|
| <img src="https://raw.githubusercontent.com/Omarsalama2001/Linko/main/linko/lib/assets/screenshots/login_image-portrait.png" width="200"> | <img src="https://raw.githubusercontent.com/Omarsalama2001/Linko/main/linko/lib/assets/screenshots/forget_password-portrait.png" width="200"> |

#### Sign Up
| Sign Up | Pick Photo | Birth Date | Pick Country | Gender |
|---------|------------|------------|--------------|--------|
| <img src="https://raw.githubusercontent.com/Omarsalama2001/Linko/main/linko/lib/assets/screenshots/register_image-portrait.png" width="200"> | <img src="https://raw.githubusercontent.com/Omarsalama2001/Linko/main/linko/lib/assets/screenshots/pickimage_image-portrait.png" width="200"> | <img src="https://raw.githubusercontent.com/Omarsalama2001/Linko/main/linko/lib/assets/screenshots/pickbirthday_image-portrait.png" width="200"> | <img src="https://raw.githubusercontent.com/Omarsalama2001/Linko/main/linko/lib/assets/screenshots/pickcountry_image-portrait.png" width="200"> | <img src="https://raw.githubusercontent.com/Omarsalama2001/Linko/main/linko/lib/assets/screenshots/pickgender_image-portrait.png" width="200"> |
### 🎥 Streaming
| No Live | Users Available | Live Stream |
|---------|-----------------|-------------|
| <img src="https://raw.githubusercontent.com/Omarsalama2001/Linko/main/linko/lib/assets/screenshots/home_image-portrait.png" width="300"> | <img src="https://raw.githubusercontent.com/Omarsalama2001/Linko/main/linko/lib/assets/screenshots/home2_image-portrait.png" width="300"> | <img src="https://raw.githubusercontent.com/Omarsalama2001/Linko/main/linko/lib/assets/screenshots/live_image-portrait.png" width="300"> |
### 💬 Lounge & Chat
| Lounge | Messages | Chat |
|--------|----------|------|
| <img src="https://raw.githubusercontent.com/Omarsalama2001/Linko/main/linko/lib/assets/screenshots/lounge_image-portrait.png" width="300"> | <img src="https://raw.githubusercontent.com/Omarsalama2001/Linko/main/linko/lib/assets/screenshots/messages_image-portrait.png" width="300"> | <img src="https://raw.githubusercontent.com/Omarsalama2001/Linko/main/linko/lib/assets/screenshots/chat_image-portrait.png" width="300"> |
### 👤 Profile & Settings
| Profile | Settings | Language |
|---------|----------|----------|
| <img src="https://raw.githubusercontent.com/Omarsalama2001/Linko/main/linko/lib/assets/screenshots/profile_image-portrait.png" width="300"> | <img src="https://raw.githubusercontent.com/Omarsalama2001/Linko/main/linko/lib/assets/screenshots/setting_image-portrait.png" width="300"> | <img src="https://raw.githubusercontent.com/Omarsalama2001/Linko/main/linko/lib/assets/screenshots/lang1_image-portrait.png" width="300"> |



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



## 🏗️ Architecture

This app is built using **Clean Architecture** pattern, which separates the code into 3 main layers:

| Layer | Responsibility |
|-------|---------------|
| 📊 **Data** | Remote & Local data sources, Models, Repository implementations |
| 🧠 **Domain** | Entities, Repository interfaces, Use cases (Business logic) |
| 🎨 **Presentation** | UI Screens, Widgets, Bloc/Cubit State Management |
<details>
<summary>📂 View Full Project Structure</summary>
```
📦 lib
...
```

</details>



## 🛠️ Tech Stack

<table>
  <tr>
    <td align="center" width="33.3%">
      <h3>📱 Core</h3>
      <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white"/>
      <br/><br/>
      <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white"/>
    </td>
    <td align="center" width="33.3%">
      <h3>🔥 Backend & Database</h3>
      <img src="https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black"/>
      <br/><br/>
      <img src="https://img.shields.io/badge/Cloud_Firestore-FFCA28?style=for-the-badge&logo=firebase&logoColor=black"/>
    </td>
    <td align="center" width="33.3%">
      <h3>🎯 State Management</h3>
      <img src="https://img.shields.io/badge/Flutter_Bloc-02569B?style=for-the-badge&logo=flutter&logoColor=white"/>
      <br/><br/>
      <img src="https://img.shields.io/badge/GetX-8B0000?style=for-the-badge&logo=flutter&logoColor=white"/>
    </td>
  </tr>
</table>

---

### 📦 Packages & Libraries

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
| `country_code_picker` | Country code selector |
| `country_flags` | Country flag icons |
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
| `purchases_flutter` | In-app purchases |

</details>
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
