// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Define a contract named SchoolGradingSystem
contract SchoolGradingSystem {
    // Public variable to store the teacher's address
    address public teacher;
    
    // Structure to represent a student
    struct Student {
        uint studentId;       // Student's ID
        string name;          // Student's name
        uint grade;           // Student's grade (0-100)
        bool isRegistered;    // Boolean to check if the student is registered
    }

    // Mapping from student ID to Student structure
    mapping(uint => Student) public students;

    // Modifier to allow only the teacher to perform certain actions
    modifier onlyTeacher() {
        // Use require to check if the function caller is the teacher
        require(msg.sender == teacher, "Only teacher can perform this action.");
        _; // Continue executing the function
    }

    // Constructor that sets the contract deployer as the teacher
    constructor() {
        teacher = msg.sender; // Store the deployer's address as the teacher
    }

    // Function to add a student (can only be called by the teacher)
    function addStudent(uint studentId, string memory name) public onlyTeacher {
        // Use require to ensure the student is not already registered
        require(!students[studentId].isRegistered, "Student already registered.");
        // Add the student to the mapping with an initial grade of 0
        students[studentId] = Student(studentId, name, 0, true);
    }

    // Function to assign a grade to a student (only teacher can call)
    function assignGrade(uint studentId, uint grade) public onlyTeacher {
        // Use require to ensure the student is registered
        require(students[studentId].isRegistered, "Student not registered.");
        // Use revert if the grade is not within the valid range (0-100)
        if (grade < 0 || grade > 100) {
            revert("Grade must be between 0 and 100.");
        }
        // Assign the grade to the student
        students[studentId].grade = grade;
    }

    // Function to get a student's grade (anyone can call)
    function getGrades(uint studentId) public view returns (uint) {
        // Use require to ensure the student is registered
        require(students[studentId].isRegistered, "Student not registered.");
        // Return the student's grade
        return students[studentId].grade;
    }

    // Function to update a student's grade (only teacher can call)
    function updateGrade(uint studentId, uint newGrade) public onlyTeacher {
        // Use require to ensure the student is registered
        require(students[studentId].isRegistered, "Student not registered.");
        // Use require to ensure the new grade is within the range 0-100
        require(newGrade >= 0 && newGrade <= 100, "Grade must be between 0 and 100.");
        // Update the student's grade
        students[studentId].grade = newGrade;
        // Use assert to ensure the grade has been updated correctly
        assert(students[studentId].grade == newGrade);
    }
}
