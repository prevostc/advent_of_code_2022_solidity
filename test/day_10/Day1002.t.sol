// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import "../../src/day_10/Day1002.sol";

contract Day1002Test is Test {
    Day1002 public day10;

    function setUp() public {
        day10 = new Day1002();
    }

    function test_Day1002_Example1() public {
        string memory input = vm.readFile("./test/day_10/example.txt");
        string memory answer = day10.answer(input);
        assertEq(
            answer,
            "##..##..##..##..##..##..##..##..##..##..\n" "###...###...###...###...###...###...###.\n"
            "####....####....####....####....####....\n" "#####.....#####.....#####.....#####.....\n"
            "######......######......######......####\n" "#######.......#######.......#######.....\n"
        );
    }

    function test_Day1002_MainChallenge() public {
        string memory input = vm.readFile("./test/day_10/main_input.txt");
        string memory answer = day10.answer(input);
        console2.log(answer);
        assertEq(true, true); // no spoilers
    }
}
