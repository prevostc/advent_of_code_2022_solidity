// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {console, Test} from "forge-std/Test.sol";
import "../../src/day_01/Day0102.sol";

contract Day01Test is Test {
    Day0102 public day01;

    function setUp() public {
        day01 = new Day0102();
    }

    function test_Day0102_Example1() public {
        string memory input = vm.readFile("./test/day_01/example.txt");
        uint256 answer = day01.answer(input);
        assertEq(answer, 45000);
    }

    function test_Day0102_MainChallenge() public {
        string memory input = vm.readFile("./test/day_01/main_input.txt");
        uint256 answer = day01.answer(input);
        console.log("answer", answer);
        assertEq(true, true); // no spoilers
    }
}
