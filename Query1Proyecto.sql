create database Tifix; 

use Tifix;

create table servicios (
codservicio varchar (3), 
constraint PK_servicios primary key (codservicio),
nombreservicio varchar (20) not null,
tiposervicio varchar (30) not null,
precioservicio numeric (12,2) not null,
descripcionservicio varchar (250) not null
);


create table clientes (
idcliente numeric (12), 
constraint PK_clientes primary key (idcliente),
tipo_id_cliente varchar (3) not null,
nombres varchar (50) not null,
apellidos varchar (60) not null,
direccion varchar (80) not null,
telefono numeric (15) not null,
email varchar (80)
);

create table empleados (
idempleado numeric (12), 
constraint PK_empleadosti primary key (idempleado),
nombres varchar (50) not null,
apellidos varchar (60) not null,
direccion varchar (80) not null,
telefono numeric (15) not null,
email varchar (80),
cargo varchar (80) not null
);

create table tecnicos (
idtecnico numeric (12), 
constraint PK_tecnicos primary key (idtecnico),
nombres varchar (50) not null,
apellidos varchar (60) not null,
direccion varchar (80) not null,
telefono numeric (15) not null,
email varchar (80)
);


create table especialidad (
codespecialidad numeric (3), 
constraint PK_codespecialidad primary key (codespecialidad),
nombreespecialidad varchar (50),
descripcion varchar (250) not null);


create table certificaciones (
codcertificacion varchar (3) ,
constraint PK_codcertificacion primary key (codcertificacion),
codespecialidad numeric (3),
constraint FK_certicodespecialidad foreign key (codespecialidad) 
references especialidad(codespecialidad),
idtecnico numeric (12), 
constraint FK_certiidtecnico foreign key (idtecnico) 
references
tecnicos(idtecnico),
fecha_certificacion date not null);


create table soportes (
codtrabajo varchar (10),
constraint PK_codtrabajo primary key (codtrabajo),
codservicio varchar (3),
constraint FK_sopcodservicio foreign key (codservicio) 
references servicios(codservicio),
idcliente numeric (12), 
constraint FK_sopidcliente foreign key (idcliente) 
references clientes(idcliente),
idtecnico numeric (12), 
constraint FK_sopidtecnico foreign key (idtecnico) 
references
tecnicos(idtecnico),
fechasoporte date not null, 
modo_soporte varchar (40) not null,
forma_de_pago varchar (40) not null,
descrip_soporte varchar (400) not null,
descrip_dispositivo varchar (400)
);

alter table servicios
alter column nombreservicio varchar(60);

alter table servicios
alter column tiposervicio varchar(60);

alter table clientes
add constraint uk_telefono unique (telefono);

alter table clientes
add constraint uk_email unique (email);


insert into Servicios (codservicio, nombreservicio, tiposervicio, precioservicio, descripcionservicio)
values
('SER', 'Mantenimiento preventivo', 'Mantenimiento', 70000.00, 'Revisi�n y mantenimiento preventivo de equipos y dispositivos.'),
('REP', 'Reparaci�n de computadoras', 'Reparaci�n', 120000.00, 'Reparaci�n de computadoras y dispositivos relacionados.'),
('INS', 'Instalaci�n de software', 'Instalaci�n', 30000.00, 'Instalaci�n de software y configuraci�n de sistemas.'),
('SOP', 'Soporte t�cnico remoto', 'Soporte', 40000.00, 'Soporte t�cnico remoto para resolver problemas y dudas.'),
('CON', 'Configuraci�n de redes', 'Configuraci�n', 90000.00, 'Configuraci�n de redes y sistemas de comunicaci�n.'),
('MCO', 'Mantenimiento correctivo', 'Mantenimiento', 120000.00, 'Mantenimiento correctivo de equipos y dispositivos.'),
('IHW', 'Instalaci�n de hardware', 'Instalaci�n', 60000.00, 'Instalaci�n de hardware y componentes de computadoras.'),
('SPT', 'Soporte t�cnico presencial', 'Soporte', 70000.00, 'Soporte t�cnico presencial para resolver problemas y dudas.'),
('CSE', 'Configuraci�n de seguridad', 'Configuraci�n', 120000.00, 'Configuraci�n de sistemas de seguridad y protecci�n de datos.'),
('MSV', 'Mantenimiento de servidores', 'Mantenimiento', 200000.00, 'Mantenimiento y administraci�n de servidores y sistemas de red.'),
('ISO', 'Instalaci�n de sistemas operativos', 'Instalaci�n', 60000.00, 'Instalaci�n y configuraci�n de sistemas operativos.'),
('SRN', 'Soporte t�cnico para redes', 'Soporte', 90000.00, 'Soporte t�cnico para redes y sistemas de comunicaci�n.'),
('CBD', 'Configuraci�n de bases de datos', 'Configuraci�n', 220000.00, 'Configuraci�n y administraci�n de bases de datos.'),
('MER', 'Mantenimiento de equipos de red', 'Mantenimiento', 120000.00, 'Mantenimiento y reparaci�n de equipos de red y comunicaci�n.'),
('IAP', 'Instalaci�n de aplicaciones', 'Instalaci�n', 40000.00, 'Instalaci�n y configuraci�n de aplicaciones y software.'),
('AUD', 'Auditor�a de seguridad', 'Auditor�a', 150000.00, 'An�lisis y evaluaci�n de la seguridad de los sistemas y redes.'),
('CAP', 'Capacitaci�n en seguridad', 'Capacitaci�n', 100000.00, 'Entrenamiento y capacitaci�n en seguridad inform�tica para empleados.'),
('DES', 'Dise�o de redes', 'Dise�o', 150000.00, 'Dise�o y planificaci�n de redes y sistemas de comunicaci�n.'),
('EVA', 'Evaluaci�n de rendimiento', 'Evaluaci�n', 100000.00, 'An�lisis y evaluaci�n del rendimiento de los sistemas y redes.'),
('GES', 'Gesti�n de proyectos', 'Gesti�n', 250000.00, 'Planificaci�n, ejecuci�n y seguimiento de proyectos de TI.'),
('HAC', 'Hackeo �tico', 'Pruebas de penetraci�n', 180000.00, 'Pruebas de penetraci�n y an�lisis de vulnerabilidades en sistemas y redes.'),
('IMP', 'Implementaci�n de soluciones', 'Implementaci�n', 100000.00, 'Implementaci�n de soluciones de TI y configuraci�n de sistemas.'),
('INF', 'Informe de seguridad', 'Informe', 100000.00, 'An�lisis y elaboraci�n de informes de seguridad para sistemas y redes.'),
('INT', 'Integraci�n de sistemas', 'Integraci�n', 150000.00, 'Integraci�n de sistemas y aplicaciones para mejorar la eficiencia y productividad.'),
('MIG', 'Migraci�n de datos', 'Migraci�n', 150000.00, 'Migraci�n de datos de un sistema a otro para mejorar la eficiencia y productividad.'),
('MON', 'Monitoreo de sistemas', 'Monitoreo', 100000.00, 'Monitoreo y supervisi�n de sistemas y redes para detectar problemas y mejorar la eficiencia.'),
('OPT', 'Optimizaci�n de rendimiento', 'Optimizaci�n', 120000.00, 'An�lisis y optimizaci�n del rendimiento de los sistemas y redes.'),
('REC', 'Recuperaci�n de datos', 'Recuperaci�n', 200000.00, 'Recuperaci�n de datos perdidos o da�ados en sistemas y redes.'),
('SEG', 'Seguridad inform�tica', 'Seguridad', 190000.00, 'An�lisis y evaluaci�n de la seguridad inform�tica de sistemas y redes.'),
('SUP', 'Soporte t�cnico avanzado', 'Soporte', 200000.00, 'Soporte t�cnico avanzado para resolver problemas complejos en sistemas y redes.');


