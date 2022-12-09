// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import "../../src/day_09/Day0901.sol";
import {StringLib} from "../../src/StringLib.sol";

contract Day0901Test is Test {
    using StringLib for string;

    Day0901 public day09;

    function setUp() public {
        day09 = new Day0901();
    }

    function test_Day0901_Example1() public {
        string memory input = vm.readFile("./test/day_09/example.txt");
        string[] memory lines = input.split("\n");
        for (uint256 i = 0; i < lines.length; i++) {
            day09.answerStep(lines[i]);
        }
        uint256 answer = day09.answer();
        assertEq(answer, 13);
    }

    function test_Day0901_MainChallenge() public {
        string memory input = vm.readFile("./test/day_09/main_input.txt");
        string[] memory lines = input.split("\n");
        for (uint256 i = 0; i < lines.length; i++) {
            day09.answerStep(lines[i]);
        }
        uint256 answer = day09.answer();
        console2.log("Day 09.1 answer: %s", answer);
        assertEq(true, true); // no spoilers
    }
}
