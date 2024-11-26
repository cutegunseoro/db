CREATE TABLE push_subscription (
    push_subscription_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    member_id BIGINT UNSIGNED NOT NULL,
    token VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    last_used_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- for future invalidation logic
    CONSTRAINT push_subscription_fk_member_id FOREIGN KEY (member_id) REFERENCES member(member_id) ON DELETE CASCADE
);