// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import "../../src/day_03/Day0301.sol";

contract Day0301Test is Test {
    Day0301 public day03;

    function setUp() public {
        day03 = new Day0301();
    }

    function test_Day0301_Example1() public {
        string memory input = vm.readFile("./test/day_03/example.txt");
        uint256 answer = day03.answer(input);
        assertEq(answer, 157);
    }

    function test_Day0301_MainChallenge() public {
        string memory input = vm.readFile("./test/day_03/main_input.txt");
        uint256 answer = day03.answer(input);
        console.log("answer", answer);
        assertEq(true, true); // no spoilers
    }
}