INSERT INTO clientes (idcliente, tipo_id_cliente, nombres, apellidos, direccion, telefono, email)
VALUES
(1023456789, 'CC', 'Juan', 'Perez', 'Calle 45 # 67-32, Medell�n', 3123456789, 'juan.perez3@gmail.com'),
(2034567890, 'CC', 'Maria', 'Lopez', 'Carrera 78 # 14A-12, Envigado', 3134567890, 'maria.lopez@hotmail.com'),
(3045678901, 'CC', 'Carlos', 'Rodriguez', 'Calle 42 # 9-22, Itag��', 3145678901, 'carlos.rodriguez@yahoo.com'),
(4056789012, 'CC', 'Laura', 'Gonzalez', 'Carrera 80 # 12-45, Rionegro', 3156789012, 'laura.gonzalez@gmail.com'),
(5067890123, 'CC', 'Andres', 'Martinez', 'Calle 30 # 20-35, La Ceja', 3167890123, 'andres.martinez@hotmail.com'),
(6078901234, 'CC', 'Ana', 'Garcia', 'Carrera 64 # 10-21, El Retiro', 3178901234, 'ana.garcia@yahoo.com'),
(7089012345, 'CC', 'Luis', 'Fernandez', 'Calle 53 # 32-17, Bello', 3189012345, 'luis.fernandez@gmail.com'),
(8090123456, 'CC', 'Paula', 'Torres', 'Carrera 47 # 13-25, Sabaneta', 3190123456, 'paula.torres@hotmail.com'),
(9101234567, 'CC', 'Javier', 'Ruiz', 'Calle 55 # 14-10, Copacabana', 3201234567, 'javier.ruiz@yahoo.com'),
(1012345678, 'CC', 'Sofia', 'Castro', 'Carrera 65 # 27-36, La Estrella', 3212345678, 'sofia.castro@gmail.com'),
(1123456789, 'CC', 'Pedro', 'Morales', 'Calle 62 # 11-44, Envigado', 3223456789, 'pedro.morales@hotmail.com'),
(1234567890, 'CC', 'Carmen', 'Soto', 'Carrera 50 # 34-50, Itag��', 3234567890, 'carmen.soto@yahoo.com'),
(1345678901, 'CC', 'Alejandro', 'Vargas', 'Calle 29 # 19-10, Rionegro', 3245678901, 'alejandro.vargas@gmail.com'),
(1456789012, 'CC', 'Gabriela', 'Romero', 'Carrera 78 # 15-58, La Ceja', 3256789012, 'gabriela.romero@hotmail.com'),
(1567890123, 'CC', 'Diego', 'Perez', 'Calle 54 # 22-10, El Retiro', 3267890123, 'diego.perez@yahoo.com'),
(1678901234, 'CC', 'Juliana', 'Diaz', 'Carrera 70 # 33-11, Medell�n', 3278901234, 'juliana.diaz@gmail.com'),
(1789012345, 'CC', 'Felipe', 'Gomez', 'Calle 74 # 9-40, Sabaneta', 3289012345, 'felipe.gomez@hotmail.com'),
(1890123456, 'CC', 'Carolina', 'Ruiz', 'Carrera 51 # 25-18, Bello', 3290123456, 'carolina.ruiz@yahoo.com'),
(1901234567, 'CC', 'Oscar', 'Hernandez', 'Calle 48 # 10-56, Copacabana', 3301234567, 'oscar.hernandez@gmail.com'),
(2012345678, 'CC', 'Marta', 'Gonzalez', 'Carrera 55 # 31-25, Envigado', 3312345678, 'marta.gonzalez@hotmail.com'),
(2123456789, 'CC', 'Antonio', 'Lopez', 'Calle 23 # 12-30, Itag��', 3323456789, 'antonio.lopez@yahoo.com'),
(2234567890, 'CC', 'Daniela', 'Sanchez', 'Carrera 79 # 17-32, Rionegro', 3334567890, 'daniela.sanchez@gmail.com'),
(2345678901, 'CC', 'Ricardo', 'Ramirez', 'Calle 30 # 24-15, La Ceja', 3345678901, 'ricardo.ramirez@hotmail.com'),
(2456789012, 'CC', 'Isabel', 'Cruz', 'Carrera 63 # 18-21, El Retiro', 3356789012, 'isabel.cruz@yahoo.com'),
(2567890123, 'CC', 'Guillermo', 'Torres', 'Calle 52 # 25-50, Medell�n', 3367890123, 'guillermo.torres@gmail.com'),
(2678901234, 'CC', 'Teresa', 'Rodriguez', 'Carrera 65 # 16-24, Envigado', 3378901234, 'teresa.rodriguez@hotmail.com'),
(2789012345, 'CC', 'Mario', 'Medina', 'Calle 42 # 22-14, Itag��', 3389012345, 'mario.medina@yahoo.com'),
(2890123456, 'CC', 'Jessica', 'Rivera', 'Carrera 74 # 13-15, Rionegro', 3390123456, 'jessica.rivera@gmail.com'),
(2901234567, 'CC', 'Samuel', 'Ortega', 'Calle 51 # 27-39, La Ceja', 3401234567, 'samuel.ortega@hotmail.com'),
(3012345678, 'CC', 'Veronica', 'Morales', 'Carrera 70 # 16-33, El Retiro', 3412345678, 'veronica.morales@yahoo.com'),
(3123456789, 'CC', 'Carlos', 'Diaz', 'Calle 53 # 35-22, Bello', 3423456789, 'carlos.diaz@gmail.com'),
(3234567890, 'CC', 'Juliana', 'Gomez', 'Carrera 49 # 21-18, Copacabana', 3434567890, 'juliana.gomez@hotmail.com'),
(3345678901, 'CC', 'Fernando', 'Lopez', 'Calle 51 # 19-25, Envigado', 3445678901, 'fernando.lopez@yahoo.com'),
(3456789012, 'CC', 'Patricia', 'Hernandez', 'Carrera 60 # 22-28, Itag��', 3456789012, 'patricia.hernandez@gmail.com'),
(3567890123, 'CC', 'Pedro', 'Sanchez', 'Calle 70 # 15-36, Rionegro', 3467890123, 'pedro.sanchez@hotmail.com'),
(3678901234, 'CC', 'Ricardo', 'Torres', 'Carrera 55 # 19-50, La Ceja', 3478901234, 'ricardo.torres@yahoo.com'),
(3789012345, 'CC', 'Gabriela', 'Ramirez', 'Calle 50 # 20-11, El Retiro', 3489012345, 'gabriela.ramirez@gmail.com'),
(3890123456, 'CC', 'Manuel', 'Martinez', 'Carrera 62 # 11-21, Medell�n', 3490123456, 'manuel.martinez@hotmail.com'),
(3901234567, 'CC', 'Rosa', 'Lopez', 'Calle 74 # 12-31, Sabaneta', 3501234567, 'rosa.lopez@yahoo.com'),
(4012345678, 'CC', 'Juan', 'Perez', 'Carrera 55 # 18-12, Bello', 3512345678, 'juan.perez@gmail.com'),
(4123456789, 'CC', 'Lina', 'Hernandez', 'Calle 64 # 9-35, Copacabana', 3523456789, 'lina.hernandez@hotmail.com'),
(4234567890, 'CC', 'Luis', 'Soto', 'Carrera 56 # 19-44, Itag��', 3534567890, 'luis.soto@yahoo.com'),
(4345678901, 'CC', 'Pablo', 'Rodriguez', 'Calle 51 # 12-28, La Ceja', 3545678901, 'pablo.rodriguez@gmail.com'),
(4456789012, 'CC', 'Cecilia', 'Ramirez', 'Carrera 63 # 28-14, Medell�n', 3556789012, 'cecilia.ramirez@hotmail.com'),
(4567890123, 'CC', 'Hector', 'Gomez', 'Calle 45 # 29-22, Sabaneta', 3567890123, 'hector.gomez@yahoo.com'),
(4678901234, 'CC', 'Jose', 'Diaz', 'Carrera 77 # 10-11, Rionegro', 3578901234, 'jose.diaz@gmail.com'),
(4789012345, 'CC', 'Natalia', 'Morales', 'Calle 54 # 17-21, El Retiro', 3589012345, 'natalia.morales@hotmail.com'),
(4890123456, 'CC', 'Marta', 'Gomez', 'Carrera 52 # 23-33, Medell�n', 3590123456, 'marta.gomez@yahoo.com'),
(4901234567, 'CC', 'Carlos', 'Vargas', 'Calle 60 # 17-27, Copacabana', 3601234567, 'carlos.vargas@gmail.com'),
(5012345678, 'CC', 'Alejandra', 'Lopez', 'Carrera 62 # 13-38, La Ceja', 3612345678, 'alejandra.lopez@hotmail.com'),
(5123456789, 'CC', 'Carlos', 'Sanchez', 'Calle 54 # 25-28, Medell�n', 3623456789, 'carlos.sanchez@yahoo.com');


