// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import "../../src/day_09/Day0902.sol";

contract Day0902Test is Test {
    Day0902 public day09;

    function setUp() public {
        day09 = new Day0902();
    }

    function test_Day0902_Example1() public {
        string memory input = vm.readFile("./test/day_09/example.txt");
        uint256 answer = day09.answer(input);
        assertEq(answer, 15);
    }

    function test_Day0902_MainChallenge() public {
        string memory input = vm.readFile("./test/day_09/main_input.txt");
        uint256 answer = day09.answer(input);
        console.log("answer", answer);
        assertEq(true, true); // no spoilers
    }
}
