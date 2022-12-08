// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import "../../src/day_03/Day0302.sol";

contract Day0302Test is Test {
    Day0302 public day03;

    function setUp() public {
        day03 = new Day0302();
    }

    function test_Day0302_Example1() public {
        string memory input = vm.readFile("./test/day_03/example.txt");
        uint256 answer = day03.answer(input);
        assertEq(answer, 70);
    }

    function test_Day0302_MainChallenge() public {
        string memory input = vm.readFile("./test/day_03/main_input.txt");
        uint256 answer = day03.answer(input);
        console2.log("answer", answer);
        assertEq(true, true); // no spoilers
    }
}
