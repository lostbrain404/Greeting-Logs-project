# GreeterLog

A simple Ethereum smart contract that allows users to store and retrieve personalized greeting messages. Each greeting is recorded on-chain and can be viewed anytime. Users must pay a small fee (at least 1 gwei) to add a greeting.

## 🚀 Features

- Store custom names per user address.
- Retrieve a greeting like: `Hello ,AliceBob`.
- Emits events for each greeting submitted.
- Verifiable and transparent on Etherscan.

## 🔧 Smart Contract

### Contract Name: `GreeterLog`

### Functions

#### `sayHello(string name) external payable`

- Appends the given `name` to the sender's stored name string.
- Requires a payment of at least **1 gwei**.
- Emits a `log` event with sender address and name.

#### `DisplayList() external view returns (string)`

- Returns a string like `Hello ,<concatenated names>` for the sender.
- Read-only view function.

### Events

#### `log(address indexed from, string indexed name)`

- Triggered every time a user calls `sayHello`.

## 💡 Example

```solidity
// Alice calls
sayHello("Alice"); // sends >= 1 gwei
// Then Bob calls
sayHello("Bob");

// When Alice calls:
DisplayList(); // returns: "Hello ,Alice"
