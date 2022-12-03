// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console2.sol";
import "forge-std/Test.sol";
import "../../src/day_03/ObjectCodeLib.sol";

contract Day03_ObjectCodeLibTest is Test {
    function test_Day03_ObjectCodeLib_ToObjectCode() public {
        assertEq(uint64(ObjectCode.unwrap(ObjectCodeLib.fromChar("a"))), 0x0000000000000001);
        assertEq(uint64(ObjectCode.unwrap(ObjectCodeLib.fromChar("b"))), 0x0000000000000001 << 1);
        assertEq(uint64(ObjectCode.unwrap(ObjectCodeLib.fromChar("c"))), 0x0000000000000001 << 2);
        assertEq(uint64(ObjectCode.unwrap(ObjectCodeLib.fromChar("A"))), 0x0000000000000001 << 26);
        assertEq(uint64(ObjectCode.unwrap(ObjectCodeLib.fromChar("Z"))), 0x0000000000000001 << 51);
    }

    function test_Day03_ObjectCodeLib_SumPriority() public {
        assertEq(ObjectCodeLib.sumPriority(ObjectCodeLib.fromChar("a")), 1);
        assertEq(ObjectCodeLib.sumPriority(ObjectCodeLib.fromChar("b")), 2);
        assertEq(ObjectCodeLib.sumPriority(ObjectCodeLib.fromChar("A")), 27);
        assertEq(ObjectCodeLib.sumPriority(ObjectCodeLib.fromChar("Z")), 52);

        ObjectCode a = ObjectCodeLib.fromChar("a");
        ObjectCode b = ObjectCodeLib.fromChar("b");
        ObjectCode A = ObjectCodeLib.fromChar("A");
        ObjectCode Z = ObjectCodeLib.fromChar("Z");

        assertEq(ObjectCodeLib.sumPriority(ObjectCodeLib.or(a, b)), 3);
        assertEq(ObjectCodeLib.sumPriority(ObjectCodeLib.or(a, A)), 28);
        assertEq(ObjectCodeLib.sumPriority(ObjectCodeLib.or(ObjectCodeLib.or(a, A), Z)), 80);
    }
}
