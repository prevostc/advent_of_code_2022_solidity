// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import "../../src/day_05/Day0502.sol";

contract Day0502Test is Test {
    Day0502 public day05;

    function setUp() public {
        day05 = new Day0502();
    }

    function test_Day0502_Example1() public {
        string memory input = vm.readFile("./test/day_05/example.txt");
        string memory answer = day05.answer(input);
        assertEq(answer, "MCD");
    }

    function test_Day0502_MainChallenge() public {
        string memory input = vm.readFile("./test/day_05/main_input.txt");
        string memory answer = day05.answer(input);
        console.log("answer", answer);
        assertEq(true, true); // no spoilers
    }
}
