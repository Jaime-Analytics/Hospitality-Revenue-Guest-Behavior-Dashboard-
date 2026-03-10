/* ============================================================
   HOTEL BOOKINGS — DATA CLEANING & VALIDATION SCRIPT
   Author: Jaime Echegaray
   Purpose: Validate and clean raw booking data before modeling
   ============================================================ */

/* 1. Detect invalid ADR values (negative or extremely high) */
SELECT *
FROM bookings
WHERE adr < 0
   OR adr > 1000;


/* 2. Detect stays with zero nights (invalid records) */
SELECT *
FROM bookings
WHERE (stays_in_week_nights + stays_in_weekend_nights) = 0;


/* 3. Identify missing or null critical fields */
SELECT *
FROM bookings
WHERE arrival_date IS NULL
   OR hotel IS NULL
   OR market_segment IS NULL
   OR distribution_channel IS NULL;


/* 4. Standardize text fields (trim spaces, fix casing) */
UPDATE bookings
SET market_segment = TRIM(LOWER(market_segment)),
    distribution_channel = TRIM(LOWER(distribution_channel)),
    customer_type = TRIM(LOWER(customer_type));


/* 5. Validate date ranges (arrival must be before departure) */
SELECT *
FROM bookings
WHERE arrival_date > departure_date;


/* 6. Validate cancellation logic */
SELECT *
FROM bookings
WHERE is_canceled = 1 AND (stays_in_week_nights + stays_in_weekend_nights) > 0;


/* 7. Detect duplicate booking IDs */
SELECT booking_id, COUNT(*) AS occurrences
FROM bookings
GROUP BY booking_id
HAVING COUNT(*) > 1;


/* 8. Create a clean view for Power BI import */
CREATE VIEW vw_clean_bookings AS
SELECT
    booking_id,
    hotel,
    arrival_date,
    departure_date,
    stays_in_week_nights + stays_in_weekend_nights AS total_nights,
    adr,
    adults,
    children,
    babies,
    market_segment,
    distribution_channel,
    customer_type,
    is_canceled,
    lead_time
FROM bookings
WHERE adr >= 0
  AND (stays_in_week_nights + stays_in_weekend_nights) > 0
  AND arrival_date <= departure_date;
