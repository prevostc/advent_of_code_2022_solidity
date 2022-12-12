// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import "../../src/day_12/Day1202.sol";

contract Day1202Test is Test {
    Day1202 public day12;

    function setUp() public {
        day12 = new Day1202();
    }

    function test_Day1202_Example1() public {
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
        assertEq(answer, 29);
    }

    function test_Day1202_MainChallenge() public {
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
