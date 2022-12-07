// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console.sol";
import {StringLib} from "../StringLib.sol";
import {RangeLib, Range} from "./RangeLib.sol";

contract Day0402 {
    using StringLib for string;
    using RangeLib for Range;

    function answer(string memory input) public pure returns (uint256) {
        string[] memory lines = input.split("\n");

        uint256 overlappingCount = 0;
        for (uint256 i = 0; i < lines.length; i++) {
            string[] memory parts = lines[i].split(",");
            string[] memory firstPair = parts[0].split("-");
            string[] memory otherPair = parts[1].split("-");

            Range memory firstRange = Range({min: firstPair[0].parseUint256(), max: firstPair[1].parseUint256()});
            Range memory otherRange = Range({min: otherPair[0].parseUint256(), max: otherPair[1].parseUint256()});

            if (firstRange.hasOverlap(otherRange)) {
                overlappingCount++;
            }
        }
        return overlappingCount;
    }
}