INSERT INTO empleados (idempleado, nombres, apellidos, direccion, telefono, email, cargo) 
VALUES 
(1023498712, 'Carlos', 'P�rez', 'Calle 40 # 12-34, Medell�n', 3112345678, 'carlos.perez@tifix.com', 'Gerente General'),
(1037845612, 'Laura', 'Ram�rez', 'Carrera 56 # 23-45, Envigado', 3123456789, 'laura.ramirez@tifix.com', 'Jefe de Marketing'),
(1078965432, 'Andr�s', 'G�mez', 'Calle 78 # 9-21, Bello', 3134567890, 'andres.gomez@tifix.com', 'Director Comercial'),
(1064532801, 'Marta', 'Hern�ndez', 'Avenida 5 # 18-33, Itag��', 3145678901, 'marta.hernandez@tifix.com', 'Analista de Recursos Humanos'),
(1098765432, 'Santiago', 'L�pez', 'Carrera 34 # 12-19, Rionegro', 3156789012, 'santiago.lopez@tifix.com', 'Coordinador de Proyectos'),
(1085432912, 'Ana', 'Mart�nez', 'Calle 22 # 10-15, La Ceja', 3167890123, 'ana.martinez@tifix.com', 'Consultora de Ventas'),
(1109874321, 'Luis', 'Gonz�lez', 'Calle 45 # 28-40, Medell�n', 3178901234, 'luis.gonzalez@tifix.com', 'Asesor T�cnico'),
(1112345678, 'Isabella', 'Vargas', 'Carrera 14 # 5-8, Copacabana', 3189012345, 'isabella.vargas@tifix.com', 'Jefa de Finanzas'),
(1123456789, 'Jos�', 'Su�rez', 'Avenida 12 # 6-20, Sabaneta', 3190123456, 'jose.suarez@tifix.com', 'Supervisor de Producci�n'),
(1134567890, 'Valentina', 'Castro', 'Calle 67 # 3-12, Envigado', 3201234567, 'valentina.castro@tifix.com', 'Gerente de TI'),
(1145678901, 'Felipe', 'S�nchez', 'Carrera 18 # 4-19, La Estrella', 3212345678, 'felipe.sanchez@tifix.com', 'Director de Marketing'),
(1156789012, 'Camila', 'D�az', 'Calle 53 # 15-25, Sabaneta', 3223456789, 'camila.diaz@tifix.com', 'Coordinadora de Ventas'),
(1167890123, 'Ricardo', 'Rojas', 'Carrera 49 # 7-14, Medell�n', 3234567890, 'ricardo.rojas@tifix.com', 'Especialista en Soporte'),
(1178901234, 'Paola', 'Moreno', 'Avenida 10 # 3-6, Bello', 3245678901, 'paola.moreno@tifix.com', 'Asistente Administrativa'),
(1189012345, 'David', 'Ram�rez', 'Calle 8 # 12-18, Itag��', 3256789012, 'david.ramirez@tifix.com', 'Analista de Marketing');


