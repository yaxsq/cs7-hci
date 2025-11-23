# KraveMart - Grocery Delivery App

KraveMart is a Flutter-based mobile application for a grocery delivery service. It provides a seamless user experience for browsing products, managing a shopping cart, and checking out.

## Implemented Features

*   **Home Page:** Displays weekly deals and fresh produce with interactive product cards.
*   **Categories Page:** Allows users to browse products by category in a grid view.
*   **Product Details Page:** A redesigned page showing detailed product information, including a quantity selector.
*   **Search Page:** A dedicated page for searching products with a functional search bar and results display.
*   **Shopping Cart:** Allows users to add, remove, and update the quantity of items in their cart.
*   **Checkout Flow:** A custom-styled, multi-step process for a smooth checkout experience (Address, Payment, Review).
*   **Order History & Tracking:** The app now supports creating orders and saving them to an order history model. A placeholder page for delivery tracking is also included.
*   **Core Navigation:** A robust navigation system using `go_router` with a persistent bottom navigation bar.

## Getting Started

This project is a starting point for a Flutter application.

To get started, you will need to have the Flutter SDK installed. For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

To run the application, use the following command:

```bash
flutter run
```

## Roadmap and Next Steps

The application has a solid foundation, but there are several UI/UX tweaks and features to implement to make it feel like a complete and polished product. The next steps are focused on these enhancements. A detailed list of these can be found in `lib/Tweaks.md`.

### Immediate Next Steps

1.  **UI/UX Polish:**
    -   **Search Page Scaling:** Investigate and fix layout scaling issues on the search results page.
    -   **Checkout Page Alignment:** Refine the spacing and alignment of the custom stepper on the `CheckoutPage`.
    -   **Cart Item Count Badge:** Add a badge to the 'Cart' icon in the `CustomBottomNavBar` to show the number of items in the cart.
2.  **Complete Placeholder Screens:**
    -   Implement the UI for the `AccountPage`, including a section to display the `OrderHistoryModel`.
3.  **Enhance Features:**
    -   Implement "empty state" UI for the `CartPage` and search results.
    -   Add haptic feedback for user interactions.

### Future Goals

*   **Backend Integration:** Connect the app to a real backend service for product data, user authentication, and order processing.
*   **Comprehensive Testing:** Write unit, widget, and integration tests to ensure the app is robust and reliable.