// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Test} from "forge-std/Test.sol";
import {SimpleStorage} from "../src/SimpleStorage.sol";

contract SimpleStorageTest is Test {
    SimpleStorage simpleStorage;

    function setUp() external returns (SimpleStorage) {
        simpleStorage = new SimpleStorage();
        return simpleStorage;
    }

    /**
     * TESTS
     */
    function test_store() external {
        simpleStorage.store(42);
        uint256 result = simpleStorage.retrieve();
        assertEq(result, 42);
    }

    function test_addPerson() external {
        simpleStorage.addPerson("Alice", 42);
        simpleStorage.addPerson("Bob", 43);
        (uint256 favoriteNumber,) = simpleStorage.listOfPeople(0);
        assertEq(favoriteNumber, 42);
        (favoriteNumber,) = simpleStorage.listOfPeople(1);
        assertEq(favoriteNumber, 43);
        assertEq(simpleStorage.nameToFavoriteNumber("Alice"), 42);
        assertEq(simpleStorage.nameToFavoriteNumber("Bob"), 43);
    }

    function test_retrieve() external {
        simpleStorage.store(42);
        uint256 result = simpleStorage.retrieve();
        assertEq(result, 42);
    }
}
