package com.School.Surcolombiana.service;

import com.School.Surcolombiana.models.Subject;
import com.School.Surcolombiana.repositories.SubjectRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class SubjectService {
    @Autowired
    private SubjectRepository subjectRepository;

    // Crear una nueva asignatura
    public Subject createSubject(Subject subject) {
        return subjectRepository.save(subject);
    }

    // Obtener todas las asignaturas
    public List<Subject> getAllSubjects() {
        return subjectRepository.findAll();
    }

    // Obtener una asignatura por ID
    public Optional<Subject> getSubjectById(Long id) {
        return subjectRepository.findById(id);
    }

    // Actualizar una asignatura
    public Subject updateSubject(Long id, Subject subjectDetails) {
        // Verificar si la asignatura existe
        Subject subject = subjectRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Subject not found"));
        return subjectRepository.save(subject);
    }

    // Eliminar una asignatura
    public void deleteSubject(Long id) {
        subjectRepository.deleteById(id);
    }
}
