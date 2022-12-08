// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import "../../src/day_08/Day0801.sol";

contract Day0801Test is Test {
    Day0801 public day08;

    function setUp() public {
        day08 = new Day0801();
    }

    function test_Day0801_Example1() public {
        string memory input = vm.readFile("./test/day_08/example.txt");
        uint256 answer = day08.answer(input);
        assertEq(answer, 21);
    }

    function test_Day0801_MainChallenge() public {
        string memory input = vm.readFile("./test/day_08/main_input.txt");
        uint256 answer = day08.answer(input);
        console.log("answer", answer);
        assertEq(true, true); // no spoilers
    }
}
