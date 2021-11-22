// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.6;

import "ds-test/test.sol";

import "./SmartContractExercise.sol";

contract SmartContractExerciseTest is DSTest {
    SmartContractExercise exercise;

    function setUp() public {
        exercise = new SmartContractExercise();
    }

    function testFail_basic_sanity() public {
        assertTrue(false);
    }

    function test_basic_sanity() public {
        assertTrue(true);
    }
}
