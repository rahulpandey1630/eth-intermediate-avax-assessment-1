
# ETH Proof Beginner Assignment

## Simple Overview

This project is a simple Ethereum smart contract that demonstrates basic token functionality. The contract allows for minting and burning tokens, keeping track of total supply, and maintaining individual account balances.

## Description

This project implements a basic ERC-20-like token in Solidity. The contract includes functionality to:
- Store public variables for the token name, abbreviation, and total supply.
- Map addresses to their respective account balances.
- Mint new tokens, increasing both the total supply and the balance of the specified account.
- Burn existing tokens, decreasing both the total supply and the balance of the specified account, with a check to ensure the account has enough tokens to burn.

## Getting Started

### Installing

No installation is needed for this project.

### Executing Program

#### How to Run the Program

1. **Open in Remix**: 
   - Visit [Remix IDE](https://remix.ethereum.org/).

2. **Compile**:
   - Copy and paste the contract code into a new file in Remix (e.g., `MyToken.sol`).
   - Click on the "Solidity Compiler" tab.
   - Select the compiler version `0.8.18`.
   - Click "Compile MyToken.sol".

3. **Deploy**:
   - Click on the "Deploy & Run Transactions" tab.
   - Ensure the environment is set to "JavaScript VM" (or your preferred environment).
   - Click "Deploy".

4. **Contract**:
   - After deployment, the contract instance will appear under "Deployed Contracts".
   - You can interact with the contract functions (`mintToken` and `burnToken`) from there.

### Contract Code

```solidity
// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

/*
       REQUIREMENTS
    1. Your contract will have public variables that store the details about your coin (Token Name, Token Abbrv., Total Supply)
    2. Your contract will have a mapping of addresses to accounts (address => uint)
    3. You will have a mint function that takes two parameters: an address and a value. 
       The function then increases the total supply by that number and increases the balance 
       of the “sender” address by that amount.
    4. Your contract will have a burn function, which works the opposite of the mint function, as it will destroy tokens. 
       It will take an address and value just like the mint function. It will then deduct the value from the total supply 
       and from the balance of the “sender”.
    5. Lastly, your burn function should have conditionals to make sure the balance of "sender" is greater than or equal 
       to the amount that is supposed to be burned.
*/

contract MyToken {

    // public variables here
    string  public tokenName = "Mystic Coin";
    string public tokenAbbrv  = "MC";
    uint256 public totalSupply = 0;

    // mapping variable here
    mapping (address => uint256) public accounts;

    // mint function
    function mintToken(address _address, uint256 _value) public {
        totalSupply += _value;
        accounts[_address] += _value;
    }

    // burn function
    function burnToken(address _address, uint256 _value) public {
        if (accounts[_address] >= _value) {
            totalSupply -= _value;
            accounts[_address] -= _value;
        }   
    }
}
```

## Help

### Common Problems or Issues

- **Compiler Errors**: Ensure you are using the correct Solidity version (`0.8.18`). Adjust the compiler version in Remix if necessary.
- **Transaction Errors**: Make sure the address has sufficient tokens before calling the `burnToken` function.

## Authors

- Your Name
- Contact: [Your Contact Information or GitHub Handle]

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.

---