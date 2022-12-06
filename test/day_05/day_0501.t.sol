// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import "../../src/day_05/Day0501.sol";

contract Day0501Test is Test {
    Day0501 public day05;

    function setUp() public {
        day05 = new Day0501();
    }

    function test_Day0501_Example1() public {
        string memory input = vm.readFile("./test/day_05/example.txt");
        string memory answer = day05.answer(input);
        assertEq(answer, "CMZ");
    }

    function test_Day0501_MainChallenge() public {
        string memory input = vm.readFile("./test/day_05/main_input.txt");
        string memory answer = day05.answer(input);
        console.log("answer", answer);
        assertEq(true, true); // no spoilers
    }
}
