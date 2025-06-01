// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

/// @title A simple greeting contract with logging and persistent message storage.
/// @author ...
/// @notice You can use this contract to save your name and receive a greeting.
/// @dev Stores strings per address in a mapping and emits events on update.
contract test {

    /// @notice Emitted when a user sends a greeting.
    /// @param from The address that sent the greeting.
    /// @param name The name included in the greeting.
    event log(address indexed from, string indexed name);

    /// @notice Stores the names associated with each address.
    /// @dev A single string value per user, appended on every call to `sayHello`.
    mapping(address => string) public list;

    /// @notice Send a greeting with your name (costs at least 1 gwei).
    /// @dev Appends the new name to the caller's list value and emits an event.
    /// @param name The name to include in the greeting.
    function sayHello(string memory name) external payable {
        require(msg.value >= 1 gwei, "Invalid amount");

        list[msg.sender] = string(abi.encodePacked(list[msg.sender], name));

        emit log(msg.sender, name);
    }

    /// @notice Retrieve your stored greeting string.
    /// @dev Returns "Hello ,<your names concatenated>".
    /// @return A personalized greeting message.
    function DisplayList() external view returns (string memory) {
        return string(abi.encodePacked("Hello ,", list[msg.sender]));
    }
}
