# KraveMart Flutter App Implementation Plan

This document outlines the strategy for developing the KraveMart Flutter application based on the provided Figma design. The focus is on speed, efficiency, and creating a scalable and maintainable codebase.

## 1. Project Structure

To ensure a clean and organized codebase, we will follow a feature-based folder structure. Each major feature will have its own directory containing all related files (widgets, screens, etc.).

```
lib/
├── src/
│   ├── core/
│   │   ├── theme/          # App theme and styling
│   │   └── widgets/        # Common reusable widgets (buttons, text fields, etc.)
│   ├── features/
│   │   ├── landing/
│   │   │   ├── screens/
│   │   │   └── widgets/
│   │   ├── categories/
│   │   │   ├── screens/
│   │   │   └── widgets/
│   │   ├── item_listing/
│   │   │   ├── screens/
│   │   │   └── widgets/
│   │   ├── search/
│   │   │   ├── screens/
│   │   │   └── widgets/
│   │   ├── cart/
│   │   │   ├── screens/
│   │   │   └── widgets/
│   │   ├── checkout/
│   │   │   ├── screens/
│   │   │   └── widgets/
│   │   └── account/
│   │       ├── screens/
│   │       └── widgets/
│   └── main.dart         # App entry point
└── action_plan.md
```

## 2. Implementation Strategy

We will implement the application screen by screen, prioritizing the creation of reusable components to accelerate development. For each component and screen, we will utilize `get_design_context` to extract precise design specifications and code suggestions from the Figma file.

### Step 1: Core Components & Theme

-   **Theme:** Define the application's color scheme, typography, and overall theme in `lib/src/core/theme/`. This will ensure a consistent look and feel across the app.
-   **Reusable Widgets:** Create a library of common widgets under `lib/src/core/widgets/`. Based on the Figma design, these will include:
    -   `CustomButton`: For all button variations (e.g., "Add", "Apply", "Proceed to Checkout"). We will use `get_design_context` on specific button instances to extract their properties (e.g., `63:49` for an "Add" button).
    -   `CustomTextField`: For the search bar and other input fields. We will use `get_design_context` on instances like `63:102` for the search bar to get its details.
    -   `ProductCard`: For displaying products in lists (e.g., on the landing and category pages). We will use `get_design_context` on instances like `63:45` to get its structure.
    -   `CategoryChip`: For the filter chips on the landing page. We will use `get_design_context` on instances like `63:14` to get its design.
    -   `BottomNavigationBar`: For the main navigation at the bottom (e.g., `137:11`).

### Step 2: Screen Implementation

We will develop the screens in the following order:

1.  **Landing Page (`63:127`):**
    -   Implement the main layout using a `CustomScrollView` or `ListView` for efficient scrolling.
    -   **Top Section (Delivery Address & Search):** Utilize `get_design_context` on `63:95` to implement the header including the "DELIVER TO" text, address, and the search bar (`63:102`).
    -   **Category Chips:** Implement the horizontally scrolling list of category chips (`63:13`) using `ListView.builder` and the `CategoryChip` widget.
    -   **Promotional Banner:** Implement the banner section (`63:38`).
    -   **"Weekly Deals" and "Fresh Produce" Sections:** Implement these sections (`63:44` and `63:71`) using `ListView.builder` for horizontal scrolling. Each item within these lists will be a `ProductCard` widget. We will use `get_design_context` on individual product cards (e.g., `63:45`) to get their details.
    -   **Bottom Navigation Bar:** Implement the `ButtomNav` (`137:11`).

2.  **Categories Page (`63:230`):**
    -   **Header with Back Button and Title:** Implement the top navigation bar.
    -   **Filter Options:** Implement the filter options at the top (e.g., "All", "Fruits", "Vegetables").
    -   **Product Grid:** Use a `GridView.builder` to display the products, reusing the `ProductCard` widget. We will use `get_design_context` on a listing item like `99:37` to get its layout.
    -   **Bottom Navigation Bar:** Reuse the `BottomNavigationBar` widget.

3.  **Item Listing Page (`63:270`):**
    -   **Image Carousel/Hero Image:** Display the product image prominently (`146:1149`).
    -   **Product Details:** Show product name (`146:1162`), price (`146:1163`), description (`146:1155`), and nutritional information (`146:1156`).
    -   **Quantity Selector:** Implement the quantity selector with increment/decrement buttons (`146:1170`).
    -   **"Add to Cart" Button:** Implement the call to action.
    -   **Top Navigation:** Implement the top navigation for this page (`103:69`).
    -   **Bottom Navigation Bar:** Reuse the `BottomNavigationBar` widget.

4.  **Search Page (`63:359`):**
    -   **Search Header:** Implement the header with the search input field (`63:336`).
    -   **Search Results:** Display search results using a `ListView.builder` where each result item will be similar to `63:314`. We will use `get_design_context` on this to extract its structure.
    -   **Filter and Sort Options:** Implement the filter (`63:349`) and sort (`63:354`) buttons.
    -   **"Show More" button:** Implement the pagination button (`148:1712`).
    -   **Bottom Navigation Bar:** Reuse the `BottomNavigationBar` widget.