INSERT INTO tecnicos (idtecnico, nombres, apellidos, direccion, telefono, email) 
VALUES 
(2012387451, 'Juan', 'Paredes', 'Calle 56 # 34-12, Medell�n', 3101234567, 'juan.paredes@tifix.com'),
(2023485672, 'Luisa', 'Rodr�guez', 'Avenida 8 # 15-25, Bello', 3112345678, 'luisa.rodriguez@tifix.com'),
(2034589233, 'Carlos', 'Gonz�lez', 'Carrera 22 # 5-10, Itag��', 3123456789, 'carlos.gonzalez@tifix.com'),
(2045673894, 'Ana', 'Mart�nez', 'Calle 15 # 28-35, Sabaneta', 3134567890, 'ana.martinez@tifix.com'),
(2056784925, 'Felipe', 'L�pez', 'Carrera 30 # 7-16, Envigado', 3145678901, 'felipe.lopez@tifix.com'),
(2067895436, 'Valentina', 'Su�rez', 'Avenida 9 # 12-30, La Ceja', 3156789012, 'valentina.suarez@tifix.com'),
(2078906547, 'Ricardo', 'Vargas', 'Calle 4 # 8-17, Rionegro', 3167890123, 'ricardo.vargas@tifix.com'),
(2089017658, 'Marta', 'Jim�nez', 'Carrera 19 # 14-22, Medell�n', 3178901234, 'marta.jimenez@tifix.com'),
(2090128769, 'Pedro', 'S�nchez', 'Avenida 13 # 6-20, La Estrella', 3189012345, 'pedro.sanchez@tifix.com'),
(2101239870, 'Isabella', 'Mendoza', 'Calle 31 # 10-5, Bello', 3190123456, 'isabella.mendoza@tifix.com');

INSERT INTO especialidad (codespecialidad, nombreespecialidad, descripcion) 
VALUES 
(101, 'Redes Inform�ticas', 'Especializaci�n en instalaci�n, configuraci�n y mantenimiento de redes inform�ticas en empresas y hogares.'),
(102, 'Soporte T�cnico', 'Especializaci�n en la resoluci�n de problemas t�cnicos en dispositivos electr�nicos y equipos inform�ticos.'),
(103, 'Desarrollo Web', 'Desarrollo de aplicaciones y sitios web utilizando las �ltimas tecnolog�as y lenguajes de programaci�n web.'),
(104, 'Seguridad Inform�tica', 'Gesti�n y protecci�n de la infraestructura inform�tica ante amenazas cibern�ticas.'),
(105, 'Bases de Datos', 'Especializaci�n en dise�o, implementaci�n y administraci�n de bases de datos relacionales.'),
(106, 'Cloud Computing', 'Implementaci�n y gesti�n de servicios en la nube para empresas, optimizando el uso de recursos.'),
(107, 'Programaci�n de Software', 'Desarrollo y mantenimiento de programas inform�ticos utilizando lenguajes de programaci�n modernos.'),
(108, 'Soporte de Hardware', 'Diagn�stico y reparaci�n de fallas en componentes f�sicos de computadoras y otros dispositivos electr�nicos.'),
(109, 'Automatizaci�n Industrial', 'Dise�o e implementaci�n de sistemas automatizados para mejorar procesos industriales.'),
(110, 'IoT (Internet de las Cosas)', 'Desarrollo de dispositivos inteligentes que se comunican a trav�s de internet para diversos usos.'),
(111, 'Big Data', 'An�lisis y procesamiento de grandes vol�menes de datos para la toma de decisiones empresariales.'),
(112, 'Inteligencia Artificial', 'Desarrollo de sistemas capaces de aprender y tomar decisiones aut�nomas mediante algoritmos de IA.'),
(113, 'Realidad Virtual', 'Desarrollo de aplicaciones y dispositivos para crear experiencias inmersivas en entornos virtuales.'),
(114, 'Soporte de Sistemas Operativos', 'Asistencia t�cnica y mantenimiento de sistemas operativos para optimizar su rendimiento.'),
(115, 'Telecomunicaciones', 'Especializaci�n en el dise�o, instalaci�n y mantenimiento de redes de telecomunicaciones.'),
(116, 'An�lisis de Redes', 'Monitoreo y an�lisis de redes inform�ticas para detectar problemas y mejorar el rendimiento.'),
(117, 'Programaci�n M�vil', 'Desarrollo de aplicaciones m�viles para plataformas Android e iOS, optimizando la experiencia de usuario.'),
(118, 'Blockchain', 'Desarrollo y aplicaci�n de tecnolog�as de blockchain para garantizar la seguridad y transparencia de las transacciones.'),
(119, 'Consultor�a en TI', 'Asesor�a experta para empresas en la optimizaci�n de sus infraestructuras y procesos tecnol�gicos.'),
(120, 'Ciberseguridad', 'Protecci�n de sistemas inform�ticos y redes contraataques y accesos no autorizados, asegurando la privacidad.');


alter table certificaciones 
add nombre_certificacion varchar (60);
alter table certificaciones
add descrip_certificacion varchar (400);


ALTER TABLE certificaciones
ADD codmundialcertificacion varchar(6);


delete from certificaciones;

