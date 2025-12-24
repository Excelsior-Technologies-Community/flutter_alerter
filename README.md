# Alerter 

A beautiful, lightweight Flutter package to show animated **top alert banners**
similar to system notifications.

`flutter_alerter` allows you to display alerts at the top of the screen with
smooth slide animations, icons, progress indicators, tap actions, and custom durations.

---

## ✨ Features

- 🚀 Animated top overlay alert
- 🎨 Custom background colors
- 🔔 Optional icons
- ⏳ Progress (loading) alert
- ♾ Infinite duration alert
- 👆 Tap to dismiss / tap callback
- 🧼 Clean & simple API
- 📦 Library & pub.dev ready

---

## 📸 Preview
![screen-20251224-1221482](https://github.com/user-attachments/assets/2011d1f4-8a2a-479e-a0f5-866b8b52c32d)

---
---
## ✨ Installation
Add this to your package's pubspec.yaml file:
```
dependencies:
  flutter_alerter:
    path: ../flutter_alerter  # For local development
```
from git:
```
dependencies:
  flutter_alerter:
    git:
      url: https://github.com/yourusername/flutter_alerter.git  # Your github path
``` 
Then run:
```
flutter pub get
```
---

## 📁 Project Structure
```
flutter_alerter/
│
├── lib/
│   ├── flutter_alerter.dart        # Main library entry (public API)
│   │
│   └── alerter/
│   │    ├── alerter.dart            # FlutterAlerter.show() API
│   │    ├── alerter_controller.dart # Overlay & alert handling logic
│   │    │
│   │    └── widgets/
│   │        └── top_alert_banner.dart
│   │            # UI + animation for top alert banner
│   │
|   │
│   │
│   └── main.dart               # Example app demonstrating all alerts
│
├── test/
│   └── flutter_alerter_test.dart   # Basic widget test
│
├── pubspec.yaml                    # Package configuration
├── README.md                       # Documentation

```
---
## 📥 Import
```
import 'package:flutter_alerter/flutter_alerter.dart';

```
---

## 🚀 Usage
### 🔔 Basic Alert
```
Alerter.show(
  context,
  title: 'Hello',
  message: 'This is a top alert',
);
```
### 🎨 Colored Alert with Icon
```
Alerter.show(
  context,
  title: 'Success',
  message: 'Profile updated successfully',
  backgroundColor: Colors.green,
  icon: Icons.check_circle,
);
```
### ⏳ Progress Alert
```
Alerter.show(
  context,
  title: 'Loading',
  message: 'Please wait...',
  showProgress: true,
  duration: const Duration(seconds: 5),
);
```
### ♾ Infinite Duration Alert
```
Alerter.show(
  context,
  title: 'Warning',
  message: 'Tap to dismiss',
  backgroundColor: Colors.red,
  duration: const Duration(days: 365),
);

```
### 👆 On Tap Alert
```
Alerter.show(
  context,
  title: 'Action',
  message: 'Tap this alert',
  icon: Icons.touch_app,
  onTap: () {
    print('Alert tapped!');
  },
);
```
---
## 🧩 Parameters

| Parameter         | Type          | Description            |
| ----------------- | ------------- | ---------------------- |
| `context`         | BuildContext  | Required build context |
| `title`           | String        | Alert title            |
| `message`         | String        | Alert message          |
| `backgroundColor` | Color         | Background color       |
| `icon`            | IconData?     | Optional icon          |
| `showProgress`    | bool          | Show loading indicator |
| `duration`        | Duration      | Alert duration         |
| `onTap`           | VoidCallback? | Callback on alert tap  |

---
## ⚠️ Important Notes
* Call alert inside a widget that has Overlay (Scaffold / MaterialApp)
* Infinite duration alerts are dismissed by tap
* Only one alert visible at a time (queue support coming soon)
---
## 📜 License
MIT License
```
Copyright (c) 2025 Excelsior Technologies

Permission is hereby granted, free of charge, to any person obtaining a copy  
of this software and associated documentation files (the "Software"), to deal  
in the Software without restriction, including without limitation the rights  
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell  
copies of the Software, and to permit persons to whom the Software is  
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all  
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED **"AS IS"**, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,  
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
```
---
