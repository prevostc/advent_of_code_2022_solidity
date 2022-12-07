// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import "../src/BytesLib.sol";

contract BytesLibTest is Test {
    using BytesLib for bytes;

    function setUp() public {}

    function test_BytesLib_printBinary() public {
        assertEq(BytesLib.fromUint32(uint32(0x00000000)).toBinary(), "0b00000000000000000000000000000000");
        assertEq(BytesLib.fromUint32(uint32(0x000000F0)).toBinary(), "0b00000000000000000000000011110000");
        assertEq(BytesLib.fromUint32(uint32(0x00000000 + 1)).toBinary(), "0b00000000000000000000000000000001");
        assertEq(BytesLib.fromUint32(uint32(0x20000000 + 1)).toBinary(), "0b00100000000000000000000000000001");
    }
}
