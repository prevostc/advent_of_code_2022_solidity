// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console2.sol";
import "../AoCUtils.sol";
import "./RangeLib.sol";

contract Day0401 {
    function answer(string memory input) public pure returns (uint256) {
        string[] memory lines = AoCUtils.stringToArray(input, "\n");

        uint256 fullyContainedCount = 0;
        for (uint256 i = 0; i < lines.length; i++) {
            string[] memory parts = AoCUtils.stringToArray(lines[i], ",");
            string[] memory firstPairParts = AoCUtils.stringToArray(parts[0], "-");
            string[] memory otherPairParts = AoCUtils.stringToArray(parts[1], "-");

            Range memory firstRange =
                Range({min: AoCUtils.stringToUint(firstPairParts[0]), max: AoCUtils.stringToUint(firstPairParts[1])});
            Range memory otherRange =
                Range({min: AoCUtils.stringToUint(otherPairParts[0]), max: AoCUtils.stringToUint(otherPairParts[1])});

            if (RangeLib.fullyContains(firstRange, otherRange) || RangeLib.isFullyContainedBy(firstRange, otherRange)) {
                fullyContainedCount++;
            }
        }
        return fullyContainedCount;
    }
}
