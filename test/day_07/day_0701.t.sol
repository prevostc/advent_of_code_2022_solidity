// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import "../../src/day_07/Day0701.sol";

contract Day0701Test is Test {
    Day0701 public day07;

    function setUp() public {
        day07 = new Day0701();
    }

    function test_Day0701_Example1() public {
        string memory input = vm.readFile("./test/day_07/example.txt");
        uint256 answer = day07.answer(input);
        assertEq(answer, 95437);
    }

    function test_Day0701_MainChallenge() public {
        string memory input = vm.readFile("./test/day_07/main_input.txt");
        uint256 answer = day07.answer(input);
        console.log("answer", answer);
        assertEq(true, true); // no spoilers
    }
}
