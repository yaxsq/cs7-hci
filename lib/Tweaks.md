# KraveMart UI/UX Tweaks

This document lists the UI/UX tweaks needed to make the KraveMart app more unified, responsive, and polished.

## 1. Theme and Color Consistency

-   **`AppBar` and Background Colors:** Standardize the `AppBar` and background colors across all screens to match the app's dark theme. Pages like `ItemListingPage` and `CategoriesPage` currently use a default light theme `AppBar`.
-   **Consistent Colors:** Replace hardcoded colors with values from the `AppTheme` to ensure consistency.

## 2. ProductCard Enhancements

-   **Dynamic 'Add' Button:** The 'Add' button on the `ProductCard` should transform into a quantity selector (e.g., "- 1 +") when an item is added to the cart.
    -   Pressing '+' should increment the item quantity in the cart.
    -   Pressing '-' should decrement it.
    -   If the quantity becomes zero, the button should revert back to the 'Add' state.
-   **State Management:** The `ProductCard` needs to listen to the `CartModel` to reflect the correct quantity for each product.

## 3. Layout and Responsiveness

-   **Search Page Scaling:** Investigate and fix the layout scaling issues on the search results page to ensure product cards are displayed correctly on various screen sizes.
-   **Checkout Page Alignment:** Refine the spacing and alignment of the custom stepper on the `CheckoutPage` for a more polished look.

## 4. General UX Improvements

-   **Cart Item Count Badge:** Add a badge to the 'Cart' icon in the `CustomBottomNavBar` that displays the total number of unique items in the cart.
-   **Empty States:** Implement "empty state" UI for pages like the `CartPage` and search results to inform the user when there are no items to display.
-   **Haptic Feedback:** Add subtle haptic feedback for actions like adding an item to the cart or tapping buttons.
