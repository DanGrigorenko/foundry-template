// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.25;

import { ICounter } from "./interfaces/ICounter.sol";

contract Counter is ICounter {
    uint256 public number;

    function setNumber(uint256 newNumber) external override {
        number = newNumber;
    }

    function increment() external override {
        number++;
    }
}
