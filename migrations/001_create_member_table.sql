CREATE TABLE member (
    member_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    login_id VARCHAR(50) NOT NULL UNIQUE,
    hashed_password VARCHAR(128) NOT NULL,
    public_id VARCHAR(50) NOT NULL UNIQUE,
    display_name VARCHAR(255),
    bio VARCHAR(255),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_login_id (login_id),
    INDEX idx_public_id (public_id)
);