CREATE TABLE IF NOT EXISTS clients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL
);

INSERT INTO clients (nom) VALUES 
('Alice'),
('Bob'),
('Charlie');
