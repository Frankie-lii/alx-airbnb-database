tep 1: Rename the original table
ALTER TABLE bookings RENAME TO bookings_old;

-- Step 2: Create a new partitioned table
CREATE TABLE bookings (
	    id SERIAL PRIMARY KEY,
	    user_id INT NOT NULL,
	    property_id INT NOT NULL,
	    start_date DATE NOT NULL,
	    end_date DATE NOT NULL,
	    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- Step 3: Create partitions (monthly example)
CREATE TABLE bookings_2025_01 PARTITION OF bookings
    FOR VALUES FROM ('2025-01-01') TO ('2025-02-01');

	CREATE TABLE bookings_2025_02 PARTITION OF bookings
	    FOR VALUES FROM ('2025-02-01') TO ('2025-03-01');

		CREATE TABLE bookings_2025_03 PARTITION OF bookings
		    FOR VALUES FROM ('2025-03-01') TO ('2025-04-01');

			-- Step 4: (Optional) Migrate existing data
			INSERT INTO bookings (id, user_id, property_id, start_date, end_date, created_at)
			SELECT id, user_id, property_id, start_date, end_date, created_at
			FROM bookings_old;

			-- Step 5: Add indexes to partitions
CREATE INDEX idx_bookings_2025_01_user_id ON bookings_2025_01(user_id);
CREATE INDEX idx_bookings_2025_02_user_id ON bookings_2025_02(user_id);
CREATE INDEX idx_bookings_2025_03_user_id ON bookings_2025_03(user_id);

