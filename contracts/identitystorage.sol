// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IdentityStorage {
    struct User {
        string name;
        string faceHash; // Encrypted facial recognition hash
        bool isVerified;
    }

    mapping(address => User) private users; // Made private for security

    event IdentityRegistered(address indexed user, string name, string faceHash);
    event IdentityVerified(address indexed user);

    function registerIdentity(string memory _name, string memory _faceHash) public {
        require(bytes(users[msg.sender].name).length == 0, "User already registered");
        users[msg.sender] = User(_name, _faceHash, false);
        emit IdentityRegistered(msg.sender, _name, _faceHash);
    }

    function verifyIdentity() public {
        require(bytes(users[msg.sender].name).length > 0, "User not registered");
        users[msg.sender].isVerified = true;
        emit IdentityVerified(msg.sender);
    }

    function getIdentity(address _user) public view returns (string memory name, string memory faceHash, bool isVerified) {
        require(bytes(users[_user].name).length > 0, "User not registered");
        User memory user = users[_user];
        return (user.name, user.faceHash, user.isVerified);
    }
}
