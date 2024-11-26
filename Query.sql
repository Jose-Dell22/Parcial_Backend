--Creación roles
CREATE ROLE rector;
CREATE ROLE teacher;
CREATE ROLE student;

-- Tabla de usuarios
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Tabla de salones
CREATE TABLE classrooms (
    id SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL
);

-- Tabla de asignaturas
CREATE TABLE subjects (
    id SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    description VARCHAR(100) NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    classroom_id INT NOT NULL,
    teacher_id INT NOT NULL,
    FOREIGN KEY (classroom_id) REFERENCES classrooms(id),
    FOREIGN KEY (teacher_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Tabla de inscripciones (solo para estudiantes)
CREATE TABLE enrollments (
    id SERIAL PRIMARY KEY,
    student_id INT NOT NULL,
    subject_id INT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (subject_id) REFERENCES subjects(id) ON DELETE CASCADE
);

--otorgar permisos
GRANT SELECT, INSERT, UPDATE, DELETE ON users TO rector;
GRANT SELECT, INSERT, UPDATE, DELETE ON classrooms TO rector;
GRANT SELECT, INSERT, UPDATE, DELETE ON subjects TO rector;
GRANT SELECT, INSERT, UPDATE, DELETE ON enrollments TO rector;

GRANT SELECT ON subjects TO teacher;
GRANT SELECT ON enrollments TO teacher;
GRANT UPDATE (start_time, end_time) ON subjects TO teacher;

GRANT SELECT ON subjects TO student;
GRANT SELECT ON classrooms TO student;
GRANT SELECT ON enrollments TO student;

--Datos aleatorios
-- Insertar usuarios (roles rector, teacher y student)
INSERT INTO users (first_name, last_name, email, password)
VALUES
('Ana', 'Rodriguez', 'ana.rodriguez@school.com', 'password123'), -- Rector
('Luis', 'Garcia', 'luis.garcia@school.com', 'password123'),     -- Teacher
('Maria', 'Lopez', 'maria.lopez@school.com', 'password123'),     -- Student
('Carlos', 'Perez', 'carlos.perez@school.com', 'password123'),   -- Teacher
('Laura', 'Fernandez', 'laura.fernandez@school.com', 'password123'); -- Student

-- Insertar salones
INSERT INTO classrooms (name)
VALUES
('Room 101'),
('Lab A'),
('Room 202'),
('Lab B');

-- Insertar asignaturas
INSERT INTO subjects (name, description, start_time, end_time, classroom_id, teacher_id)
VALUES
('Mathematics', 'Introduction to Algebra and Geometry.', '08:00:00', '09:30:00', 1, 2),
('Physics', 'Basic concepts of motion and energy.', '10:00:00', '11:30:00', 2, 2),
('Chemistry', 'Introduction to Chemistry.', '12:00:00', '13:30:00', 2, 4),
('History', 'World History from 1800.', '14:00:00', '15:30:00', 3, 4),
('Biology', 'Introduction to Cellular Biology.', '16:00:00', '17:30:00', 4, 2);

-- Insertar inscripciones (estudiantes en asignaturas)
INSERT INTO enrollments (student_id, subject_id)
VALUES
(3, 1), -- Maria Lopez en Mathematics
(3, 2), -- Maria Lopez en Physics
(5, 3), -- Laura Fernandez en Chemistry
(5, 4), -- Laura Fernandez en History
(3, 5); -- Maria Lopez en Biology


