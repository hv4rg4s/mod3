-- create database 
CREATE DATABASE tarea;
-- create schema 
CREATE SCHEMA mod3;
-- use database 
USE tarea;
-- create table with item id increment - nro int - nomb_env varchar
CREATE TABLE evidencias(
    id INT NOT NULL AUTO_INCREMENT,
    nro INT NOT NULL,
    nomb_env VARCHAR(100) NOT NULL,
    PRIMARY KEY ( id )
);
-- insert value evidencias 
INSERT INTO evidencias (nro, nomb_env) 
VALUES ('1', 'ubuntu+openssh');
INSERT INTO evidencias (nro, nomb_env) 
VALUES ('3', 'actualizar parches');
INSERT INTO evidencias (nro, nomb_env)
VALUES ('4', 'listar parches');
INSERT INTO evidencias (nro, nomb_env) 
VALUES ('5', 'instalar nessus');
INSERT INTO evidencias (nro, nomb_env) 
VALUES ('7', 'exportar reporte nessus');
INSERT INTO evidencias (nro, nomb_env) 
VALUES ('8', 'stop services');
INSERT INTO evidencias (nro, nomb_env) 
VALUES ('9', 'listar kernel, version y nombre');
INSERT INTO evidencias (nro, nomb_env) 
VALUES ('11', 'scan dir home');
INSERT INTO evidencias (nro, nomb_env) 
VALUES ('15', 'describir tabla');
INSERT INTO evidencias (nro, nomb_env) 
VALUES ('17', 'otorgar permisos');
INSERT INTO evidencias (nro, nomb_env) 
VALUES ('18', 'realizar accion sin permisos');
INSERT INTO evidencias (nro, nomb_env) 
VALUES ('19', 'hardening ssh');
INSERT INTO evidencias (nro, nomb_env) 
VALUES ('20', 'permitrootlogin no ');
INSERT INTO evidencias (nro, nomb_env) 
VALUES ('21', 'politica password');
INSERT INTO evidencias (nro, nomb_env)
VALUES ('22', 'expirar pass ubuntu');
-- create user with password error 
CREATE USER 'mod3'@'localhost' IDENTIFIED BY 'pass1234';
-- create user with password ok 
CREATE USER 'mod3'@'localhost' IDENTIFIED BY 'PasS.-3412';
-- assign 3 permissions
GRANT SELECT, INSERT, UPDATE ON tarea.* TO 'mod3'@'localhost';
