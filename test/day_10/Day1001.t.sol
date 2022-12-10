// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import "../../src/day_10/Day1001.sol";

contract Day1001Test is Test {
    Day1001 public day10;

    function setUp() public {
        day10 = new Day1001();
    }

    function test_Day1001_Example0() public {
        int256 answer = day10.answer("noop\naddx 3\naddx -5\n");
        assertEq(answer, 0);
    }

    function test_Day1001_Example1() public {
        string memory input = vm.readFile("./test/day_10/example.txt");
        int256 answer = day10.answer(input);
        assertEq(answer, 13140);
    }

    function test_Day1001_MainChallenge() public {
        string memory input = vm.readFile("./test/day_10/main_input.txt");
        int256 answer = day10.answer(input);
        emit log_int(answer);
        assertEq(true, true); // no spoilers
    }
}
