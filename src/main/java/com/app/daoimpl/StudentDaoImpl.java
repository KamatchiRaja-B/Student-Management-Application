package com.app.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.app.dao.StudentDao;
import com.app.model.Student;
import com.app.utility.DbConnection;

public class StudentDaoImpl implements StudentDao {
    
    private Connection con = null;
    private PreparedStatement pstmt = null;
    private ResultSet res = null;
    private Statement stmt = null;
    private List<Student> studentsList = new ArrayList<Student>();
    private Student student = null;
    
    private static final String INSERT_QUERY = "INSERT INTO student (univId, name, email, branch, address) VALUES (?, ?, ?, ?, ?)";
    private static final String FETCH_BY_ID_QUERY = "SELECT * FROM student WHERE univId = ?";
    private static final String UPDATE_QUERY = "UPDATE student SET name = ?, email = ?, branch = ?, address = ? WHERE univId = ?";
    private static final String DELETE_QUERY = "DELETE FROM student WHERE univId = ?";
    private static final String FETCH_ALL_QUERY = "SELECT * FROM student";
    
    int status = 0;

    public StudentDaoImpl() {
        con  = DbConnection.getInstance().getConnection();
    }

    @Override
    public int addStudent(Student student) {
        try {
            pstmt = con.prepareStatement(INSERT_QUERY);
            pstmt.setInt(1, student.getUnivId());
            pstmt.setString(2, student.getName());
            pstmt.setString(3, student.getEmail());
            pstmt.setString(4, student.getBranch());
            pstmt.setString(5, student.getAddress());
            status = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return status;
    }

    @Override
    public Student fetchStudentById(int univId) {
        try {
            pstmt = con.prepareStatement(FETCH_BY_ID_QUERY);
            pstmt.setInt(1, univId);
            res = pstmt.executeQuery();
            if (res.next()) {
                student = new Student(
                    res.getInt("univId"),
                    res.getString("name"),
                    res.getString("email"),
                    res.getString("branch"),
                    res.getString("address")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (res != null) res.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return student;
    }

    @Override
    public int updateStudent(Student student) {
        try {
            pstmt = con.prepareStatement(UPDATE_QUERY);
            pstmt.setString(1, student.getName());
            pstmt.setString(2, student.getEmail());
            pstmt.setString(3, student.getBranch());
            pstmt.setString(4, student.getAddress());
            pstmt.setInt(5, student.getUnivId());
            status = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return status;
    }

    @Override
    public int deleteStudent(int univId) {
        try {
            pstmt = con.prepareStatement(DELETE_QUERY);
            pstmt.setInt(1, univId);
            status = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return status;
    }

    @Override
    public List<Student> fetchAllStudents() {
        try {
            stmt = con.createStatement();
            res = stmt.executeQuery(FETCH_ALL_QUERY);
            while (res.next()) {
                studentsList.add(new Student(
                    res.getInt("univId"),
                    res.getString("name"),
                    res.getString("email"),
                    res.getString("branch"),
                    res.getString("address")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (res != null) res.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return studentsList;
    }
}