INSERT INTO certificaciones (codcertificacion, codmundialcertificacion, codespecialidad, idtecnico, fecha_certificacion, nombre_certificacion, descrip_certificacion)
VALUES 
('001', 'CRED01', 101, 2012387451, '2021-02-15', 'Certificaci�n en Redes Inform�ticas', 'Certificaci�n especializada en la instalaci�n, configuraci�n y mantenimiento de redes inform�ticas.'),
('002', 'CSOP02', 102, 2023485672, '2020-08-23', 'Certificaci�n en Soporte T�cnico', 'Certificaci�n en la resoluci�n de problemas t�cnicos en dispositivos electr�nicos y equipos inform�ticos.'),
('003', 'CWEB03', 103, 2034589233, '2022-05-10', 'Certificaci�n en Desarrollo Web', 'Certificaci�n en el desarrollo de aplicaciones y sitios web utilizando tecnolog�as modernas y lenguajes de programaci�n web.'),
('004', 'CSEG04', 104, 2045673894, '2019-11-02', 'Certificaci�n en Seguridad Inform�tica', 'Certificaci�n en la gesti�n y protecci�n de la infraestructura inform�tica ante amenazas cibern�ticas.'),
('005', 'CDBS05', 105, 2056784925, '2020-03-19', 'Certificaci�n en Bases de Datos', 'Certificaci�n especializada en dise�o, implementaci�n y administraci�n de bases de datos relacionales.'),
('006', 'CCLC06', 106, 2067895436, '2021-07-25', 'Certificaci�n en Cloud Computing', 'Certificaci�n en la implementaci�n y gesti�n de servicios en la nube para empresas.'),
('007', 'CPSF07', 107, 2078906547, '2022-01-30', 'Certificaci�n en Programaci�n de Software', 'Certificaci�n en el desarrollo y mantenimiento de programas inform�ticos utilizando lenguajes de programaci�n modernos.'),
('008', 'CHSW08', 108, 2089017658, '2023-04-12', 'Certificaci�n en Soporte de Hardware', 'Certificaci�n en diagn�stico y reparaci�n de fallas en componentes f�sicos de computadoras y otros dispositivos electr�nicos.'),
('009', 'CAI09', 109, 2090128769, '2019-09-28', 'Certificaci�n en Automatizaci�n Industrial', 'Certificaci�n en el dise�o e implementaci�n de sistemas automatizados para procesos industriales.'),
('010', 'CIOT10', 110, 2101239870, '2020-06-05', 'Certificaci�n en IoT (Internet de las Cosas)', 'Certificaci�n en el desarrollo de dispositivos inteligentes que se comunican a trav�s de internet para diversos usos.'),
('011', 'CBIG11', 111, 2012387451, '2021-03-21', 'Certificaci�n en Big Data', 'Certificaci�n en el an�lisis y procesamiento de grandes vol�menes de datos para la toma de decisiones empresariales.'),
('012', 'CIA12', 112, 2023485672, '2022-09-18', 'Certificaci�n en Inteligencia Artificial', 'Certificaci�n en el desarrollo de sistemas capaces de aprender y tomar decisiones aut�nomas mediante algoritmos de IA.'),
('013', 'CRV13', 113, 2034589233, '2020-12-15', 'Certificaci�n en Realidad Virtual', 'Certificaci�n en el desarrollo de aplicaciones y dispositivos para crear experiencias inmersivas en entornos virtuales.'),
('014', 'CSO14', 114, 2045673894, '2023-01-22', 'Certificaci�n en Soporte de Sistemas Operativos', 'Certificaci�n en asistencia t�cnica y mantenimiento de sistemas operativos para optimizar su rendimiento.'),
('015', 'CTEL15', 115, 2056784925, '2019-04-10', 'Certificaci�n en Telecomunicaciones', 'Certificaci�n especializada en el dise�o, instalaci�n y mantenimiento de redes de telecomunicaciones.'),
('016', 'CANR16', 116, 2067895436, '2022-07-09', 'Certificaci�n en An�lisis de Redes', 'Certificaci�n en monitoreo y an�lisis de redes inform�ticas para detectar problemas y mejorar el rendimiento.'),
('017', 'CPMO17', 117, 2078906547, '2021-11-03', 'Certificaci�n en Programaci�n M�vil', 'Certificaci�n en el desarrollo de aplicaciones m�viles para plataformas Android e iOS.'),
('018', 'CBLC18', 118, 2089017658, '2023-02-18', 'Certificaci�n en Blockchain', 'Certificaci�n en el desarrollo y aplicaci�n de tecnolog�as de blockchain para garantizar la seguridad y transparencia de las transacciones.'),
('019', 'CCTI19', 119, 2090128769, '2020-04-17', 'Certificaci�n en Consultor�a en TI', 'Certificaci�n en la asesor�a experta para empresas en la optimizaci�n de sus infraestructuras y procesos tecnol�gicos.'),
('020', 'CCIB20', 120, 2101239870, '2021-08-05', 'Certificaci�n en Ciberseguridad', 'Certificaci�n en protecci�n de sistemas inform�ticos y redes contra ataques y accesos no autorizados, asegurando la privacidad.'),
('021', 'CRED01', 101, 2023485672, '2021-02-15', 'Certificaci�n en Redes Inform�ticas', 'Certificaci�n especializada en la instalaci�n, configuraci�n y mantenimiento de redes inform�ticas.'),
('022', 'CSOP02', 102, 2034589233, '2020-08-23', 'Certificaci�n en Soporte T�cnico', 'Certificaci�n en la resoluci�n de problemas t�cnicos en dispositivos electr�nicos y equipos inform�ticos.'),
('023', 'CWEB03', 103, 2045673894, '2022-05-10', 'Certificaci�n en Desarrollo Web', 'Certificaci�n en el desarrollo de aplicaciones y sitios web utilizando tecnolog�as modernas y lenguajes de programaci�n web.'),
('024', 'CSEG04', 104, 2056784925, '2019-11-02', 'Certificaci�n en Seguridad Inform�tica', 'Certificaci�n en la gesti�n y protecci�n de la infraestructura inform�tica ante amenazas cibern�ticas.'),
('025', 'CDBS05', 105, 2067895436, '2020-03-19', 'Certificaci�n en Bases de Datos', 'Certificaci�n especializada en dise�o, implementaci�n y administraci�n de bases de datos relacionales.'),
('026', 'CCLC06', 106, 2078906547, '2021-07-25', 'Certificaci�n en Cloud Computing', 'Certificaci�n en la implementaci�n y gesti�n de servicios en la nube para empresas.'),
('027', 'CPSF07', 107, 2089017658, '2022-01-30', 'Certificaci�n en Programaci�n de Software', 'Certificaci�n en el desarrollo y mantenimiento de programas inform�ticos utilizando lenguajes de programaci�n modernos.'),
('028', 'CHSW08', 108, 2090128769, '2023-04-12', 'Certificaci�n en Soporte de Hardware', 'Certificaci�n en diagn�stico y reparaci�n de fallas en componentes f�sicos de computadoras y otros dispositivos electr�nicos.'),
('029', 'CAI09', 109, 2101239870, '2019-09-28', 'Certificaci�n en Automatizaci�n Industrial', 'Certificaci�n en el dise�o e implementaci�n de sistemas automatizados para procesos industriales.'),
('030', 'CIOT10', 110, 2012387451, '2020-06-05', 'Certificaci�n en IoT (Internet de las Cosas)', 'Certificaci�n en el desarrollo de dispositivos inteligentes que se comunican a trav�s de internet para diversos usos.');


