// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;
import "@openzeppelin/contracts/access/Ownable.sol";

contract EmployeeData is Ownable {
  

//This line create a struct (employee) and its variables
struct Employee{

address accounts;    

uint salary;

string title;

string name;

uint age;
}

 
//This line create an array of structs which is the employee
Employee[] public People;

 
//This line creates a mapping, linking the arrays of structs to an address 
mapping(address => Employee[]) Employeedatabase;

//This line create a mapping that links each address to a true/false bool
mapping(address => bool) public registered;



 
//this line create an employee and then checks if the address is regsitered 
function Createemployee (uint _salary, string memory _title, string memory _name, uint _age) public {
    require (registered[msg.sender] == false,"You are already registered");
    People.push(Employee(msg.sender, _salary, _title, _name,_age));
    registered[msg.sender] = true;
}




 
//This line deletes an employee struct from the array. Only the owner can do this 
function Deleteemployee (uint i) private onlyOwner {
delete People[i];

}


//This function returns only the employee's name
function GetPersonData (uint x) public view returns (string memory _name){

Employee memory EmployeeDataReturn = People[x];
return (EmployeeDataReturn.name);

}


//This function returns all employees 
function GetAllEmployee() public view returns (Employee[] memory){  
    return People;
}

}

