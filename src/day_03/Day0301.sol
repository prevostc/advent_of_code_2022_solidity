// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console2.sol";
import "../AoCUtils.sol";

// let's match items to bits, just to practice some bit operation in solidity
// so we map letters to uint64 (64 bits) where each bit represents a letter
// Ex: 0b001 is a, 0b010 is b, 0b100 is c, etc
type ObjectCode is bytes8; // 64 bits

library ObjectCodeLib {
    ObjectCode constant EMPTY = ObjectCode.wrap(bytes8(0x0000000000000000));
    bytes8 constant ONE = bytes8(0x0000000000000001);
    uint8 constant codes_a = uint8(bytes1("a"));
    uint8 constant codes_z = uint8(bytes1("z"));
    uint8 constant codes_A = uint8(bytes1("A"));
    uint8 constant codes_Z = uint8(bytes1("Z"));

    error InvalidObjectCode(bytes1 letter);
    error InvalidObjectCodeLength(uint256 length);

    function fromChar(string memory letter) internal pure returns (ObjectCode) {
        if (bytes(letter).length != 1) {
            revert InvalidObjectCodeLength(bytes(letter).length);
        }
        return fromBytes1(bytes(letter)[0]);
    }

    function fromBytes1(bytes1 letter) internal pure returns (ObjectCode) {
        uint8 b = uint8(letter);

        if (b >= codes_a && b <= codes_z) {
            bytes8 code = ONE << (b - codes_a);
            return ObjectCode.wrap(code);
        } else if (b >= codes_A && b <= codes_Z) {
            uint8 shiftBy = b - codes_A + 26;
            bytes8 code = ONE << shiftBy;
            return ObjectCode.wrap(code);
        } else {
            revert InvalidObjectCode(letter);
        }
    }

    function and(ObjectCode a, ObjectCode b) internal pure returns (ObjectCode) {
        return ObjectCode.wrap(ObjectCode.unwrap(a) & ObjectCode.unwrap(b));
    }

    function or(ObjectCode a, ObjectCode b) internal pure returns (ObjectCode) {
        return ObjectCode.wrap(ObjectCode.unwrap(a) | ObjectCode.unwrap(b));
    }

    function sumPriority(ObjectCode a) internal pure returns (uint256) {
        uint256 sum = 0;
        uint256 idx = 1;
        bytes8 b = ObjectCode.unwrap(a);
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

contract Day0301 {
    function answer(string memory input) public pure returns (uint256) {
        string[] memory lines = AoCUtils.stringToArray(input, "\n");

        uint256 sum = 0;
        for (uint256 l = 0; l < lines.length; l++) {
            bytes memory line = bytes(lines[l]);
            uint256 midpoint = line.length / 2;
            ObjectCode left = ObjectCodeLib.EMPTY;
            ObjectCode right = ObjectCodeLib.EMPTY;
            for (uint256 c = 0; c < line.length; c++) {
                ObjectCode code = ObjectCodeLib.fromBytes1(line[c]);
                if (c < midpoint) {
                    left = ObjectCodeLib.or(left, code);
                } else {
                    right = ObjectCodeLib.or(right, code);
                }
            }

            ObjectCode intersection = ObjectCodeLib.and(left, right);
            sum += ObjectCodeLib.sumPriority(intersection);
        }
        return sum;
    }
}
