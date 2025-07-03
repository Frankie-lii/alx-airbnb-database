ndexes for users table
CREATE INDEX idx_users_id ON users(id);
CREATE INDEX idx_users_name ON users(name);

-- Indexes for bookings table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_booking_date ON bookings(booking_date);

-- Indexes for properties table
CREATE INDEX idx_properties_id ON properties(id);
CREATE INDEX idx_properties_name ON properties(name);

