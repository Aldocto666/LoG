drop database if exists base;
create database base;
use base;
create table Usuario (
	IdUsuario int(3) primary key,
    NombreUsuario varchar(20),
    Contrasenia varchar(25),
    Nombre varchar(20),
    Sesion boolean);


