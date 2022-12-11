// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import "../../src/day_11/Day1102.sol";

contract Day1102Test is Test {
    Day1102 public day11;

    function setUp() public {
        day11 = new Day1102();
    }

    function test_Day1102_Example1() public {
        string memory input = vm.readFile("./test/day_11/example.txt");
        day11.init(input);
        for (uint256 i = 0; i < 10000; i++) {
            console2.log("step %s", i);
            day11.step();
        }
        uint256 answer = day11.answer();
        assertEq(answer, 2713310158);
    }

    function test_Day1102_MainChallenge() public {
        string memory input = vm.readFile("./test/day_11/main_input.txt");
        day11.init(input);
        for (uint256 i = 0; i < 10000; i++) {
            console2.log("step %s", i);
            day11.step();
        }
        uint256 answer = day11.answer();
        console.log("answer", answer);
        assertEq(true, true); // no spoilers
    }
}
