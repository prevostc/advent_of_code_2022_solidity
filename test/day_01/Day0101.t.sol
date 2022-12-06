// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import "../../src/day_01/Day0101.sol";

contract Day01Test is Test {
    Day0101 public day01;

    function setUp() public {
        day01 = new Day0101();
    }

    function test_Day0101_Example1() public {
        string memory input = vm.readFile("./test/day_01/example.txt");
        uint256 answer = day01.answer(input);
        assertEq(answer, 24000);
    }

    function test_Day0101_MainChallenge() public {
        string memory input = vm.readFile("./test/day_01/main_input.txt");
        uint256 answer = day01.answer(input);
        console.log("answer", answer);
        assertEq(true, true); // no spoilers
    }
}
