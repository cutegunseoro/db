CREATE TABLE video (
    video_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    travel_id BIGINT NOT NULL,
    coordinates POINT NOT NULL,
    video_url VARCHAR(2083) NOT NULL,
    title VARCHAR(255),
    video_description VARCHAR(255),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_video_user_id FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE SET NULL,
    CONSTRAINT fk_video_travel_id FOREIGN KEY (travel_id) REFERENCES travel(travel_id) ON DELETE SET NULL,
    INDEX idx_user_id (user_id),
    INDEX idx_travel_id (travel_id),
    SPATIAL INDEX idx_coordinates (coordinates)
);