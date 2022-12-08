// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {console2, Test} from "forge-std/Test.sol";
import {AsciiLib} from "../src/AsciiLib.sol";

contract AsciiLibTest is Test {
    using AsciiLib for bytes;

    function test_AsciiLib_charAt() public {
        bytes memory input = "Hello";
        bytes1 expected = "H";
        bytes1 result = input.charAt(0);
        assertEq(expected, result, "charAt should return the correct character");
    }

    function test_AsciiLib_substring() public {
        bytes memory input = "Hello";
        string memory expected = "ell";
        string memory result = input.substring(1, 4);
        assertEq(expected, result, "substring should return the correct substring");
    }

    function test_AsciiLib_indexOf() public {
        bytes memory input = "Hello";
        int256 expected = 2;
        int256 result = input.indexOf("l");
        assertEq(expected, result, "indexOf should return the correct index");
    }

    function test_AsciiLib_firstLineWidth() public {
        bytes memory input = "Hello\nWorld";
        uint256 expected = 5;
        uint256 result = input.firstLineWidth();
        assertEq(expected, result, "firstLineWidth should return the correct line width");
    }

    function test_AsciiLib_toUint8Grid_1() public {
        bytes memory input = "1234\n5678";
        uint256 width = 4;
        uint256 height = 2;
        uint8[] memory expected = new uint8[](8);
        expected[0] = 1;
        expected[1] = 2;
        expected[2] = 3;
        expected[3] = 4;
        expected[4] = 5;
        expected[5] = 6;
        expected[6] = 7;
        expected[7] = 8;
        uint8[] memory result = input.toUint8Grid(width, height);

        assertEq(expected.length, result.length, "toUint8Grid should return the correct grid");

        for (uint256 i = 0; i < expected.length; i++) {
            assertEq(expected[i], result[i], "toUint8Grid should return the correct grid");
        }
    }
}