5.  **Cart Page (`63:517`):**
    -   **Cart Header:** Implement the top section showing "My Cart" and delivery information (`63:509`, `63:465`).
    -   **Cart Items:** List the items in the cart using a `ListView.builder`, with each item potentially being a custom widget representing `63:469`.
    -   **Quantity Adjustment:** Allow users to modify the quantity of each item or remove it.
    -   **Order Summary:** Display the subtotal, delivery fee, and total (`63:499`).
    -   **"Proceed to Checkout" Button:** Implement the main call to action (`63:514`).
    -   **"Continue Shopping" Link:** Implement the navigation link (`63:516`).
    -   **Bottom Navigation Bar:** Reuse the `BottomNavigationBar` widget.

6.  **Checkout Flow (`152:476`, `148:3488`, `148:3593`):**
    -   **Multi-step Indicator:** Implement a `Stepper` widget or similar for "Address", "Payment", and "Review" steps (`152:457`).
    -   **Address Selection:** Reuse components for displaying and adding addresses (e.g., `152:433`).
    -   **Payment Method:** Reuse components for selecting payment methods (e.g., `148:3723`).
    -   **Order Summary:** Display the order summary similar to the cart page.
    -   **Action Buttons:** Implement "Proceed to Payment", "Proceed to Review", "Complete Order", and "Cancel Order" buttons.

7.  **Account Details Page (`148:1427`):**
    -   **Profile Header:** Display user's avatar, name, and edit button (`148:1595`, `148:1657`).
    -   **Information Sections:** Display "Delivery Address", "Email", and "Phone Number" sections (`148:1671`, `148:1678`, `148:1693`). Each section will have a "Change" button.
    -   **Bottom Navigation Bar:** Reuse the `BottomNavigationBar` widget.

8.  **Voucher List Page (`63:405`):**
    -   **Promo Code Input:** Implement the "Have a promo code?" section with an input field and "Apply" button (`63:363`).
    -   **Voucher Applied Message:** Display a success message when a voucher is applied (`63:373`).
    -   **Available Vouchers:** List available vouchers (`63:377`) with their details and "Apply" buttons.
    -   **Header:** Implement the header for this page (`112:32`).

## 3. State Management

For managing the application's state (e.g., the contents of the shopping cart, user authentication), we will use a simple and efficient state management solution like `Provider` or `Riverpod`. This will allow for a clear separation of concerns and make the app easier to test and maintain.

## 4. Development Workflow

-   **Iterative Development:** We will build the app screen by screen, focusing on one feature at a time.
-   **Hot Reload:** We will make extensive use of Flutter's hot reload feature to quickly iterate on the UI and see changes in real-time.
-   **Component-First:** We will prioritize the creation of reusable widgets to speed up the development of new screens.
-   **`get_design_context` for Components:** For each individual component (e.g., a button, a product card, a text field), we will use `get_design_context` with its specific `nodeId` to retrieve detailed design information and potential code snippets. This will ensure pixel-perfect implementation and adherence to the Figma design.
-   **Testing:** We will write unit and widget tests for our core components and business logic to ensure the app is robust and reliable.

This refined plan provides a clear roadmap for developing the KraveMart app efficiently, leveraging `get_design_context` for precise component implementation.

## 5. Accessibility Features

To enhance the application's usability for all users, we will implement a set of accessibility features. This will involve creating a new screen at the beginning of the app to allow users to select their preferred accessibility settings.

### Step 1: Accessibility Options Screen

-   **Create a new screen:** This screen will be displayed when the app is first launched. It will be modeled after the `VoucherList` screen (`63:405`) for design consistency.
-   **Options:** The screen will present the following options:
    -   **Larger Font:** A toggle or button to increase the font size across the application.
    -   **Light Mode with High Contrast:** A toggle or button to switch to a new high-contrast theme.
    -   **Voice Assisted / Narrated Mode:** A toggle or button to enable voice assistance (initially, this will not change the UI).
-   **"Continue" Button:** A button to apply the selected settings and proceed to the main application.

### Step 2: State Management for Accessibility

-   **Accessibility Provider:** Create a new `ChangeNotifier` provider (`AccessibilityProvider`) to manage the state of the accessibility options. This provider will store the user's choices (e.g., `isLargeFont`, `isHighContrast`, `isNarratorMode`).
-   **Persistent Storage:** Use a package like `shared_preferences` to save the user's accessibility settings, so they don't have to set them every time they open the app.

### Step 3: Implementing the Accessibility Features

-   **Larger Font:**
    -   Modify the `AppTheme` in `lib/src/core/theme/app_theme.dart` to define a separate `TextTheme` with larger font sizes.
    -   Conditionally apply the larger font `TextTheme` based on the `isLargeFont` value from the `AccessibilityProvider`.
-   **Light Mode with High Contrast:**
    -   Define a new `ColorScheme` in `lib/src/core/theme/app_theme.dart` with high-contrast colors.
    -   Create a new `ThemeData` object for the high-contrast theme.
    -   Conditionally apply the high-contrast theme based on the `isHighContrast` value from the `AccessibilityProvider`.
-   **Voice Assisted / Narrated Mode:**
    -   For now, this option will only update the `isNarratorMode` value in the `AccessibilityProvider`. No UI changes will be implemented at this stage.

### Step 4: App Entry Point Modification

-   **Modify `main.dart`:** Update the app's entry point to show the new accessibility options screen first. After the user makes their selection and taps "Continue," the app will navigate to the main landing page.
-   **Theme and Font Application:** The root `MaterialApp` widget will listen to the `AccessibilityProvider` to apply the selected theme and font size dynamically.
