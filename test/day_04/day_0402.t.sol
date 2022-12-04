// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console2.sol";
import "forge-std/Test.sol";
import "../../src/day_04/Day0402.sol";

contract Day0402Test is Test {
    Day0402 public day04;

    function setUp() public {
        day04 = new Day0402();
    }

    function test_Day0402_Example1() public {
        string memory input = "";
        emit log_string(input);
        uint256 answer = day04.answer(input);
        emit log_uint(answer);
        assertEq(answer, 15);
    }

    function test_Day0402_MainChallenge() public {
        string memory input = "";
        //emit log_string(input);
        uint256 answer = day04.answer(input);
        console2.log("answer", answer);
        assertEq(true, true); // no spoilers
    }
}