INSERT INTO soportes (codtrabajo, codservicio, idcliente, idtecnico, fechasoporte, modo_soporte, forma_de_pago, descrip_soporte, descrip_dispositivo)
VALUES
('SOP-001', 'SER', 1023456789, 2012387451, '2024-01-01', 'Presencial', 'Efectivo', 'Revisi�n y mantenimiento preventivo de computadora', 'Computadora HP Pavilion'),
('SOP-002', 'REP', 2034567890, 2023485672, '2024-01-05', 'Remoto', 'Tarjeta de cr�dito', 'Reparaci�n de computadora', 'Computadora Dell Inspiron'),
('SOP-003', 'INS', 3045678901, 2034589233, '2024-01-10', 'Presencial', 'Cheque', 'Instalaci�n de software', 'Software Microsoft Office'),
('SOP-004', 'SOP', 4056789012, 2045673894, '2024-01-15', 'Remoto', 'Transferencia bancaria', 'Soporte t�cnico remoto', 'Computadora Lenovo ThinkPad'),
('SOP-005', 'CON', 5067890123, 2056784925, '2024-01-20', 'Presencial', 'Efectivo', 'Configuraci�n de red', 'Router TP-Link'),
('SOP-006', 'MCO', 6078901234, 2067895436, '2024-01-25', 'Remoto', 'Tarjeta de cr�dito', 'Mantenimiento correctivo de computadora', 'Computadora Apple MacBook'),
('SOP-007', 'IHW', 7089012345, 2078906547, '2024-01-30', 'Presencial', 'Cheque', 'Instalaci�n de hardware', 'Disco duro Western Digital'),
('SOP-008', 'SPT', 8090123456, 2089017658, '2024-02-01', 'Remoto', 'Transferencia bancaria', 'Soporte t�cnico presencial', 'Computadora HP EliteBook'),
('SOP-009', 'CSE', 9101234567, 2090128769, '2024-02-05', 'Presencial', 'Efectivo', 'Configuraci�n de seguridad', 'Software antivirus Norton'),
('SOP-010', 'MSV', 1012345678, 2101239870, '2024-02-10', 'Remoto', 'Tarjeta de cr�dito', 'Mantenimiento de servidor', 'Servidor Dell PowerEdge'),
('SOP-011', 'ISO', 1123456789, 2012387451, '2024-02-15', 'Presencial', 'Cheque', 'Instalaci�n de sistema operativo', 'Sistema operativo Windows 10'),
('SOP-012', 'SRN', 1234567890, 2023485672, '2024-02-20', 'Remoto', 'Transferencia bancaria', 'Soporte t�cnico para redes', 'Router Cisco'),
('SOP-013', 'CBD', 1345678901, 2034589233, '2024-02-25', 'Presencial', 'Efectivo', 'Configuraci�n de base de datos', 'Base de datos MySQL'),
('SOP-014', 'MER', 1456789012, 2045673894, '2024-03-01', 'Remoto', 'Tarjeta de cr�dito', 'Mantenimiento de equipo de red', 'Equipo de red Cisco'),
('SOP-015', 'IAP', 1567890123, 2056784925, '2024-03-05', 'Presencial', 'Cheque', 'Instalaci�n de aplicaci�n', 'Aplicaci�n Microsoft Office'),
('SOP-016', 'AUD', 1678901234, 2067895436, '2024-03-10', 'Remoto', 'Transferencia bancaria', 'Auditor�a de seguridad', 'Software de seguridad Norton'),
('SOP-017', 'CAP', 1789012345, 2078906547, '2024-03-15', 'Presencial', 'Efectivo', 'Capacitaci�n en seguridad', 'Curso de seguridad inform�tica'),
('SOP-018', 'DES', 1901234567, 2090128769, '2024-03-20', 'Presencial', 'Efectivo', 'Dise�o de red', 'Red de �rea local'),
('SOP-019', 'EVA', 2012345678, 2101239870, '2024-03-25', 'Remoto', 'Transferencia bancaria', 'Evaluaci�n de rendimiento', 'Computadora HP Pavilion'),
('SOP-020', 'GES', 2123456789, 2012387451, '2024-04-01', 'Presencial', 'Cheque', 'Gesti�n de proyectos', 'Proyecto de implementaci�n de red'),
('SOP-021', 'HAC', 2234567890, 2023485672, '2024-04-05', 'Remoto', 'Tarjeta de cr�dito', 'Hackeo �tico', 'Prueba de penetraci�n en red'),
('SOP-022', 'IMP', 2345678901, 2034589233, '2024-04-10', 'Presencial', 'Efectivo', 'Implementaci�n de soluciones', 'Implementaci�n de software de seguridad'),
('SOP-023', 'INF', 2456789012, 2045673894, '2024-04-15', 'Remoto', 'Transferencia bancaria', 'Informe de seguridad', 'Informe de seguridad de la red'),
('SOP-024', 'INT', 2567890123, 2056784925, '2024-04-20', 'Presencial', 'Cheque', 'Integraci�n de sistemas', 'Integraci�n de sistemas de gesti�n'),
('SOP-025', 'MIG', 2678901234, 2067895436, '2024-04-25', 'Remoto', 'Tarjeta de cr�dito', 'Migraci�n de datos', 'Migraci�n de datos a la nube'),
('SOP-026', 'MON', 2789012345, 2078906547, '2024-05-01', 'Presencial', 'Efectivo', 'Monitoreo de sistemas', 'Monitoreo de sistemas de red'),
('SOP-027', 'OPT', 2890123456, 2089017658, '2024-05-05', 'Remoto', 'Transferencia bancaria', 'Optimizaci�n de rendimiento', 'Optimizaci�n de rendimiento de la base de datos'),
('SOP-028', 'REC', 2901234567, 2090128769, '2024-05-10', 'Presencial', 'Cheque', 'Recuperaci�n de datos', 'Recuperaci�n de datos de la base de datos'),
('SOP-029', 'SEG', 3012345678, 2101239870, '2024-05-15', 'Remoto', 'Tarjeta de cr�dito', 'Seguridad inform�tica', 'An�lisis de vulnerabilidades de la red'),
('SOP-030', 'SUP', 3123456789, 2012387451, '2024-05-20', 'Presencial', 'Efectivo', 'Soporte t�cnico avanzado', 'Soporte t�cnico para la implementaci�n de la red'),
('SOP-031', 'CAP', 3234567890, 2023485672, '2024-05-25', 'Remoto', 'Transferencia bancaria', 'Capacitaci�n en seguridad', 'Curso de seguridad inform�tica para empleados'),
('SOP-032', 'AUD', 3345678901, 2034589233, '2024-06-01', 'Presencial', 'Cheque', 'Auditor�a de seguridad', 'An�lisis de vulnerabilidades de la base de datos'),
('SOP-033', 'DES', 3456789012, 2045673894, '2024-06-05', 'Remoto', 'Tarjeta de cr�dito', 'Dise�o de red', 'Dise�o de red de �rea local'),
('SOP-034', 'EVA', 3567890123, 2056784925, '2024-06-10', 'Presencial', 'Efectivo', 'Evaluaci�n de rendimiento', 'Evaluaci�n de rendimiento de la computadora');

