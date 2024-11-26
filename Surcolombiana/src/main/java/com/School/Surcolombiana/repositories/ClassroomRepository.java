package com.School.Surcolombiana.repositories;
import com.School.Surcolombiana.models.Classroom;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ClassroomRepository extends JpaRepository<Classroom, Long> {
    // Aquí puedes agregar métodos personalizados si lo necesitas
    Classroom findByName(String name); // Ejemplo: buscar por nombre del aula
}
