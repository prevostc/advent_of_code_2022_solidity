// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import "../../src/day_02/Day0202.sol";

contract Day02Test is Test {
    Day0202 public day02;

    function setUp() public {
        day02 = new Day0202();
    }

    function test_Day0202_Example1() public {
        string memory input = vm.readFile("./test/day_02/example.txt");
        uint256 answer = day02.answer(input);
        assertEq(answer, 12);
    }

    function test_Day0202_MainChallenge() public {
        string memory input = vm.readFile("./test/day_02/main_input.txt");
        uint256 answer = day02.answer(input);
        console.log("answer", answer);
        assertEq(true, true); // no spoilers
    }
}