INSERT INTO soportes (codtrabajo, codservicio, idcliente, idtecnico, fechasoporte, modo_soporte, forma_de_pago, descrip_soporte, descrip_dispositivo)
VALUES
('SOP-035', 'SER', 1023456789, 2012387451, '2024-06-15', 'Presencial', 'Efectivo', 'Revisi�n y mantenimiento preventivo de computadora', 'Computadora HP Pavilion'),
('SOP-036', 'REP', 2034567890, 2023485672, '2024-06-20', 'Remoto', 'Tarjeta de cr�dito', 'Reparaci�n de computadora', 'Computadora Dell Inspiron'),
('SOP-037', 'INS', 3045678901, 2034589233, '2024-06-25', 'Presencial', 'Cheque', 'Instalaci�n de software', 'Software Microsoft Office'),
('SOP-038', 'SOP', 4056789012, 2045673894, '2024-06-30', 'Remoto', 'Transferencia bancaria', 'Soporte t�cnico remoto', 'Computadora Lenovo ThinkPad'),
('SOP-039', 'CON', 5067890123, 2056784925, '2024-07-05', 'Presencial', 'Efectivo', 'Configuraci�n de red', 'Router TP-Link'),
('SOP-040', 'MCO', 6078901234, 2067895436, '2024-07-10', 'Remoto', 'Tarjeta de cr�dito', 'Mantenimiento correctivo de computadora', 'Computadora Apple MacBook'),
('SOP-041', 'IHW', 7089012345, 2078906547, '2024-07-15', 'Presencial', 'Cheque', 'Instalaci�n de hardware', 'Disco duro Western Digital'),
('SOP-042', 'SPT', 8090123456, 2089017658, '2024-07-20', 'Remoto', 'Transferencia bancaria', 'Soporte t�cnico presencial', 'Computadora HP EliteBook'),
('SOP-043', 'CSE', 9101234567, 2090128769, '2024-07-25', 'Presencial', 'Efectivo', 'Configuraci�n de seguridad', 'Software antivirus Norton'),
('SOP-044', 'MSV', 1012345678, 2101239870, '2024-08-01', 'Remoto', 'Tarjeta de cr�dito', 'Mantenimiento de servidor', 'Servidor Dell PowerEdge'),
('SOP-045', 'ISO', 1123456789, 2012387451, '2024-08-05', 'Presencial', 'Cheque', 'Instalaci�n de sistema operativo', 'Sistema operativo Windows 10'),
('SOP-046', 'SRN', 1234567890, 2023485672, '2024-08-10', 'Remoto', 'Transferencia bancaria', 'Soporte t�cnico para redes', 'Router Cisco'),
('SOP-047', 'CBD', 1345678901, 2034589233, '2024-08-15', 'Presencial', 'Efectivo', 'Configuraci�n de base de datos', 'Base de datos MySQL'),
('SOP-048', 'MER', 1456789012, 2045673894, '2024-08-20', 'Remoto', 'Tarjeta de cr�dito', 'Mantenimiento de equipo de red', 'Equipo de red Cisco'),
('SOP-049', 'IAP', 1567890123, 2056784925, '2024-08-25', 'Presencial', 'Cheque', 'Instalaci�n de aplicaci�n', 'Aplicaci�n Microsoft Office'),
('SOP-050', 'AUD', 1678901234, 2067895436, '2024-09-01', 'Remoto', 'Transferencia bancaria', 'Auditor�a de seguridad', 'Software de seguridad Norton'),
('SOP-051', 'CAP', 1789012345, 2078906547, '2024-09-05', 'Presencial', 'Efectivo', 'Capacitaci�n en seguridad', 'Curso de seguridad inform�tica'),
('SOP-052', 'DES', 1901234567, 2090128769, '2024-09-10', 'Presencial', 'Efectivo', 'Dise�o de red', 'Red de �rea local'),
('SOP-053', 'EVA', 2012345678, 2101239870, '2024-09-15', 'Remoto', 'Transferencia bancaria', 'Evaluaci�n de rendimiento', 'Computadora HP Pavilion'),
('SOP-054', 'GES', 2123456789, 2012387451, '2024-09-20', 'Presencial', 'Cheque', 'Gesti�n de proyectos', 'Proyecto de implementaci�n de red'),
('SOP-055', 'HAC', 2234567890, 2023485672, '2024-09-25', 'Remoto', 'Tarjeta de cr�dito', 'Hackeo �tico', 'Prueba de penetraci�n en red'),
('SOP-056', 'IMP', 2345678901, 2034589233, '2024-10-01', 'Presencial', 'Efectivo', 'Implementaci�n de soluciones', 'Implementaci�n de software de seguridad'),
('SOP-057', 'INF', 2456789012, 2045673894, '2024-10-05', 'Remoto', 'Transferencia bancaria', 'Informe de seguridad', 'Informe de seguridad de la red'),
('SOP-058', 'INT', 2567890123, 2056784925, '2024-10-10', 'Presencial', 'Cheque', 'Integraci�n de sistemas', 'Integraci�n de sistemas de gesti�n'),
('SOP-059', 'MIG', 2678901234, 2067895436, '2024-10-15', 'Remoto', 'Tarjeta de cr�dito', 'Migraci�n de datos', 'Migraci�n de datos a la nube'),
('SOP-060', 'MON', 2789012345, 2078906547, '2024-10-20', 'Presencial', 'Efectivo', 'Monitoreo de sistemas', 'Monitoreo de sistemas de red');



