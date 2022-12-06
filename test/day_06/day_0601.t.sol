// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console2.sol";
import "forge-std/Test.sol";
import "../../src/day_06/Day0601.sol";

contract Day0601Test is Test {
    Day0601 public day06;

    function setUp() public {
        day06 = new Day0601();
    }

    function test_Day0601_Example1() public {
        assertEq(day06.answer("mjqjpqmgbljsphdztnvjfqwrcgsmlb"), 7);
    }

    function test_Day0601_Example2() public {
        assertEq(day06.answer("bvwbjplbgvbhsrlpgdmjqwftvncz"), 5);
    }

    function test_Day0601_Example3() public {
        assertEq(day06.answer("nppdvjthqldpwncqszvftbrmjlhg"), 6);
    }

    function test_Day0601_Example4() public {
        assertEq(day06.answer("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg"), 10);
    }

    function test_Day0601_Example5() public {
        assertEq(day06.answer("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw"), 11);
    }

    function test_Day0601_MainChallenge() public {
        string memory input = vm.readFile("./test/day_06/main_input.txt");
        uint256 answer = day06.answer(input);
        console2.log("answer", answer);
        assertEq(true, true); // no spoilers
    }
}
