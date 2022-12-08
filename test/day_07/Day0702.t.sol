// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import "../../src/day_07/Day0702.sol";

contract Day0702Test is Test {
    Day0702 public day07;

    function setUp() public {
        day07 = new Day0702();
    }

    function test_Day0702_Example1() public {
        string memory input = vm.readFile("./test/day_07/example.txt");
        uint256 answer = day07.answer(input);
        assertEq(answer, 24933642);
    }

    function test_Day0702_MainChallenge() public {
        string memory input = vm.readFile("./test/day_07/main_input.txt");
        uint256 answer = day07.answer(input);
        console.log("answer", answer);
        assertEq(true, true); // no spoilers
    }
}
