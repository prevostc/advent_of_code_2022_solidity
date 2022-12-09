// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import "../../src/day_09/Day0902.sol";
import {StringLib} from "../../src/StringLib.sol";

contract Day0902Test is Test {
    using StringLib for string;

    Day0902 public day09;

    function setUp() public {
        day09 = new Day0902();
    }

    function test_Day0902_Example1() public {
        string memory input = vm.readFile("./test/day_09/example.txt");
        string[] memory lines = input.split("\n");
        for (uint256 i = 0; i < lines.length; i++) {
            day09.answerStep(lines[i]);
        }
        uint256 answer = day09.answer();
        assertEq(answer, 1);
    }

    function test_Day0902_Example2() public {
        string memory input = vm.readFile("./test/day_09/example2.txt");
        string[] memory lines = input.split("\n");
        for (uint256 i = 0; i < lines.length; i++) {
            day09.answerStep(lines[i]);
        }
        uint256 answer = day09.answer();
        assertEq(answer, 36);
    }

    function test_Day0902_MainChallenge() public {
        string memory input = vm.readFile("./test/day_09/main_input.txt");
        string[] memory lines = input.split("\n");
        for (uint256 i = 0; i < lines.length; i++) {
            day09.answerStep(lines[i]);
        }
        uint256 answer = day09.answer();
        console.log("answer", answer);
        assertEq(true, true); // no spoilers
    }
}
