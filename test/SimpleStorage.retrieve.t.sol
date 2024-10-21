// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.25;

import { Test } from "forge-std/Test.sol";
import { SimpleStorage } from "../src/SimpleStorage.sol";

contract SimpleStorageTest is Test {
    SimpleStorage public simpleStorage;

    function setUp() public {
        simpleStorage = new SimpleStorage();
    }

    function testRetrieveNumber() public {
        simpleStorage.store(1);
        assertEq(simpleStorage.retrieve(), 1);
    }
}
