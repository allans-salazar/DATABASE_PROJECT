-- This is SQL code that I used to test and create the database for the project.

CREATE TABLE users (
    user_id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    username VARCHAR2(50) NOT NULL,
    password VARCHAR2(100),
    role VARCHAR2(20) DEFAULT 'user'
);

ALTER TABLE users MODIFY password VARCHAR2(100) NOT NULL;
ALTER TABLE users MODIFY role VARCHAR2(20) DEFAULT 'customer';
ALTER TABLE users ADD CONSTRAINT unique_username UNIQUE (username);
ALTER TABLE users ADD CONSTRAINT unique_ssn UNIQUE (ssn);

ALTER TABLE users ADD ( 
    name VARCHAR2(50),
    last_name VARCHAR2(50),
    email VARCHAR2(100),
    ssn VARCHAR2(11)
);

INSERT INTO users (username, password, role) VALUES ('allanSal1', 'password', 'admin');

UPDATE users SET name = 'Allan', last_name = 'Salazar', email = 'allan@bank.com', ssn = '321-45-6789' WHERE username = 'allanSal1';

INSERT INTO users (username, password, role) VALUES ('anib4l', 'csci32', 'admin');

UPDATE users SET name = 'Anibal', last_name = 'Sanic', email = 'anibal@bank.com', ssn = '324-53-7532' WHERE username = 'anib4l';

INSERT INTO users (username, password, role) VALUES ('stev98n', 'pc123', 'admin');

UPDATE users SET name = 'Steven', last_name = 'Feal', email = 'steven@bank.com', ssn = '431-32-4902' WHERE username = 'stev98n';

INSERT INTO users (username, password) VALUES ('c98_Gomez', 'abc122');

UPDATE users SET name = 'Cris', last_name = 'Troy', email = 'cris_party@yahoo.com', ssn = '312-65-4356' WHERE username = 'c98_Gomez';

update users set role = 'customer' where username = 'c98_Gomez';

COMMIT;

update users set ssn = 321456789 where username = 'allanSal1';
update users set ssn = 324537532 where username = 'anib4l';
update users set ssn = 431324902 where username = 'stev98n';
update users set ssn = 312654356 where username = 'c98_Gomez';


CREATE TABLE customers (
    user_id NUMBER PRIMARY KEY,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    name VARCHAR2(50),
    last_name VARCHAR2(50),
    balance NUMBER DEFAULT 0
);

--code to insert users who are customers into the customers table
INSERT INTO customers (user_id, name, last_name, balance)
SELECT user_id, name, last_name, 0
FROM users
WHERE role = 'customer';

CREATE TABLE admins (
    user_id NUMBER PRIMARY KEY,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    name VARCHAR2(50),
    last_name VARCHAR2(50)
);

INSERT INTO admins (user_id, name, last_name)
SELECT user_id, name, last_name
FROM users
WHERE role = 'admin';

CREATE TABLE transactions (
    transaction_id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    user_id NUMBER,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    amount NUMBER,
    transaction_type VARCHAR2(20),
    transaction_date DATE DEFAULT SYSDATE
);

INSERT INTO users (username, password, role, name, last_name, email, ssn) VALUES 
('jWhite25', 'password123', 'customer', 'John', 'White', 'john.doe@gmail.com', '123456789');

INSERT INTO users (username, password, role, name, last_name, email, ssn) VALUES
('janeSmith2', 'securePass', 'customer', 'Jane', 'Smith', 'jane.smith@yahoo.com', '234567890');

INSERT INTO users (username, password, role, name, last_name, email, ssn) VALUES
('mikeBrown3', 'pass1234', 'customer', 'Mike', 'Brown', 'mike.brown@bing.com', '345678901');

INSERT INTO users (username, password, role, name, last_name, email, ssn) VALUES
('susanClark4', 'myPass567', 'customer', 'Susan', 'Clark', 'susan.clark@gmail.com', '456789012');

