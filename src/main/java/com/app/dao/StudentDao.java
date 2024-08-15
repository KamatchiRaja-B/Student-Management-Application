package com.app.dao;

import java.util.List;

import com.app.model.Student;

public interface StudentDao {
	int addStudent(Student student);

	Student fetchStudentById(int univId);

	int updateStudent(Student student);

	int deleteStudent(int univId);

	List<Student> fetchAllStudents();
}
