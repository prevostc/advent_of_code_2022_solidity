// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "./AoCUtils.sol";

// a bitset is a set of bits, where each bit represents a number
// if set to 1, the number is in the set and if set to 0, the number is not in the set
// also has a few utility functions for working with characters
type BitSet is bytes8; // 64 bits

library BitSetLib {
    BitSet constant EMPTY = BitSet.wrap(bytes8(0x0000000000000000));
    BitSet constant FULL = BitSet.wrap(bytes8(0xFFFFFFFFFFFFFFFF));
    bytes8 constant ONE = bytes8(0x0000000000000001);
    uint8 constant codes_a = uint8(bytes1("a"));
    uint8 constant codes_z = uint8(bytes1("z"));
    uint8 constant codes_A = uint8(bytes1("A"));
    uint8 constant codes_Z = uint8(bytes1("Z"));

    error InvalidBitSet(bytes1 letter);
    error InvalidBitSetLength(uint256 length);

    function fromChar(string memory letter) internal pure returns (BitSet) {
        if (bytes(letter).length != 1) {
            revert InvalidBitSetLength(bytes(letter).length);
        }
        return fromBytes1(bytes(letter)[0]);
    }

    function fromBytes1(bytes1 letter) internal pure returns (BitSet) {
        uint8 b = uint8(letter);

        if (b >= codes_a && b <= codes_z) {
            bytes8 code = ONE << (b - codes_a);
            return BitSet.wrap(code);
        } else if (b >= codes_A && b <= codes_Z) {
            uint8 shiftBy = b - codes_A + 26;
            bytes8 code = ONE << shiftBy;
            return BitSet.wrap(code);
        } else {
            revert InvalidBitSet(letter);
        }
    }

    function and(BitSet a, BitSet b) internal pure returns (BitSet) {
        return BitSet.wrap(BitSet.unwrap(a) & BitSet.unwrap(b));
    }

    function or(BitSet a, BitSet b) internal pure returns (BitSet) {
        return BitSet.wrap(BitSet.unwrap(a) | BitSet.unwrap(b));
    }

    function countDistinct(BitSet a) internal pure returns (uint256) {
        uint256 sum = 0;
        uint256 idx = 1;
        bytes8 b = BitSet.unwrap(a);
        for (uint256 i = 0; i < 52; i++) {
            if ((b & ONE) > 0x0) {
                sum += 1;
            }
            b = b >> 1;
            idx++;
        }
        return sum;
    }

    function toString(BitSet a) internal pure returns (string memory) {
        return AoCUtils.toBinaryRepresentation(bytes(abi.encodePacked(BitSet.unwrap(a))));
    }

    function day03_sumPriority(BitSet a) internal pure returns (uint256) {
        uint256 sum = 0;
        uint256 idx = 1;
        bytes8 b = BitSet.unwrap(a);
        for (uint256 i = 0; i < 52; i++) {
            if ((b & ONE) > 0x0) {
                sum += idx;
            }
            b = b >> 1;
            idx++;
        }
        return sum;
    }
}
