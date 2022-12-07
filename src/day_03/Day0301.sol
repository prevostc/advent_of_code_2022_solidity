// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {StringLib} from "../StringLib.sol";
import "../BitSetLib.sol";

contract Day0301 {
    using BitSetLib for BitSet;
    using StringLib for string;

    function answer(string memory input) public pure returns (uint256) {
        string[] memory lines = input.split("\n");

        uint256 sum = 0;
        for (uint256 l = 0; l < lines.length; l++) {
            bytes memory line = bytes(lines[l]);
            uint256 midpoint = line.length / 2;
            BitSet left = BitSetLib.EMPTY;
            BitSet right = BitSetLib.EMPTY;
            for (uint256 c = 0; c < line.length; c++) {
                BitSet code = BitSetLib.fromBytes1(line[c]);
                if (c < midpoint) {
                    left = left.or(code);
                } else {
                    right = right.or(code);
                }
            }

            BitSet intersection = BitSetLib.and(left, right);
            sum += BitSetLib.sumOneIdx(intersection);
        }
        return sum;
    }
}
