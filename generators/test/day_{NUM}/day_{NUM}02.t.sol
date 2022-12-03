// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console2.sol";
import "forge-std/Test.sol";
import "../../src/day_{NUM}/Day{NUM}02.sol";

contract Day{NUM}02Test is Test {
    Day{NUM}02 public day{NUM};

    function setUp() public {
        day{NUM} = new Day{NUM}02();
    }

    function test_Day{NUM}02_Example1() public {
        string memory input = "";
        emit log_string(input);
        {TANS} answer = day{NUM}.answer(input);
        emit log_uint(answer);
        assertEq(answer, 15);
    }

    function test_Day{NUM}02_MainChallenge() public {
        string memory input = "";
        //emit log_string(input);
        {TANS} answer = day{NUM}.answer(input);
        console2.log("answer", answer);
        assertEq(true, true); // no spoilers
    }
}
