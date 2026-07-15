# 💳 E-Wallet

A secure and modern digital wallet application inspired by InstaPay, built with Flutter and Firebase.

## 📌 Overview

E-Wallet is a fintech mobile application that allows users to securely transfer and deposit money using a simple and intuitive interface.

The application focuses on transaction reliability and consistency by using Firestore atomic transactions and idempotency protection to prevent duplicate operations.

## 🎥 Demo Video


https://github.com/user-attachments/assets/65360560-5fb7-4f36-a5da-e66594e3ddd7



## ✨ Features

- 📱 Phone Authentication with OTP verification
- 🔐 PIN/Fingerprint verification for sensitive actions
- 💸 Money transfer using phone number
- 💳 Deposit money using Paymob integration
- 📜 Transaction history with ledger system
- 🌙 Dark mode support
- 🌍 Arabic & English localization
- 🔄 Hydrated state persistence
- ⚡ Atomic transactions using Firestore transactions
- 🛡️ Idempotency protection against duplicate requests

## 📸 Screenshots

### 🔐 Authentication

| Login | OTP Verification | Biometric / PIN |
|-------|-----------------|-----------------|
| <img src="screenshots/login_screen.png" width="250"> | <img src="screenshots/otp_screen.png" width="250"> | <img src="screenshots/biometric.png" width="250"> |

---

### 🏠 Dashboard & Navigation

| Home (Light) | Home (Dark) | Arabic Localization |
|-------------|-------------|---------------------|
| <img src="screenshots/home_light.png" width="250"> | <img src="screenshots/home_dark.png" width="250"> | <img src="screenshots/home_ar.png" width="250"> |

| Drawer |
|--------|
| <img src="screenshots/drawer.png" width="250"> |

---

### 💸 Money Transfer

| Transfer Sheet | Transfer Verification | Success |
|---------------|----------------------|---------|
| <img src="screenshots/transfer_sheet.png" width="250"> | <img src="screenshots/transfer_biometric.png" width="250"> | <img src="screenshots/success.png" width="250"> |

---

### 📜 Transaction History

| Transaction History |
|--------------------|
| <img src="screenshots/history.png" width="250"> |

---

### 💳 Deposit Flow

| Deposit Sheet | Paymob Integration |
|--------------|-------------------|
| <img src="screenshots/deposit.png" width="250"> | <img src="screenshots/deposit_paymob.png" width="250"> |

## 🔒 Transaction Safety

To ensure transaction consistency and prevent duplicate operations:

- Firestore atomic transactions are used to guarantee consistency between sender and receiver balances.
- Idempotency keys prevent duplicate transaction processing caused by retries or repeated requests.
- Ledger entries provide a complete and auditable transaction history.

## 🏗️ Architecture

- MVVM Architecture
- Repository Pattern
- Dependency Injection using GetIt
- State Management using Flutter Bloc/Cubit
- Feature-Based Project Structure

## 🛠️ Tech Stack

- Flutter
- Dart
- Firebase Authentication
- Cloud Firestore
- Flutter Bloc
- GetIt
- Hydrated Bloc
- Paymob SDK
- Flutter Intl
