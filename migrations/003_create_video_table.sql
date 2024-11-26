CREATE TABLE video (
    video_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    member_id BIGINT UNSIGNED,
    travel_id BIGINT UNSIGNED,
    coordinates POINT NOT NULL SRID 4326,
    video_s3_key VARCHAR(255),
    video_content_type VARCHAR(255),
    thumbnail_s3_url VARCHAR(255),
    title VARCHAR(255),
    description VARCHAR(255),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT video_fk_member_id FOREIGN KEY (member_id) REFERENCES member(member_id) ON DELETE SET NULL,
    CONSTRAINT video_fk_travel_id FOREIGN KEY (travel_id) REFERENCES travel(travel_id) ON DELETE SET NULL,
    INDEX idx_member_id (member_id),
    INDEX idx_travel_id (travel_id),
    SPATIAL INDEX idx_coordinates (coordinates)
);