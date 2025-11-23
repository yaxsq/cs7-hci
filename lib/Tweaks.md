# KraveMart UI/UX Tweaks

This document lists the UI/UX tweaks needed to make the KraveMart app more unified, responsive, and polished.

## 1. Theme and Color Consistency

-   **Consistent Colors:** Replace hardcoded colors with values from the `AppTheme` to ensure consistency.

## 2. Layout and Responsiveness

-   **Search Page Scaling:** Investigate and fix the layout scaling issues on the search results page to ensure product cards are displayed correctly on various screen sizes.
-   **Checkout Page Alignment:** Refine the spacing and alignment of the custom stepper on the `CheckoutPage` for a more polished look.

## 3. Feature Enhancements

-   **Address Selection:** Make the "DELIVER TO" section on the `LandingPage` interactive, allowing users to select or add a delivery address.

## 4. General UX Improvements

-   **Cart Item Count Badge:** Add a badge to the 'Cart' icon in the `CustomBottomNavBar` that displays the total number of unique items in the cart.
-   **Empty States:** Implement "empty state" UI for pages like the `CartPage` and search results to inform the user when there are no items to display.
-   **Haptic Feedback:** Add subtle haptic feedback for actions like adding an item to the cart or tapping buttons.