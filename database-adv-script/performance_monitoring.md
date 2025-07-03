
### Performance Refinement Report

**Query 1:**
- Before: Sequential scan on `bookings`, 512 ms
- After: Index scan using `idx_bookings_user_id`, 21 ms

**Query 2:**
- Before: Nested Loop with full scan on `bookings`, 789 ms
- After: Index scan using `idx_bookings_property_id`, 32 ms

**Changes Made:**
- Added indexes on `user_id`, `property_id`
- Added composite index on `user_id, booking_date`

**Conclusion:**
Execution time dropped by over 90% in both cases. Future performance monitoring scheduled monthly or after schema changes.

