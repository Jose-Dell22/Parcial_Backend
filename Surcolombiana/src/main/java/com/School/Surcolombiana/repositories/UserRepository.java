package com.School.Surcolombiana.repositories;
import com.School.Surcolombiana.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    // Aquí puedes agregar métodos personalizados si lo necesitas
    User findByEmail(String email); // Ejemplo: buscar por correo electrónico
}
