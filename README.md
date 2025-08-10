# ⏱️ Flutter Stopwatch App

A simple and elegant stopwatch application built with **Flutter**, featuring start, pause, reset functionalities and a **dark/light theme toggle**.

---

## 📌 Features

- **Start, Pause, and Reset** stopwatch controls.
- **Accurate timing** down to centiseconds (MM:SS:CS format).
- **Dark/Light theme toggle** with real-time switching.
- **Modern UI** with a circular display and shadow effects.
- Responsive and clean Material Design.

---

## 📂 Project Structure

```
lib/
├── main.dart                # App entry point, theme handling
└── stopwatch_home.dart      # Stopwatch logic and UI
```

---

## 🛠️ Installation & Usage

1. **Clone the repository**

   ```bash
   git clone git clone https://github.com/petersoluki/PRODIGY_AD_03.git
   ```

2. **Navigate to the project folder**

   ```bash
   cd PRODIGY_AD_02
   ```

3. **Install dependencies**

   ```bash
   flutter pub get
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

---

## 🎯 How It Works

- The **`StopwatchHome`** widget manages the stopwatch timer using `Timer.periodic`.
- Time is calculated by storing the start time and subtracting it from the current time.
- Time format: **Minutes:Seconds:Centiseconds**.
- Theme switching is handled by a boolean `_isDarkMode` in **`main.dart`**.

---

## 💡 Future Improvements

- Add lap time recording.
- Save and load times using local storage.
- Customizable colors and UI themes.

---

## 📜 License

This project is open-source and available under the **MIT License**.

---

**Author:** Peter Eze 📧 [petersoluki@gmail.com]
🔗 https://www.linkedin.com/in/peter-eze-036a0b25a/ | https://github.com/petersoluki