--PROCEDIMIENTOS ALMACENADOS 


--BUSCAR CLIENTE

create or alter proc buscar_cliente
    @idcliente numeric(12)
as
begin
    declare @existe int

    select @existe = count(*) from clientes where idcliente = @idcliente

    if @existe > 0
    begin
        select 'el cliente ya existe en la base de datos.'
    end
    else
    begin
        select 'el cliente no existe en la base de datos.'
    end
end;


exec buscar_cliente 1023456789;




--INSERTAR UN NUEVO CLIENTE 

create proc insertar_cliente 
    @idcliente numeric(12),
    @tipo_id_cliente varchar(3),
    @nombres varchar(50),
    @apellidos varchar(60),
    @direccion varchar(80),
    @telefono numeric(15),
    @email varchar(80)
as
begin
    insert into clientes (idcliente, tipo_id_cliente, nombres, apellidos, direccion, telefono, email)
    values (@idcliente, @tipo_id_cliente, @nombres, @apellidos, @direccion, @telefono, @email);
end

--EJECUTARLO

exec insertar_cliente 1152454320, 'CC', 'Jairo' , 'Benitez' , 'Calle 50 #33-22' , 3024449832, 'jairobenitez98@yahoo.com';

--VER SOPORTES POR CLIENTE Y DINERO GASTADO

create or alter proc sp_cliente_soportes
    @id_cliente int
as
begin
    select 
        clientes.idcliente,
        clientes.nombres,
        clientes.apellidos,
        servicios.nombreservicio,
        servicios.descripcionservicio,
        soportes.descrip_soporte,
        count(soportes.codtrabajo) over(partition by clientes.idcliente, servicios.codservicio) as cantidad_soportes,
        sum(servicios.precioservicio) over(partition by clientes.idcliente, servicios.codservicio) as total_gastado
    from
        clientes
    inner join soportes on clientes.idcliente = soportes.idcliente
    inner join servicios on soportes.codservicio = servicios.codservicio
    where
        clientes.idcliente = @id_cliente
    order by
        soportes.codtrabajo;
end;



exec sp_cliente_soportes 1012345678;


--BUSCA TODOS LOS CLIENTES QUE TENGAN MAS DE UN SOPORTE

create or alter proc clientes_multisoporte
as
begin
    select 
        clientes.idcliente,
        clientes.nombres,
        clientes.apellidos,
        conteo_soportes.cantidad_soportes
    from
        clientes
    inner join 
        (
            select 
                idcliente,
                count(codtrabajo) as cantidad_soportes
            from 
                soportes
            group by 
                idcliente
        ) as conteo_soportes
    on clientes.idcliente = conteo_soportes.idcliente
    where
        conteo_soportes.cantidad_soportes > 1;
end;


exec clientes_multisoporte;


--SOPORTES TECNICOS 

create or alter proc soportes_tecnico_precio
as
begin
    select 
        soportes.codtrabajo,
        soportes.codservicio,
        soportes.fechasoporte,
        soportes.modo_soporte,
        soportes.descrip_soporte,
        soportes.descrip_dispositivo,
        tecnicos.idtecnico,
        tecnicos.nombres as tecnico_nombre,
        tecnicos.apellidos as tecnico_apellido,
        servicios.precioservicio
    from 
        soportes
    inner join tecnicos on soportes.idtecnico = tecnicos.idtecnico
    inner join servicios on soportes.codservicio = servicios.codservicio;
end;


exec soportes_tecnico_precio;

--SOPORTES POR TECNICO

create or alter proc tecnicolog
    @idtecnico INT
as
begin
    select 
        soportes.codtrabajo,
        soportes.codservicio,
        soportes.fechasoporte,
        soportes.modo_soporte,
        soportes.descrip_soporte,
        soportes.descrip_dispositivo,
        servicios.nombreservicio,
        servicios.descripcionservicio,
        servicios.precioservicio
    from 
        soportes
    inner join servicios on soportes.codservicio = servicios.codservicio
    where 
        soportes.idtecnico = @idtecnico;
end;

exec tecnicolog 2023485672;


--EL TECNICO QUE MAS DINERO HA HECHO HASTA AHORA

create or alter proc mejortecnico
as
begin
    select 
        top 1 
        tecnicos.idtecnico,
        tecnicos.nombres,
        tecnicos.apellidos,
        sum(servicios.precioservicio) as total_ganado
    from 
        soportes
    inner join servicios on soportes.codservicio = servicios.codservicio
    inner join tecnicos on soportes.idtecnico = tecnicos.idtecnico
    group by 
        tecnicos.idtecnico, tecnicos.nombres, tecnicos.apellidos
    order by 
        total_ganado desc;
end;

exec mejortecnico;

-- CERTIFICACIONES POR TECNICO


create or alter proc certificaciones_tecnico
    @idtecnico numeric(12)
as
begin
    select 
        certificaciones.codcertificacion,
        certificaciones.fecha_certificacion,
        especialidad.codespecialidad,
        certificaciones.nombre_certificacion,
        certificaciones.descrip_certificacion
    from 
        certificaciones
    inner join tecnicos on certificaciones.idtecnico = tecnicos.idtecnico
    inner join especialidad on certificaciones.codespecialidad = especialidad.codespecialidad
    where 
        tecnicos.idtecnico = @idtecnico;
end;

exec certificaciones_tecnico 2012387451;


