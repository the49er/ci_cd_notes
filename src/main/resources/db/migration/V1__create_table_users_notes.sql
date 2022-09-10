CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
SELECT uuid_generate_v4();
CREATE TABLE users
(
    id uuid DEFAULT uuid_generate_v4(),
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE notes
(
    id uuid DEFAULT uuid_generate_v4(),
    name_notes VARCHAR(100) NOT NULL UNIQUE,
    content VARCHAR(10000) NOT NULL,
    visibility VARCHAR(100) NOT NULL,
    users_id UUID,
    PRIMARY KEY (id),
    CONSTRAINT fk_users FOREIGN KEY (users_id) REFERENCES users (id)
);
