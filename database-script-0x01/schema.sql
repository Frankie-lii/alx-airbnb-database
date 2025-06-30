ERS TABLE
CREATE TABLE Users (
	    user_id SERIAL PRIMARY KEY,
	    name VARCHAR(100) NOT NULL,
	    email VARCHAR(100) UNIQUE NOT NULL,
	    password VARCHAR(255) NOT NULL,
	    phone_number VARCHAR(20),
	    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- LOCATIONS TABLE (for 3NF normalization of property location)
CREATE TABLE Locations (
	    location_id SERIAL PRIMARY KEY,
	    city VARCHAR(100),
	    state VARCHAR(100),
	    country VARCHAR(100)
);

-- PROPERTIES TABLE
CREATE TABLE Properties (
	    property_id SERIAL PRIMARY KEY,
	    owner_id INTEGER NOT NULL,
	    title VARCHAR(200) NOT NULL,
	    description TEXT,
	    location_id INTEGER,
	    price_per_night DECIMAL(10, 2) NOT NULL,
	    property_type VARCHAR(50),
	    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	    FOREIGN KEY (owner_id) REFERENCES Users(user_id) ON DELETE CASCADE,
	    FOREIGN KEY (location_id) REFERENCES Locations(location_id)
);

-- BOOKINGS TABLE
CREATE TABLE Bookings (
	    booking_id SERIAL PRIMARY KEY,
	    user_id INTEGER NOT NULL,
	    property_id INTEGER NOT NULL,
	    start_date DATE NOT NULL,
	    end_date DATE NOT NULL,
	    total_price DECIMAL(10, 2) NOT NULL,
	    status VARCHAR(50) DEFAULT 'confirmed',
	    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
	    FOREIGN KEY (property_id) REFERENCES Properties(property_id) ON DELETE CASCADE
);

-- PAYMENTS TABLE
CREATE TABLE Payments (
	    payment_id SERIAL PRIMARY KEY,
	    booking_id INTEGER NOT NULL UNIQUE,
	    amount DECIMAL(10, 2) NOT NULL,
	    payment_method VARCHAR(50),
	    payment_status VARCHAR(50),
	    paid_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id) ON DELETE CASCADE
);

-- REVIEWS TABLE
CREATE TABLE Reviews (
	    review_id SERIAL PRIMARY KEY,
	    user_id INTEGER NOT NULL,
	    property_id INTEGER NOT NULL,
	    rating INTEGER CHECK (rating >= 1 AND rating <= 5),
	    comment TEXT,
	    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
	    FOREIGN KEY (property_id) REFERENCES Properties(property_id) ON DELETE CASCADE
);

-- OPTIONAL: PROPERTY_AMENITIES TABLE (for 1NF compliance if amenities exist)
CREATE TABLE Amenities (
	    amenity_id SERIAL PRIMARY KEY,
	    name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE PropertyAmenities (
	    property_id INTEGER NOT NULL,
	    amenity_id INTEGER NOT NULL,
	    PRIMARY KEY (property_id, amenity_id),
	    FOREIGN KEY (property_id) REFERENCES Properties(property_id) ON DELETE CASCADE,
	    FOREIGN KEY (amenity_id) REFERENCES Amenities(amenity_id) ON DELETE CASCADE
);

