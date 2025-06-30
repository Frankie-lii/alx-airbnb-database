# Database Normalization – Airbnb Clone

## Objective
Ensure the database schema adheres to Third Normal Form (3NF) to reduce redundancy and improve data integrity.

---

## Normalization Steps

### 1. First Normal Form (1NF)
- Ensured atomicity: no repeating groups or arrays within columns.
- Example: Avoided storing multiple amenities in a single column. Instead, we use a separate `PropertyAmenities` join table.

### 2. Second Normal Form (2NF)
- All tables use single-column primary keys.
- Verified that non-key columns fully depend on the entire primary key.

### 3. Third Normal Form (3NF)
- Removed transitive dependencies:
  - Extracted `location` data into a new `Location` table.
  - Proposed separation of complex `payment_method` fields into a `PaymentMethod` table (optional).
- Ensured all non-key attributes depend only on the primary key.

---

## Final Notes
By applying normalization:
- The schema is now cleaner, avoids duplication, and is easier to maintain.
- Future updates (e.g., city name changes) can be made in one place.

This design ensures data consistency and scalability.

