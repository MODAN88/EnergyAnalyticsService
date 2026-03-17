-- MySQL Database Setup for Energy Analytics

-- Create database
CREATE DATABASE IF NOT EXISTS energy_analytics;
USE energy_analytics;

-- מבנה הטבלה לניתוח
CREATE TABLE device_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    device_id VARCHAR(50) NOT NULL,
    timestamp DATETIME NOT NULL,
    voltage DOUBLE,
    current DOUBLE,
    temperature DOUBLE,
    status VARCHAR(20)
);

-- Indexes for performance on large table (10 million records)
-- Index on device_id for grouping and filtering
CREATE INDEX idx_device_id ON device_logs (device_id);
-- Index on timestamp for date range queries
CREATE INDEX idx_timestamp ON device_logs (timestamp);
-- Composite index for device and timestamp for efficient 24-hour queries
CREATE INDEX idx_device_timestamp ON device_logs (device_id, timestamp);

-- Insert sample data (for testing)
INSERT INTO device_logs (device_id, timestamp, voltage, current, temperature, status) VALUES
('DEV001', '2023-01-01 10:00:00', 220.0, 5.0, 25.0, 'normal'),
('DEV001', '2023-01-01 10:05:00', 220.0, 5.2, 26.0, 'normal'),
('DEV001', '2023-01-01 10:10:00', 220.0, 10.0, 30.0, 'normal'), -- high current
('DEV001', '2023-01-02 10:00:00', 220.0, 6.0, 25.0, 'normal'), -- recent high
('DEV002', '2023-01-01 10:00:00', 220.0, 4.8, 24.0, 'normal'),
('DEV002', '2023-01-01 10:05:00', 220.0, 4.9, 25.0, 'normal'),
('DEV002', '2023-01-02 10:00:00', 220.0, 5.1, 26.0, 'normal');

-- Query to identify anomalous devices: average current in last 24 hours >= 20% higher than historical average
WITH historical_avg AS (
    SELECT
        device_id,
        AVG(current) AS hist_avg_current
    FROM device_logs
    GROUP BY device_id
),
recent_avg AS (
    SELECT
        device_id,
        AVG(current) AS recent_avg_current
    FROM device_logs
    WHERE timestamp >= DATE_SUB(NOW(), INTERVAL 24 HOUR)
    GROUP BY device_id
)
SELECT
    r.device_id,
    r.recent_avg_current,
    h.hist_avg_current,
    ((r.recent_avg_current - h.hist_avg_current) / h.hist_avg_current) * 100 AS percent_increase
FROM recent_avg r
JOIN historical_avg h ON r.device_id = h.device_id
WHERE r.recent_avg_current >= h.hist_avg_current * 1.2;