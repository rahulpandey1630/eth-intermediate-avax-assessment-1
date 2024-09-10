// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SchoolGradingSystem {
    address public teacher;
    
    struct Student {
        uint studentId;
        string name;
        uint grade;
        bool isRegistered;
    }

    mapping(uint => Student) public students;

    modifier onlyTeacher() {
        require(msg.sender == teacher, "Only teacher can perform this action.");
        _;
    }

    constructor() {
        teacher = msg.sender; // Assign the contract deployer as the teacher
    }

    function addStudent(uint studentId, string memory name) public onlyTeacher {
        require(!students[studentId].isRegistered, "Student already registered.");
        students[studentId] = Student(studentId, name, 0, true);
    }

    function assignGrade(uint studentId, uint grade) public onlyTeacher {
        require(students[studentId].isRegistered, "Student not registered.");
        require(grade >= 0 && grade <= 100, "Grade must be between 0 and 100.");
        students[studentId].grade = grade;
    }

    function getGrades(uint studentId) public view returns (uint) {
        require(students[studentId].isRegistered, "Student not registered.");
        return students[studentId].grade;
    }

    function updateGrade(uint studentId, uint newGrade) public onlyTeacher {
        require(students[studentId].isRegistered, "Student not registered.");
        require(newGrade >= 0 && newGrade <= 100, "Grade must be between 0 and 100.");
        students[studentId].grade = newGrade;
        assert(students[studentId].grade == newGrade); // Ensure grade is updated
    }
}
