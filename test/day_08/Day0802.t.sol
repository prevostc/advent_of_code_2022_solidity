// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import "../../src/day_08/Day0802.sol";

contract Day0802Test is Test {
    Day0802 public day08;

    function setUp() public {
        day08 = new Day0802();
    }

    function test_Day0802_Example1() public {
        string memory input = vm.readFile("./test/day_08/example.txt");
        uint256 answer = day08.answer(input);
        assertEq(answer, 8);
    }

    function test_Day0802_MainChallenge() public {
        string memory input = vm.readFile("./test/day_08/main_input.txt");
        uint256 answer = day08.answer(input);
        console.log("answer", answer);
        assertEq(true, true); // no spoilers
    }
}
