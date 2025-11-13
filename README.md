# 🥪 Sandwich Shop

A Flutter application that lets users order custom sandwiches with different bread types, sizes, and special notes. This is a learning project demonstrating Flutter fundamentals including state management, UI components, and repository pattern architecture.

**Author:** Alecxis Almoneda  
**GitHub:** [@AxisAlmond](https://github.com/AxisAlmond)

## Overview

The Sandwich Shop app provides an intuitive interface for managing sandwich orders. Users can:

- **Customize sandwich size** – Toggle between six-inch and footlong options
- **Select bread type** – Choose from white, wheat, or wholemeal bread
- **Adjust quantity** – Add or remove sandwiches with an enforced maximum limit
- **Add special instructions** – Include custom notes (e.g., "no onions", "extra pickles")
- **Visual feedback** – Real-time order summary with emoji sandwich count

The app demonstrates core Flutter patterns including stateful widgets, repository pattern for business logic, and styled UI components.

## Project Architecture

### Directory Structure

```
lib/
├── main.dart                 # App entry point with UI and state management
├── repositories/
│   └── order_repository.dart # Business logic for quantity management
└── views/
    └── app_styles.dart       # Centralized text styling constants

test/
├── repositories/
│   └── order_repository_test.dart  # Unit tests for OrderRepository
└── views/
    └── widget_test.dart            # Widget integration tests
```

### Key Components

**OrderRepository** (`lib/repositories/order_repository.dart`)
- Manages sandwich quantity state with min/max constraints
- Provides `canIncrement` and `canDecrement` getters for UI button validation
- Ensures quantity never exceeds `maxQuantity` or goes below 0

**OrderScreen** (`lib/main.dart`)
- Main stateful widget managing UI state and user interactions
- Handles bread type selection, sandwich size toggle, and notes input
- Integrates OrderRepository for quantity management

**Styled Components**
- `StyledButton` – Reusable button with icon and dynamic styling
- `OrderItemDisplay` – Shows quantity, bread type, size, and special notes
- `AppStyles` – Centralized text styling (normalText, heading1)

## Getting Started

### Prerequisites

Ensure you have the following installed:

- **Flutter SDK** (version 2.17.0 or higher)
  ```bash
  flutter --version
  ```
- **Dart** (included with Flutter)
- **Git**
- A terminal/command line tool

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/AxisAlmond/sandwich_shop.git
   cd sandwich_shop
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Verify your Flutter setup**
   ```bash
   flutter doctor
   ```

### Running the App

**Web Browser (Recommended)**
```bash
flutter run -d chrome
```

**iOS (macOS only)**
```bash
flutter run -d ios
```

**Android**
```bash
flutter run -d android
```

**All Connected Devices**
```bash
flutter devices          # List connected devices
flutter run -d <device_id>
```

## Development Workflow

### Running Tests

Execute the unit test suite to verify OrderRepository logic:

```bash
flutter test
```

Run specific test file:
```bash
flutter test test/repositories/order_repository_test.dart
```

Run widget tests:
```bash
flutter test test/views/widget_test.dart
```

### Code Analysis

Check for code quality issues:
```bash
flutter analyze
```

### Code Formatting

Format all Dart files:
```bash
dart format lib/ test/
```

## Known Issues & Limitations

### 🐛 Identified Bugs

1. **Notes TextField Key Issue** – The notes input field has a hardcoded test key (`notes_textfield`), which could conflict if the widget is tested programmatically. Consider removing this key unless it's specifically needed for testing.

2. **Missing Error Handling** – The app lacks error handling for edge cases:
   - No validation for very long notes (could overflow UI)
   - No handling for rapid button mashing on increment/decrement
   - No persistence mechanism (data is lost on app restart)

3. **Dropdown Initialization** – The `DropdownMenu` rebuilds the entries list on every build cycle via `_buildDropdownEntries()`. Consider making this a constant for performance.

4. **Hardcoded maxQuantity Parameter** – The `OrderScreen` hardcodes `maxQuantity: 5` in `main()` but accepts it as a parameter. This creates inconsistency. Should either remove the parameter or use it directly.

### ⚠️ Limitations

- **No data persistence** – Orders are not saved to local storage or a backend
- **Single order at a time** – The app manages one order; no order history or multiple simultaneous orders
- **No price calculation** – Quantities are tracked but no pricing information
- **Minimal platform support** – Designed for web/mobile; desktop clients untested

## Project Structure Conventions

- **State Management** – Uses simple `setState()` pattern; suitable for small apps. Consider Provider or Riverpod for larger projects.
- **Styling** – Centralized in `app_styles.dart` using TextStyle constants
- **Business Logic** – Separated in repository layer (`OrderRepository`)
- **Testing** – Unit tests for repository logic; widget tests available but minimal

## Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^2.0.0
```

Minimal dependencies ensure quick load times and easy maintenance. No external state management or HTTP packages are required.

## Contributing

Feel free to fork, modify, and submit improvements! This is an educational project designed to demonstrate Flutter fundamentals.

## License

This project is provided as-is for educational purposes.

## Contact & Support

- **GitHub:** [@AxisAlmond](https://github.com/AxisAlmond)
- **Issues:** Submit bugs or feature requests via [GitHub Issues](https://github.com/AxisAlmond/sandwich_shop/issues)
