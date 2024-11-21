CREATE TABLE travel (
    travel_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    member_id BIGINT UNSIGNED,
    start_datetime DATETIME NOT NULL,
    end_datetime DATETIME NOT NULL,
    description VARCHAR(255),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_member_id FOREIGN KEY (member_id) REFERENCES member(member_id) ON DELETE SET NULL,
    CONSTRAINT chk_datetime_range CHECK (end_datetime >= start_datetime),
    INDEX idx_member_id (member_id),
    INDEX idx_datetime_range (start_datetime, end_datetime)
);