// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import "../../src/day_{NUM}/Day{NUM}02.sol";

contract Day{NUM}02Test is Test {
    Day{NUM}02 public day{NUM};

    function setUp() public {
        day{NUM} = new Day{NUM}02();
    }

    function test_Day{NUM}02_Example1() public {
        string memory input = vm.readFile("./test/day_{NUM}/example.txt");
        {TANS} answer = day{NUM}.answer(input);
        assertEq(answer, 15);
    }

    function test_Day{NUM}02_MainChallenge() public {
        string memory input = vm.readFile("./test/day_{NUM}/main_input.txt");
        {TANS} answer = day{NUM}.answer(input);
        console.log("answer", answer);
        assertEq(true, true); // no spoilers
    }
}
