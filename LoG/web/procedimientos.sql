drop procedure if exists addAlumno;
delimiter //
 create procedure addAlumno(IdUs int(3), NombreUs varchar(20),Con varchar(25),Nom varchar(20), ses boolean)
 begin 
	declare xIdUs int;
    declare xMsj nvarchar(50);
    declare existe int;
    
    if (idUs = 0) then
		set existe = (select count(*) from Usuario where NombreUsuario = NombreUs);
        if (existe = 0) then
			set xIdUs = (select ifnull(max(IdUsuario),0) + 1 from Usuario);
            
            insert into Usuario (IdUsuario, NombreUsuario, Contrasenia, Nombre, Sesion) values(xIdUs, NombreUs ,Con ,Nom, ses);
            set xMsj ="Registro exitoso";
		else 
			set xMsj = "Usuario ya registrado";
			set xIdUs = 0;
		end if;
    else 
		update Usuario set Contrasenia = Con, Nombre = Nom where idUsuario = idUs;
        set xMsj = "Datos modificados";
        set xIdUs = idUs;
    end if;
    select xIdUs as IdUsuario, xMsj;
 end;//