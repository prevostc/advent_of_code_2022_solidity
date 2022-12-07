// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console2.sol";
import "forge-std/Test.sol";
import {StringArrayLib} from "../src/StringArrayLib.sol";

contract StringArrayLibTest is Test {
    using StringArrayLib for string[];

    function setUp() public {}

    function test_StringArrayLib_join() public {
        string[] memory input = new string[](3);
        input[0] = "A";
        input[1] = "B";
        input[2] = "C";
        assertEq(input.join("-"), "A-B-C");
    }
}
