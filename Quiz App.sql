DROP DATABASE IF EXISTS Quiz;
CREATE DATABASE Quiz;
USE Quiz;

Create Table users (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(50) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

Create Table groups (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

Create Table questions (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    question VARCHAR(50) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    fk_groupId INT NOT NULL,
    fk_userId INT NOT NULL,
    FOREIGN KEY (fk_groupId) References groups(id),
    FOREIGN KEY (fk_userId) References users(id)
);

Create TABLE answers (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    answer VARCHAR(50) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    is_correct TINYINT(1) NOT NULL,
    fk_questionsId INT NOT NULL,
    FOREIGN KEY (fk_questionsId) References questions(id)
);

INSERT INTO users (email, password) VALUES 
("olivier.luethy@gmx.net", "123456"),
("michi@gmx.net", "123456");

INSERT INTO groups (name) VALUES
("SQL"),
("JavaScript"),
("PowerShell"),
("Kali Linux"),
("HTML"),
("CSS");

INSERT INTO questions (question, fk_groupId, fk_userId) VALUES
("Wofür steht HTML?", 5, 1),
("Was ist bei diesem HTML code falsch? </u> </u>", 5, 1),
("Wie kann man Variabeln in der Konsole ausgeben?", 2, 1);

INSERT INTO answers (answer, is_correct, fk_questionsId) VALUES
("Mit der print_f Funktion kann ich etwas ausgeben", 0, 3),
("Mittels Console.Log() kann ich eine beliebige Variable ausgeben", 1, 3),
("Kann man gar nicht", 0, 3),
("Mit der Output() Funktion kann ich Variablen ausgeben", 0, 3),

("Nichts ist falsch, alles ist korrekt", 0, 2),
("Sie haben einen Abstand dazwischen", 0, 2),
("Der erste Tag ist falsch, da er bereits zu geht", 1, 2),
("Diesen Tag existiert gar nicht", 0, 2);