// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console2.sol";
import "forge-std/Test.sol";
import "../../src/day_{NUM}/Day{NUM}01.sol";

contract Day{NUM}Test is Test {
    Day{NUM}01 public day{NUM};

    function setUp() public {
        day{NUM} = new Day{NUM}01();
    }

    function test_Day{NUM}01_Example1() public {
        string memory input = "";
        emit log_string(input);
        {TANS} answer = day{NUM}.answer(input);
        emit log_uint(answer);
        assertEq(answer, 15);
    }

    function test_Day{NUM}01_MainChallenge() public {
        string memory input = "";
        //emit log_string(input);
        {TANS} answer = day{NUM}.answer(input);
        console2.log("answer", answer);
        assertEq(true, true); // no spoilers
    }
}
