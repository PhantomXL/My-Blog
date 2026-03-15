-- ENTITY RELATIONSHIP DIAGRAM (TEXTUAL)

-- users
-- id (PK)
-- username
-- password
-- role

-- posts
-- id (PK)
-- title
-- content
-- created_at
-- user_id (FK → users.id)

-- comments
-- id (PK)
-- post_id (FK → posts.id)
-- name
-- comment
-- created_at

-- RELATIONSHIPS
-- users 1 ──── * posts
-- posts 1 ──── * comments