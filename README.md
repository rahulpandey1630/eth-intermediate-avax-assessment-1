
# Eth-Intermediate-avax assessment 



This smart contract demonstrates the use of Solidity's require(), assert(), and revert() statements for error handling.


// SPDX-License-Identifier: MIT


pragma solidity ^0.8.0;

contract ErrorHandlingDemo {
    
   // SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArmyManagementSystem {
    address public officer;

    struct Soldier {
        uint soldierId;
        string name;
        bool isAssigned; // Indicates if a soldier is currently on a mission
        uint missionId; // The ID of the mission assigned to the soldier
    }

    struct Mission {
        uint missionId;
        string missionName;
        bool isCompleted;
    }

    mapping(uint => Soldier) public soldiers; // Soldier mapping by soldier ID
    mapping(uint => Mission) public missions; // Mission mapping by mission ID

    modifier onlyOfficer() {
        // Ensure that only the officer (contract deployer) can perform certain actions
        require(msg.sender == officer, "Only the officer can perform this action.");
        _;
    }

    constructor() {
        officer = msg.sender;  // Set the contract deployer as the officer
    }

    // Function to register a new soldier (only officer can do this)
    function registerSoldier(uint soldierId, string memory name) public onlyOfficer {
        // Use require to ensure the soldier isn't already registered
        require(!soldiers[soldierId].isAssigned, "Soldier is already registered.");
        // Register the new soldier
        soldiers[soldierId] = Soldier(soldierId, name, false, 0);
    }

    // Function to add a new mission (only officer can do this)
    function addMission(uint missionId, string memory missionName) public onlyOfficer {
        // Use require to ensure the mission doesn't already exist
        require(!missions[missionId].isCompleted, "Mission already exists.");
        // Add the mission
        missions[missionId] = Mission(missionId, missionName, false);
    }

    // Assign a soldier to a mission (only officer can assign)
    function assignMission(uint soldierId, uint missionId) public onlyOfficer {
        Soldier storage soldier = soldiers[soldierId];
        Mission storage mission = missions[missionId];
        
        // Ensure that the soldier is not already assigned to a mission
        require(!soldier.isAssigned, "Soldier is already assigned to a mission.");
        // Ensure that the mission exists and is not completed
        require(!mission.isCompleted, "Mission is already completed.");

        // Assign the mission to the soldier
        soldier.isAssigned = true;
        soldier.missionId = missionId;
    }

    // Soldier completes the mission
    function completeMission(uint soldierId) public {
        Soldier storage soldier = soldiers[soldierId];
        Mission storage mission = missions[soldier.missionId];

        // Ensure that the soldier is currently assigned to a mission
        require(soldier.isAssigned, "Soldier is not assigned to any mission.");
        
        // If the mission is already completed, use revert
        if (mission.isCompleted) {
            revert("Mission has already been completed."); 
        }

        // Mark the mission as completed
        mission.isCompleted = true;
        soldier.isAssigned = false;

        // Use assert to ensure that the soldier is no longer assigned to the mission
        assert(soldier.isAssigned == false); 
    }

    // View soldier's mission status
    function viewMissionStatus(uint soldierId) public view returns (string memory) {
        Soldier storage soldier = soldiers[soldierId];
        Mission storage mission = missions[soldier.missionId];

        // Ensure the soldier is assigned to a mission before viewing the status
        require(soldier.isAssigned, "Soldier is not assigned to a mission.");
        
        return mission.isCompleted ? "Mission Completed" : "Mission In Progress";
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