INSERT INTO users (username, password, role, name, last_name, email, ssn) VALUES
('emmaDavis5', 'emmaPass', 'customer', 'Emma', 'Davis', 'emma.davis@gmail.com', '567890123');

-- Insert these users into the customers table
INSERT INTO customers (user_id, name, last_name, balance)
SELECT user_id, name, last_name, 0
FROM users
WHERE username IN ('jWhite25', 'janeSmith2', 'mikeBrown3', 'susanClark4', 'emmaDavis5');


-- Insert some transactions for the users
INSERT INTO transactions (user_id, amount, transaction_type) VALUES (4, 50, 'grocery');
INSERT INTO transactions (user_id, amount, transaction_type) VALUES (4, 20, 'local-store');
INSERT INTO transactions (user_id, amount, transaction_type) VALUES (4, 100, 'online');
INSERT INTO transactions (user_id, amount, transaction_type) VALUES (83, 75, 'shoes');
INSERT INTO transactions (user_id, amount, transaction_type) VALUES (83, 30, 'clothes');
INSERT INTO transactions (user_id, amount, transaction_type) VALUES (83, 120, 'electronics');
INSERT INTO transactions (user_id, amount, transaction_type) VALUES (83, 40, 'restaurant');
INSERT INTO transactions (user_id, amount, transaction_type) VALUES (83, 60, 'entertainment');
INSERT INTO transactions (user_id, amount, transaction_type) VALUES (83, 90, 'travel');
INSERT INTO transactions (user_id, amount, transaction_type) VALUES (83, 25, 'dining');
INSERT INTO transactions (user_id, amount, transaction_type) VALUES (81, 35, 'shopping');
INSERT INTO transactions (user_id, amount, transaction_type) VALUES (81, 80, 'utilities');
INSERT INTO transactions (user_id, amount, transaction_type) VALUES (81, 15, 'gas');
INSERT INTO transactions (user_id, amount, transaction_type) VALUES (83, 45, 'books');
INSERT INTO transactions (user_id, amount, transaction_type) VALUES (84, 70, 'furniture');
INSERT INTO transactions (user_id, amount, transaction_type) VALUES (84, 55, 'electronics');
INSERT INTO transactions (user_id, amount, transaction_type) VALUES (41, 65, 'clothes');
INSERT INTO transactions (user_id, amount, transaction_type) VALUES (4, 85, 'toys');
INSERT INTO transactions (user_id, amount, transaction_type) VALUES (85, 10, 'sports');
INSERT INTO transactions (user_id, amount, transaction_type) VALUES (85, 25, 'home');
INSERT INTO transactions (user_id, amount, transaction_type) VALUES (85, 50, 'garden');
INSERT INTO transactions (user_id, amount, transaction_type) VALUES (85, 35, 'books');
INSERT INTO transactions (user_id, amount, transaction_type) VALUES (85, 60, 'electronics');
INSERT INTO transactions (user_id, amount, transaction_type) VALUES (85, 50, 'clothes');
INSERT INTO transactions (user_id, amount, transaction_type) VALUES (85, 90, 'furniture');
INSERT INTO transactions (user_id, amount, transaction_type) VALUES (82, 100, 'toys');
INSERT INTO transactions (user_id, amount, transaction_type) VALUES (82, 110, 'sports');
INSERT INTO transactions (user_id, amount, transaction_type) VALUES (82, 120, 'home');
INSERT INTO transactions (user_id, amount, transaction_type) VALUES (82, 130, 'garden');
INSERT INTO transactions (user_id, amount, transaction_type) VALUES (82, 140, 'books');



update customers set balance = 1000 where user_id = 4;
update customers set balance = 2000 where user_id = 41;
update customers set balance = 3000 where user_id = 84;
update customers set balance = 4000 where user_id = 83;
update customers set balance = 5000 where user_id = 85;
update customers set balance = 6000 where user_id = 81;
update customers set balance = 7000 where user_id = 82;

