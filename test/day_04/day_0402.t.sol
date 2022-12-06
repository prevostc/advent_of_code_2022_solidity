// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import "../../src/day_04/Day0402.sol";

contract Day0402Test is Test {
    Day0402 public day04;

    function setUp() public {
        day04 = new Day0402();
    }

    function test_Day0402_Example1() public {
        string memory input = vm.readFile("./test/day_04/example.txt");
        uint256 answer = day04.answer(input);
        assertEq(answer, 4);
    }

    function test_Day0402_MainChallenge() public {
        string memory input = vm.readFile("./test/day_04/main_input.txt");
        uint256 answer = day04.answer(input);
        console.log("answer", answer);
        assertEq(true, true); // no spoilers
    }
}
