USE RATING;
DROP TABLE IF EXISTS ORDERS;
DROP TABLE IF EXISTS USERS;

CREATE TABLE USERS (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(256) NOT NULL,
    category ENUM ('CLIENT', 'RESTAURANT', 'DELIVERER', 'ADMIN') NOT NULL
) ENGINE=INNODB;

INSERT INTO USERS (name, password, category)
VALUES ('name1', '$2b$10$9.sY6LVjcIS4sVJXF.q46eDRLrLkqyPjioHbWnpUmMdwqlf6zCjj.', 'CLIENT'),
       ('name2', '$2b$10$WXMbJJCwIjjIILfMSgtlHOzL7nmVoJwtEp1qWTMBp9XTzGaJHBOz2', 'ADMIN'),
       ('name3', '$2b$10$YmmzyYLtLT3QC5fm9I/sXOJegc4g7CxtsFNJlJ.1BnmRh0ZFENet2', 'DELIVERER'),
       ('name4', '$2b$10$LF3BeVmhp8E2OCvwARSZMuJNNUq7cEpVVHEj87sLEdJk0uuAiD1CK', 'RESTAURANT'),
       ('name5', '$2b$10$XqFqTmHmimmtHqHVPd6bNOWRreBc8E/SFAUWbqEoAKAHHYeD5WLjW', 'CLIENT');

CREATE TABLE ORDERS (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    clientId INT NOT NULL,
    restaurantId INT NOT NULL,
    delivererId INT NOT NULL,
    orderTime DATETIME NOT NULL,
    totalPrice DECIMAL(10,2) NOT NULL,
    rateCR INT DEFAULT NULL,
    rateCD INT DEFAULT NULL,
    rateDR INT DEFAULT NULL,
    rateDC INT DEFAULT NULL,
    rateRC INT DEFAULT NULL,
    rateRD INT DEFAULT NULL,
    -- dishes VARBINARY(256) NOT NULL,
    FOREIGN KEY (clientId) REFERENCES USERS(id)
    -- FOREIGN KEY (restaurantId) REFERENCES USERS(id)
    -- FOREIGN KEY (delivererId) REFERENCES USERS(id)
) ENGINE=INNODB;

INSERT INTO ORDERS (clientId, restaurantId, delivererId, orderTime, totalPrice)
VALUES ('1', '4', '3', '2018-02-03 18:56:29', 28.16),
       ('1', '4', '3', '2018-03-22 17:32:49', 35.14),
       ('5', '4', '3', '2018-04-02 12:28:13', 16.77),
       ('5', '4', '3', '2018-04-18 18:23:53', 35.19);