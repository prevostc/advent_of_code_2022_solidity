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

    function test_AoCUtils_printBinary() public {
        assertEq(
            AoCUtils.toBinaryRepresentation(AoCUtils.uint32ToBytes(uint32(0x00000000))),
            "0b00000000000000000000000000000000"
        );

        assertEq(
            AoCUtils.toBinaryRepresentation(AoCUtils.uint32ToBytes(uint32(0x000000F0))),
            "0b00000000000000000000000011110000"
        );
        assertEq(
            AoCUtils.toBinaryRepresentation(AoCUtils.uint32ToBytes(uint32(0x00000000 + 1))),
            "0b00000000000000000000000000000001"
        );
        assertEq(
            AoCUtils.toBinaryRepresentation(AoCUtils.uint32ToBytes(uint32(0x20000000 + 1))),
            "0b00100000000000000000000000000001"
        );
    }
}
