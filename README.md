# Eth-Intermediate-avax assessment 
# Army Management System Smart Contract

This smart contract demonstrates the use of Solidity's require(), assert(), and revert() statements for error handling.
It manages soldiers and missions, allowing an officer to register soldiers, add missions, assign soldiers to missions, and mark missions as completed.

## Deployment Instructions

1. **Open Remix IDE:**
   - Go to [Remix](https://remix.ethereum.org).

2. **Create a New File:**
   - Create a new file named `ArmyManagementSystem.sol`.

3. **Paste the Contract Code:**
   - Copy the contract code and paste it into the newly created file.

4. **Compile the Contract:**
   - Click on the "Solidity Compiler" tab on the left panel.
   - Select the compiler version `0.8.0` or compatible version.
   - Click "Compile ArmyManagementSystem.sol".

5. **Deploy the Contract:**
   - Go to the "Deploy & Run Transactions" tab.
   - Set the environment to "JavaScript VM".
   - Select `ArmyManagementSystem` from the contract dropdown.
   - Click "Deploy".

## Interaction with the Contract

### `registerSoldier(soldierId, name)`

- **Description**: Registers a new soldier by the officer.
- **Example Call**: `registerSoldier(1, "John Doe")`
- **Expected Output**: Soldier with ID 1 and name "John Doe" is registered.

### `addMission(missionId, missionName)`

- **Description**: Adds a new mission to the system.
- **Example Call**: `addMission(101, "Rescue Operation")`
- **Expected Output**: Mission with ID 101 named "Rescue Operation" is added.

### `assignMission(soldierId, missionId)`

- **Description**: Assigns a soldier to a specific mission.
- **Example Call**: `assignMission(1, 101)`
- **Expected Output**: Soldier 1 is assigned to mission 101.

### `completeMission(soldierId)`

- **Description**: Marks the mission assigned to the soldier as completed.
- **Example Call**: `completeMission(1)`
- **Expected Output**: Mission assigned to Soldier 1 is marked as completed.

### `viewMissionStatus(soldierId)`

- **Description**: Views the status of the mission assigned to a soldier.
- **Example Call**: `viewMissionStatus(1)`
- **Expected Output**: Returns "Mission Completed" if completed; otherwise, "Mission In Progress".

## Error Handling Examples

- **`require` Example**:
  - **Function**: `registerSoldier`
  - **Condition**: Reverts if the soldier is already registered.
  - **Error Message**: "Soldier is already registered."

- **`revert` Example**:
  - **Function**: `completeMission`
  - **Condition**: Reverts if the mission has already been completed.
  - **Error Message**: "Mission has already been completed."

- **`assert` Example**:
  - **Function**: `completeMission`
  - **Condition**: Ensures the soldier's assignment status is correctly updated.
  - **Action**: Fails if the condition does not hold true.

## Notes

- Only the officer (contract deployer) can register soldiers, add missions, and assign missions.
- Unauthorized actions will revert with an appropriate error message, ensuring only valid operations are performed.


[MIT](https://choosealicense.com/licenses/mit/)

