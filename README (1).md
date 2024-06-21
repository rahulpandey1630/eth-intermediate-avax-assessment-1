
# Eth-Intermediate-avax assessment 



This smart contract demonstrates the use of Solidity's require(), assert(), and revert() statements for error handling.


// SPDX-License-Identifier: MIT


pragma solidity ^0.8.0;

contract ErrorHandlingDemo {
    
    uint256 public storedNumber;

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // Function to set a number greater than 100 using require()
    function setNumber(uint256 _number) public {
        require(_number > 100, "Number must be greater than 100");
        storedNumber = _number;
    }

    // Function to perform a safe multiplication using assert()
    function safeMultiply(uint256 a, uint256 b) public pure returns (uint256) {
        uint256 result = a * b;
        assert(result / a == b);
        return result;
    }

    // Function to check if the caller is the owner, using revert()
    function onlyOwnerCanCall() public view {
        if (msg.sender != owner) {
            revert("Caller is not the owner");
        }
    }
}

Usage Instructions
Deploy the Contract

Open Remix IDE.
Create a new file and paste the contract code.
Compile the contract.
Deploy the contract using an appropriate environment (e.g., JavaScript VM).
Interact with the Contract

setNumber: Call with a number > 100 to set storedNumber.
safeMultiply: Call with two numbers to get their product, ensuring no overflow.
onlyOwnerCanCall: Call to verify if the caller is the owner; reverts if not.
Example Calls
setNumber(150):

Sets storedNumber to 150.
safeMultiply(2, 3):

Returns 6.
onlyOwnerCanCall():

No error if called by the owner.
Reverts with "Caller is not the owner" if called by anyone else.
## License

[MIT](https://choosealicense.com/licenses/mit/)

