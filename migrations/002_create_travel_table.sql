CREATE TABLE travel (
    travel_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    start_datetime DATETIME NOT NULL,
    end_datetime DATETIME NOT NULL,
    travel_description VARCHAR(255),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE SET NULL,
    CONSTRAINT chk_datetime_range CHECK (end_datetime >= start_datetime),
    INDEX idx_user_id (user_id),
    INDEX idx_datetime_range (start_datetime, end_datetime)
);