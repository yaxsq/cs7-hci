# KraveMart Flutter App: Phase 3 Action Plan - Reactive Analytics

## Phase 3: Reactive Analytics for Performance Optimization

This phase focuses on implementing a client-side analytics system to gather data on user interactions. This data will be used to identify optimization opportunities and understand user behavior. The system will be designed to be "reactive," collecting data without impacting the user experience.

### 1. Backend Setup (Supabase)

-   **Objective:** Prepare the backend to receive and store analytics events.
-   **Tasks:**
    1.  Set up a new project on Supabase.
    2.  Create a new table named `analytics_events` with the following columns:
        -   `id` (UUID, primary key)
        -   `event_name` (text, not null)
        -   `event_parameters` (jsonb)
        -   `device_id` (text)
        -   `session_id` (text)
        -   `timestamp` (timestamp with time zone, not null)
    3.  Enable Row Level Security (RLS) on the table and create a policy that allows anonymous inserts.
    4.  Document the Supabase project URL and anon key in a secure and accessible manner for the development team (e.g., environment variables, a configuration file that is git-ignored).

### 2. Project Dependencies

-   **Objective:** Add the necessary packages to the Flutter project.
-   **Tasks:**
    1.  Add the following dependencies to `pubspec.yaml`:
        -   `supabase_flutter`: For communication with the Supabase backend.
        -   `workmanager`: For scheduling and running background tasks to send analytics data.
        -   `sqflite`: For creating a local SQLite database to queue events.
        -   `path_provider`: To find the correct local path for the database.
        -   `uuid`: To generate unique IDs for devices, sessions, and events.

### 3. Analytics Service Implementation

-   **Objective:** Create a centralized service for logging and managing analytics events.
-   **Tasks:**
    1.  Create a new directory `lib/src/core/analytics`.
    2.  **`analytics_service.dart`:**
        -   Create a singleton class `AnalyticsService`.
        -   Initialize Supabase client.
        -   Generate and store a unique `device_id` on the first run.
        -   Generate a unique `session_id` for each app session.
        -   Implement a public method `logEvent(String eventName, Map<String, dynamic> parameters)`.
    3.  **`event_model.dart`:**
        -   Define a `AnalyticsEvent` data class with fields matching the Supabase table structure.
        -   Include `toJson()` and `fromJson()` methods for serialization.

### 4. Local Persistence (Event Queue)

-   **Objective:** Persist analytics events locally before sending them to the backend to prevent data loss.
-   **Tasks:**
    1.  **`database_service.dart`:**
        -   Create a service to manage the local SQLite database.
        -   Implement methods to:
            -   Initialize the database and create the `events` table.
            -   `addEvent(AnalyticsEvent event)`: Insert a new event into the queue.
            -   `getEvents(int batchSize)`: Retrieve a batch of events from the queue.
            -   `deleteEvents(List<String> eventIds)`: Delete events that have been successfully sent.
    2.  Integrate `DatabaseService` into `AnalyticsService` to store events when `logEvent` is called.

### 5. Background Syncing

-   **Objective:** Reliably send queued events to Supabase in the background.
-   **Tasks:**
    1.  **`background_sync.dart`:**
        -   Configure `workmanager` to run a periodic background task (e.g., every 15 minutes).
        -   The task will:
            -   Fetch a batch of events from the local SQLite database.
            -   Attempt to send the batch to the Supabase `analytics_events` table.
            -   If the upload is successful, delete the sent events from the local queue.
            -   Implement retry logic for failed uploads (WorkManager handles this to some extent).
    2.  Initialize and register the background task in `main.dart`.

### 6. Instrumentation (Event Tracking)

-   **Objective:** Integrate the `AnalyticsService` into the application to track key user interactions.
-   **Tasks:**
    1.  Identify critical events to track throughout the user journey.
    2.  Call `AnalyticsService.instance.logEvent()` at the following points:
        -   **App Lifecycle:** `app_start`, `app_resume`, `app_pause`.
        -   **Screen Views:** `view_screen` event with a `screen_name` parameter for every major screen (`Landing`, `Categories`, `ItemListing`, `Search`, `Cart`, `Checkout`, etc.). This can be done using a route observer.
        -   **User Actions:**
            -   `add_to_cart` (with `item_id`, `item_name`, `quantity`, `price`).
            -   `remove_from_cart` (with `item_id`).
            -   `update_cart_quantity` (with `item_id`, `new_quantity`).
            -   `begin_checkout`.
            -   `complete_purchase` (with `total_amount`, `items_count`).
            -   `search` (with `search_term`).
            -   `select_category` (with `category_name`).
            -   `apply_promo_code` (with `promo_code`).
        -   **Accessibility:**
            -   `toggle_large_font` (with `enabled: true/false`).
            -   `toggle_high_contrast` (with `enabled: true/false`).
            -   `toggle_voice_narrator` (with `enabled: true/false`).
            -   `switch_language` (with `language: 'en'/'ur'`).

### 7. Testing and Validation

-   **Objective:** Ensure the analytics pipeline is working correctly from end to end.
-   **Tasks:**
    1.  **Local Testing:**
        -   Add logging to verify that events are being correctly written to the local SQLite database.
        -   Use `flutter test` to write unit tests for the `AnalyticsService` and `DatabaseService`.
    2.  **Background Task Testing:**
        -   Manually trigger the background task to test the upload mechanism.
        -   Simulate network failure to ensure events are retried and not lost.
    3.  **End-to-End Validation:**
        -   Perform actions in the app.
        -   Verify that the corresponding events appear in the Supabase `analytics_events` table with the correct data.

This plan provides a structured approach to building a robust and non-intrusive analytics system, which will be crucial for the data-driven optimization of KraveMart.
