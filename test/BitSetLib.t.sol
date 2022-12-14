// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {console2, Test} from "forge-std/Test.sol";
import {BitSetLib, BitSet} from "../src/BitSetLib.sol";

contract BitSetLibTest is Test {
    using BitSetLib for BitSet;

    function test_BitSetLib_ToBitSet() public {
        assertEq(uint64(BitSet.unwrap(BitSetLib.fromChar("a"))), 0x0000000000000001);
        assertEq(uint64(BitSet.unwrap(BitSetLib.fromChar("b"))), 0x0000000000000001 << 1);
        assertEq(uint64(BitSet.unwrap(BitSetLib.fromChar("c"))), 0x0000000000000001 << 2);
        assertEq(uint64(BitSet.unwrap(BitSetLib.fromChar("A"))), 0x0000000000000001 << 26);
        assertEq(uint64(BitSet.unwrap(BitSetLib.fromChar("Z"))), 0x0000000000000001 << 51);
    }

    function test_BitSetLib_sumOneIdx() public {
        assertEq(BitSetLib.sumOneIdx(BitSetLib.fromChar("a")), 1);
        assertEq(BitSetLib.sumOneIdx(BitSetLib.fromChar("b")), 2);
        assertEq(BitSetLib.sumOneIdx(BitSetLib.fromChar("A")), 27);
        assertEq(BitSetLib.sumOneIdx(BitSetLib.fromChar("Z")), 52);

        BitSet a = BitSetLib.fromChar("a");
        BitSet b = BitSetLib.fromChar("b");
        BitSet A = BitSetLib.fromChar("A");
        BitSet Z = BitSetLib.fromChar("Z");

        assertEq(BitSetLib.sumOneIdx(a.or(b)), 3);
        assertEq(BitSetLib.sumOneIdx(a.or(A)), 28);
        assertEq(BitSetLib.sumOneIdx(a.or(A).or(Z)), 80);
    }
}
