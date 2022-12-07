// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {StringLib} from "../src/StringLib.sol";

contract StringLibTest is Test {
    using StringLib for string;

    function setUp() public {}

    function test_StringLib_split() public {
        string memory input = "A Y\nB X\nC Z";
        string[] memory parts = input.split("\n");
        assertEq(parts.length, 3);
        assertEq(parts[0], "A Y");
        assertEq(parts[1], "B X");
        assertEq(parts[2], "C Z");
    }

    function test_StringLib_splitWithEmptyDelimiter() public {
        string memory input = "ABCDE";
        string[] memory parts = input.split("");
        assertEq(parts.length, 5);
        assertEq(parts[0], "A");
        assertEq(parts[1], "B");
        assertEq(parts[2], "C");
    }

    function test_StringLib_startsWith() public {
        string memory input = "A Y\nB X\nC Z";
        assertEq(input.startsWith("A Y"), true);
        assertEq(input.startsWith("A X"), false);
    }

    function test_StringLib_equals() public {
        string memory input = "A";
        assertEq(input.equals("A"), true);
        assertEq(input.equals("B"), false);
    }

    function test_StringLib_parseUint256() public {
        string memory input = "123";
        assertEq(input.parseUint256(), 123);
    }

    function test_StringLib_substring() public {
        string memory input = "ABCDE";
        assertEq(input.substring(0, 1), "A");
        assertEq(input.substring(2, 4), "CD");
        assertEq(input.substring(2, 10), "CDE");

        assertEq(input.substring(3), "DE");
    }
}
