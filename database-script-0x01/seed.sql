-- USERS
INSERT INTO Users (name, email, password, phone_number)
VALUES
('Alice Johnson', 'alice@example.com', 'hashed_password_1', '+254712345678'),
('Bob Smith', 'bob@example.com', 'hashed_password_2', '+254798765432'),
('Carol Otieno', 'carol@example.com', 'hashed_password_3', '+254701234567');

-- LOCATIONS
INSERT INTO Locations (city, state, country)
VALUES
('Nairobi', 'Nairobi County', 'Kenya'),
('Mombasa', 'Mombasa County', 'Kenya'),
('Kisumu', 'Kisumu County', 'Kenya');

-- PROPERTIES
INSERT INTO Properties (owner_id, title, description, location_id, price_per_night, property_type)
VALUES
(1, 'Modern Apartment in Nairobi', '2-bedroom apartment in Westlands', 1, 4500.00, 'Apartment'),
(2, 'Beach House in Mombasa', 'A beautiful beachfront property', 2, 8000.00, 'House'),
(1, 'Budget Room in Kisumu', 'Private room near town center', 3, 2000.00, 'Room');

-- BOOKINGS
INSERT INTO Bookings (user_id, property_id, start_date, end_date, total_price, status)
VALUES
(2, 1, '2025-07-01', '2025-07-05', 18000.00, 'confirmed'),
(3, 2, '2025-08-10', '2025-08-15', 40000.00, 'confirmed'),
(2, 3, '2025-09-01', '2025-09-02', 2000.00, 'cancelled');

-- PAYMENTS
INSERT INTO Payments (booking_id, amount, payment_method, payment_status)
VALUES
(1, 18000.00, 'Mpesa', 'paid'),
(2, 40000.00, 'Credit Card', 'paid');

-- REVIEWS
INSERT INTO Reviews (user_id, property_id, rating, comment)
VALUES
(2, 1, 5, 'Great stay, host was friendly!'),
(3, 2, 4, 'Nice location and very clean.'),
(2, 3, 3, 'Room was okay, good for short stays.');

-- AMENITIES (Optional)
INSERT INTO Amenities (name)
VALUES
('WiFi'), ('Parking'), ('Swimming Pool'), ('Air Conditioning'), ('Breakfast');

-- PROPERTY_AMENITIES (Optional)
INSERT INTO PropertyAmenities (property_id, amenity_id)
VALUES
(1, 1), (1, 2), (1, 4), -- Modern Apartment
(2, 1), (2, 2), (2, 3), (2, 4), (2, 5), -- Beach House
(3, 1); -- Budget Room

