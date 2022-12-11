// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import "../../src/day_11/Day1101.sol";

contract Day1101Test is Test {
    Day1101 public day11;

    function setUp() public {
        day11 = new Day1101();
    }

    function test_Day1101_Example1() public {
        string memory input = vm.readFile("./test/day_11/example.txt");
        day11.init(input);
        for (uint256 i = 0; i < 20; i++) {
            console2.log("step %s", i);
            day11.step();
        }
        uint256 answer = day11.answer();
        assertEq(answer, 10605);
    }

    function test_Day1101_MainChallenge() public {
        string memory input = vm.readFile("./test/day_11/main_input.txt");
        day11.init(input);
        for (uint256 i = 0; i < 20; i++) {
            day11.step();
        }
        uint256 answer = day11.answer();
        console.log("answer", answer);
        assertEq(true, true); // no spoilers
    }
}
