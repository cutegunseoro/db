CREATE TABLE travel (
    travel_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    member_id BIGINT UNSIGNED,
    title VARCHAR(255),
    area VARCHAR(255),
    start_date_time DATETIME NOT NULL,
    end_date_time DATETIME NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT travel_fk_member_id FOREIGN KEY (member_id) REFERENCES member(member_id) ON DELETE SET NULL,
    CONSTRAINT travel_chk_date_time_range CHECK (end_date_time >= start_date_time),
    INDEX idx_member_id (member_id),
    INDEX idx_date_time_range (start_date_time, end_date_time),
    INDEX idx_end_date_time (end_date_time)
);