package com.School.Surcolombiana.repositories;
import com.School.Surcolombiana.models.Classroom;
import com.School.Surcolombiana.models.Subject;
import com.School.Surcolombiana.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SubjectRepository extends JpaRepository<Subject, Long> {
    List<Subject> findByTeacher(User teacher); // Ejemplo: buscar asignaturas por profesor
    List<Subject> findByClassroom(Classroom classroom); // Ejemplo: buscar asignaturas por aula
}
