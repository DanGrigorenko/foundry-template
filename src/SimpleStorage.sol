// I'm a comment!
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.25;

// pragma solidity ^0.8.0;
// pragma solidity >=0.8.0 <0.9.0;

import { ISimpleStorage } from "./interfaces/ISimpleStorage.sol";

contract SimpleStorage is ISimpleStorage {
    Person[] public listOfPeople;

    uint256 private _myFavoriteNumber;

    mapping(string name => uint256 number) public nameToFavoriteNumber;

    function store(uint256 favoriteNumber_) external override {
        _myFavoriteNumber = favoriteNumber_;
    }

    function addPerson(string memory name_, uint256 favoriteNumber_) external override {
        listOfPeople.push(Person(favoriteNumber_, name_));
        nameToFavoriteNumber[name_] = favoriteNumber_;
    }

    function retrieve() external view override returns (uint256) {
        return _myFavoriteNumber;
    }
}
