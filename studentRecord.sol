// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Record {

   address owner;
   
   struct studentData {
       uint256 id;
       string name;
       string class;
   }

  // Initializes msg.sender as owner
   constructor() {
       owner = msg.sender;
   }
   
  // requires owner to execute function
   modifier onlyOwner() {
       require(msg.sender == owner, "Must be contract owner");
       _;
   }

   // Creates an array of all students
   studentData[] allStudent;
   
   mapping(address => studentData) public students;

   // Initializes student struct
   function addStudent(address _address, uint256 _id, string memory _name, string memory _class) public  onlyOwner {
        studentData storage s = students[_address];
        s.id = _id;
        s.name = _name;
        s.class = _class;

        // Pushes student to student array above
        allStudent.push(s);
   }

   // Get data of student address inputed
   function getStudent(address _address) public view returns (studentData memory) {
      return students[_address];
   }

   // Gets all students in array
   function getAllStudents() external view returns (studentData[] memory) {
       return allStudent;
   }

   // Updates student 
   function updateStudent(address _address, uint256 _id, string memory _name, string memory _class) public  onlyOwner {
        studentData storage s = students[_address];
        s.id = _id;
        s.name = _name;
        s.class = _class;

        allStudent.push(s);
   }

   // Deletes student
   function clearStudentData() public {
       delete allStudent;
   }

}