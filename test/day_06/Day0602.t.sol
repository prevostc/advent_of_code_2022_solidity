// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {console2, Test} from "forge-std/Test.sol";
import "../../src/day_06/Day0602.sol";

contract Day0602Test is Test {
    Day0602 public day06;

    function setUp() public {
        day06 = new Day0602();
    }

    function test_Day0602_Example1() public {
        assertEq(day06.answer("mjqjpqmgbljsphdztnvjfqwrcgsmlb"), 19);
    }

    function test_Day0602_Example2() public {
        assertEq(day06.answer("bvwbjplbgvbhsrlpgdmjqwftvncz"), 23);
    }

    function test_Day0602_Example3() public {
        assertEq(day06.answer("nppdvjthqldpwncqszvftbrmjlhg"), 23);
    }

    function test_Day0602_Example4() public {
        assertEq(day06.answer("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg"), 29);
    }

    function test_Day0602_Example5() public {
        assertEq(day06.answer("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw"), 26);
    }

    function test_Day0602_MainChallenge() public {
        string memory input = vm.readFile("./test/day_06/main_input.txt");
        uint256 answer = day06.answer(input);
        console2.log("answer", answer);
        assertEq(true, true); // no spoilers
    }
}
