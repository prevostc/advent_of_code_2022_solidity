// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import "../../src/day_02/Day0201.sol";

contract Day02Test is Test {
    Day0201 public day02;

    function setUp() public {
        day02 = new Day0201();
    }

    function test_Day0201_Example1() public {
        string memory input = vm.readFile("./test/day_02/example.txt");
        uint256 answer = day02.answer(input);
        assertEq(answer, 15);
    }

    function test_Day0201_MainChallenge() public {
        string memory input = vm.readFile("./test/day_02/main_input.txt");
        uint256 answer = day02.answer(input);
        console.log("answer", answer);
        assertEq(true, true); // no spoilers
    }
}
