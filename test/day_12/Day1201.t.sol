// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import "../../src/day_12/Day1201.sol";

contract Day1201Test is Test {
    Day1201 public day12;

    function setUp() public {
        day12 = new Day1201();
    }

    function test_Day1201_Example1() public {
        string memory input = vm.readFile("./test/day_12/example.txt");
        day12.init(input);
        uint256 maxSteps = 50;
        while (!day12.step()) {
            maxSteps--;
            if (maxSteps == 0) {
                break;
            }
        }
        uint256 answer = day12.answer();
        assertEq(answer, 31);
    }

    function test_Day1201_MainChallenge() public {
        string memory input = vm.readFile("./test/day_12/main_input.txt");
        day12.init(input);
        uint256 maxSteps = 1000;
        while (!day12.step()) {
            maxSteps--;
            if (maxSteps == 0) {
                break;
            }
        }
        uint256 answer = day12.answer();
        console.log("answer", answer);
        assertEq(true, true); // no spoilers
    }
}
