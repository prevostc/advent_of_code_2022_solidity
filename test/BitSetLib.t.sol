// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console2.sol";
import "forge-std/Test.sol";
import "../src/BitSetLib.sol";

contract Day03_BitSetLibTest is Test {
    function test_Day03_BitSetLib_ToBitSet() public {
        assertEq(uint64(BitSet.unwrap(BitSetLib.fromChar("a"))), 0x0000000000000001);
        assertEq(uint64(BitSet.unwrap(BitSetLib.fromChar("b"))), 0x0000000000000001 << 1);
        assertEq(uint64(BitSet.unwrap(BitSetLib.fromChar("c"))), 0x0000000000000001 << 2);
        assertEq(uint64(BitSet.unwrap(BitSetLib.fromChar("A"))), 0x0000000000000001 << 26);
        assertEq(uint64(BitSet.unwrap(BitSetLib.fromChar("Z"))), 0x0000000000000001 << 51);
    }

    function test_Day03_BitSetLib_day03_sumPriority() public {
        assertEq(BitSetLib.day03_sumPriority(BitSetLib.fromChar("a")), 1);
        assertEq(BitSetLib.day03_sumPriority(BitSetLib.fromChar("b")), 2);
        assertEq(BitSetLib.day03_sumPriority(BitSetLib.fromChar("A")), 27);
        assertEq(BitSetLib.day03_sumPriority(BitSetLib.fromChar("Z")), 52);

        BitSet a = BitSetLib.fromChar("a");
        BitSet b = BitSetLib.fromChar("b");
        BitSet A = BitSetLib.fromChar("A");
        BitSet Z = BitSetLib.fromChar("Z");

        assertEq(BitSetLib.day03_sumPriority(BitSetLib.or(a, b)), 3);
        assertEq(BitSetLib.day03_sumPriority(BitSetLib.or(a, A)), 28);
        assertEq(BitSetLib.day03_sumPriority(BitSetLib.or(BitSetLib.or(a, A), Z)), 80);
    }
}
