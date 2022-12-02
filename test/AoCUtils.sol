// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console2.sol";
import "forge-std/Test.sol";
import "../src/AoCUtils.sol";

contract Day02Test is Test {
    function setUp() public {}

    function test_AoCUtils_stringToArray() public {
        string memory input = "A Y\nB X\nC Z";
        emit log_string(input);
        string[] memory parts = AoCUtils.stringToArray(input, "\n");
        assertEq(parts.length, 3);
        assertEq(parts[0], "A Y");
        assertEq(parts[1], "B X");
        assertEq(parts[2], "C Z");
    }
}
