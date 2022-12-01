// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../../src/day_01/Day01.sol";

contract Day01Test is Test {
    Day01 public day01;

    function setUp() public {
        day01 = new Day01();
    }

    function testExample1() public {
        string memory input = "1000\n2000\n3000\n\n4000\n\n5000\n6000\n\n7000\n8000\n9000\n\n10000";
        emit log_string(input);
        uint256 answer = day01.answer(input);
        emit log_uint(answer);
        assertEq(answer, 4);
    }
}
