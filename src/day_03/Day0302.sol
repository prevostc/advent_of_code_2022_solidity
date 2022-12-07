// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console2.sol";
import {StringLib} from "../StringLib.sol";
import "../BitSetLib.sol";

contract Day0302 {
    using StringLib for string;
    using BitSetLib for BitSet;

    function answer(string memory input) public pure returns (uint256) {
        string[] memory lines = input.split("\n");

        uint256 sum = 0;

        uint256 groupCount = lines.length / 3;
        for (uint256 g = 0; g < groupCount; g++) {
            uint256 groupStart = g * 3;
            BitSet groupCode = BitSetLib.FULL;

            for (uint256 l = groupStart; l < groupStart + 3; l++) {
                bytes memory line = bytes(lines[l]);

                // find all items in this rucksack
                BitSet elfCode = BitSetLib.EMPTY;
                for (uint256 c = 0; c < line.length; c++) {
                    elfCode = elfCode.or(BitSetLib.fromBytes1(line[c]));
                }

                // intersect with the group items
                groupCode = groupCode.and(elfCode);
            }

            sum += BitSetLib.sumOneIdx(groupCode);
        }
        return sum;
    }
}
