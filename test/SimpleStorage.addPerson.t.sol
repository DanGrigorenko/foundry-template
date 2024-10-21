// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.25;

import { Test } from "forge-std/Test.sol";
import { SimpleStorage } from "../src/SimpleStorage.sol";

contract SimpleStorageTest is Test {
    SimpleStorage public simpleStorage;

    function setUp() public {
        simpleStorage = new SimpleStorage();
    }

    function testAddPerson() public {
        simpleStorage.addPerson("Mark", 20);
        assertEq(simpleStorage.nameToFavoriteNumber("Mark"), 20);
    }
}
