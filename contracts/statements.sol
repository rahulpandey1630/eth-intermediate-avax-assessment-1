// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ErrorHandlingDemo {

    //State variables
    uint256 public storedNumber;
    address public owner;

    // Constructor to set the contract owner
    constructor() {
        owner = msg.sender;
    }

    // Function to set a number greater than 100 using require()
    function setNumber(uint256 _number) public {
        // Require that the number must be greater than 100
        require(_number > 100, "Number must be greater than 100");
        storedNumber = _number;
    }

    // Function to perform a safe multiplication using assert()
    function safeMultiply(uint256 a, uint256 b) public pure returns (uint256) {
        uint256 result = a * b;
        // Assert that there is no overflow
        assert(result / a == b);
        return result;
    }

    //Function to check if the caller is the owner, using revert()
    function onlyOwnerCanCall() public view {
        // Check if the caller is the owner, if not revert the transaction
        if (msg.sender != owner) {
            revert("Caller is not the owner");
        }
    }
}