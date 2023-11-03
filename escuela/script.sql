use `escuela`;
CREATE TABLE  IF NOT EXISTS estudiante(
id_Estudiante int PRIMARY KEY,
nom_Estudiante VARCHAR(50) NOT NULL,
apellido_Estudiante VARCHAR(50) NOT NULL
);
CREATE TABLE  IF NOT EXISTS cursos(
id_Curso int PRIMARY KEY,
especialidad VARCHAR(20) NOT NULL,
profesor int ,
estudiante int NOT NULL,
FOREIGN KEY (estudiante)  REFERENCES estudiante (id_Estudiante) 
);
CREATE TABLE IF NOT EXISTS nota (
    id_estudiante int NOT NULL,
    curso_id int NOT NULL,
    profesor_Id int NOT NULL,
    FOREIGN KEY (curso_id) REFERENCES cursos (id_Curso),
    INDEX (profesor_Id)  -- Add an index on profesor_Id
);

CREATE TABLE IF NOT EXISTS profesor (
    id_Profesor int PRIMARY KEY,
    profesor VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_Profesor) REFERENCES nota (profesor_Id)
);
INSERT INTO Estudiante (`id_Estudiante`,`nom_Estudiante`,`apellido_Estudiante`)
VALUES 
(1,"Pepito","Perrote"),
(2, 'María', 'López'),
(3, 'Carlos', 'García'),
(4, 'Ana', 'Martínez'),
(5, 'Luis', 'Fernández'),
(6, 'Laura', 'Rodríguez');

INSERT INTO cursos (`id_Curso`,`especialidad`,`profesor`,`estudiante` )
VALUES 
(1,'Fisica',1,1),
(2, 'Matemáticas','2', 2),
(3, 'Historia', 3, 3),
(4, 'Inglés', 4, 4),
(5, 'Ciencias', 5, 5),
(6, 'Programación', 6, 6),
(7, 'Química', 5, 1), 
(8, 'Historia del Arte', 3,  2), 
(9, 'Inglés Avanzado', 1, 3), 
(10, 'Biología Marina', 6, 4),
(11, 'Economía', 2, 5), 
(12, 'Programación Av', 4, 6);
INSERT INTO nota (`id_estudiante`,`curso_id`,`nota`)
VALUES 
(1, 1, 90),
(2, 2, 85),
(3, 3, 88),
(4, 4, 75), 
(5, 5, 92), 
(6, 6, 87), 
(1, 7, 82), 
(2, 8, 91), 
(3, 9, 78), 
(4, 10, 94),
(5, 11, 80),
(6, 12, 89);
INSERT INTO  profesor(`id_Profesor`,`profesor`)
VALUES 
(1,'Profesor Diaz'),
(2, 'Profesor López'),
(3, 'Profesor García'),
(4, 'Profesora Martínez'),
(5, 'Profesora Rodríguez'),
(6, 'Profesor Fernández');

SELECT *  
	FROM estudiante e 
	inner JOIN cursos c on  e.id_Estudiante = c.estudiante
	inner JOIN profesor p on  c.profesor = p.id_Profesor
    where p.profesor is not null;
    
 SELECT p.profesor,count(especialidad)
	FROM profesor p
	inner JOIN cursos c on c.profesor = p.id_Profesor 
    group by p.profesor ;
    
    SELECT e.nom_Estudiante,count(especialidad)
	FROM estudiante e
	inner JOIN cursos c on c.estudiante = e.id_Estudiante 
    group by e.nom_Estudiante ;
    
    begin;
    DELETE FROM profesor WHERE id_Profesor = 1;
    
    ROLLBACK;
    SELECT * FROM profesor;
    
	begin;
    UPDATE  profesor set  profesor ='TEST Mato' where id_Profesor = 1;
        ROLLBACK;
    COMMIT;
    SELECT * FROM profesor where id_Profesor = 1;