# KraveMart - Grocery Delivery App

## Project Overview

KraveMart is a Flutter-based mobile application for a grocery delivery service. It provides a seamless user experience for browsing products, managing a shopping cart, and checking out.

The project is structured in a feature-based manner, with each feature having its own directory containing screens and widgets. The main features are:

*   **Landing:** The main screen of the app, displaying featured products and deals.
*   **Categories:** A screen to browse products by category.
*   **Item Listing:** A screen that displays the details of a single product.
*   **Search:** A screen to search for products.
*   **Cart:** A screen to manage the items in the shopping cart.
*   **Checkout:** A multi-step checkout process.
*   **Account:** A screen to manage user account information.
*   **Delivery Tracking:** A screen to track the delivery of an order.

The app uses the `provider` package for state management, specifically for the `CartModel`.

## Building and Running

To get started with the project, you will need to have the Flutter SDK installed.

1.  **Clone the repository:**
    ```bash
    git clone <repository-url>
    ```
2.  **Get dependencies:**
    ```bash
    flutter pub get
    ```
3.  **Run the app:**
    ```bash
    flutter run
    ```

### Testing

To run the tests, use the following command:
```bash
flutter test
```

## Development Conventions

*   **Project Structure:** The project follows a feature-based structure, with each feature in its own directory under `lib/src/features`.
*   **Widgets:** Reusable widgets are located in `lib/src/core/widgets`.
*   **Theme:** The app's theme is defined in `lib/src/core/theme/app_theme.dart`.
*   **Models:** Data models are located in `lib/src/features/models`.
*   **State Management:** The app uses the `provider` package for state management.
*   **Linting:** The project uses the `flutter_lints` package to enforce good coding practices. The linting rules are defined in `analysis_options.yaml`.
*   **Navigation:** The app uses a `ShellPage` with an `IndexedStack` to provide a seamless navigation experience with a persistent bottom navigation bar.
*   **Action Plan:** The project's action plan is located in `lib/action_plan.md`.

This `GEMINI.md` file provides a comprehensive overview of the project and its conventions, and can be used as instructional context for future interactions.
