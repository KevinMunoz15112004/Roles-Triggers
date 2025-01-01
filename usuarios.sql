-- Super Administrador: Crear y eliminar bases de datos.
CREATE USER 'superadministrador'@'localhost' IDENTIFIED BY 'superadmin123';
GRANT CREATE, DROP ON *.* TO 'superadministrador'@'localhost' WITH GRANT OPTION;

-- Administrador: Crear usuarios y procesos
CREATE USER 'admin_usuario'@'localhost' IDENTIFIED BY 'admin123';
GRANT CREATE USER, PROCESS ON *.* TO 'admin_usuario'@'localhost';

-- CRUD: Insertar, actualizar y eliminar datos.
CREATE USER 'crud_usuario'@'localhost' IDENTIFIED BY 'crud123';
GRANT SELECT, INSERT, DELETE, UPDATE ON *.* TO 'crud_usuario'@'localhost';

-- CRU: Insertar y actualizar, pero sin eliminar.
CREATE USER 'cru_usuario'@'localhost' IDENTIFIED BY 'cru123';
GRANT INSERT, UPDATE ON *.* TO 'cru_usuario'@'localhost';

-- Solo Lectura: Realizar consultas a las tablas.
CREATE USER 'lectura_usuario'@'localhost' IDENTIFIED BY 'lectura123';
GRANT SELECT ON *.* TO 'lectura_usuario'@'localhost';

FLUSH PRIVILEGES;

-- Verificación de permisos 
SHOW GRANTS FOR 'superadministrador'@'localhost';
SHOW GRANTS FOR 'admin_usuario'@'localhost';
SHOW GRANTS FOR 'crud_usuario'@'localhost';
SHOW GRANTS FOR 'cru_usuario'@'localhost';
SHOW GRANTS FOR 'lectura_usuario'@'localhost';

