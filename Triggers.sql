CREATE DATABASE triggers_tarea;

USE triggers_tarea;

CREATE TABLE Empleados (
    EmpID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100),
    Departamento VARCHAR(50),
    Salario DECIMAL(10, 2)
);

CREATE TABLE Auditoria (
    AudID INT PRIMARY KEY AUTO_INCREMENT,
    Accion ENUM('INSERT', 'UPDATE', 'DELETE'),
    EmpID INT,
    Nombre VARCHAR(100),
    Departamento VARCHAR(50),
    Salario DECIMAL(10, 2),
    Fecha DATE
);

-- TRIGGER PARA EL EVENTO INSERT

DELIMITER $$

CREATE TRIGGER Auditoria_Empleados_Insertar
AFTER INSERT ON Empleados
FOR EACH ROW
BEGIN
    INSERT INTO Auditoria (Accion, EmpID, Nombre, Departamento, Salario, Fecha)
    VALUES ('INSERT', NEW.EmpID, NEW.Nombre, NEW.Departamento, NEW.Salario, NOW());
END $$

DELIMITER ;

-- TRIGGER PARA EL EVENTO UPDATE

DELIMITER $$

CREATE TRIGGER Auditoria_Empleados_Actualizar
AFTER UPDATE ON Empleados
FOR EACH ROW
BEGIN
    INSERT INTO Auditoria (Accion, EmpID, Nombre, Departamento, Salario, Fecha)
    VALUES ('UPDATE', NEW.EmpID, NEW.Nombre, NEW.Departamento, NEW.Salario, NOW());
END $$

DELIMITER ;

-- TRIGGER PARA EL EVENTO DELETE

DELIMITER $$

CREATE TRIGGER Auditoria_Empleados_Eliminar
AFTER DELETE ON Empleados
FOR EACH ROW
BEGIN
    INSERT INTO Auditoria (Accion, EmpID, Nombre, Departamento, Salario, Fecha)
    VALUES ('DELETE', OLD.EmpID, OLD.Nombre, OLD.Departamento, OLD.Salario, NOW());
END $$

DELIMITER ;

-- USO DE LOS TRIGGERS

INSERT INTO Empleados(Nombre, Departamento, Salario)
VALUES ("Pedro Pérez", "Ventas", 3000.00),
("Jose García", "Compras", 3500.00),
("Luis Gonzáles", "Negocios", 5000.00);


UPDATE Empleados SET Salario = 4500.00 WHERE EmpID = 1;
UPDATE Empleados SET Salario = 4000.00 WHERE EmpID = 2;
UPDATE Empleados SET Salario = 3000.00 WHERE EmpID = 3;

DELETE FROM Empleados WHERE EmpID = 1;
DELETE FROM Empleados WHERE EmpID = 2;
DELETE FROM Empleados WHERE EmpId = 3;

-- COMPROBACIÓN DE TRIGGERS

SELECT * FROM Auditoria;


