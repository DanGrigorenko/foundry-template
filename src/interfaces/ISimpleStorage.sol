// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.25;

interface ISimpleStorage {
    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    function store(uint256 favoriteNumber_) external;
    function addPerson(string memory name_, uint256 favoriteNumber_) external;
    function retrieve() external view returns (uint256);
}
