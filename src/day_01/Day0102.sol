// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "../AoCUtils.sol";
import {StringLib} from "../StringLib.sol";
import {UintArrayLib} from "../UintArrayLib.sol";

contract Day0102 {
    using StringLib for string;
    using UintArrayLib for uint256[];

    function answer(string memory input) public pure returns (uint256) {
        string[] memory lines = string.concat(input, "\n\n").split("\n");

        // do a very inefficient sum by group and then find the max

        // get group count (optional by make code simpler)
        uint256 groupCount = 0;
        for (uint256 i = 0; i < lines.length; i++) {
            if (bytes(lines[i]).length == 0) {
                groupCount = groupCount + 1;
            }
        }

        // get sums by group
        uint256[] memory sums = new uint256[](groupCount);
        uint256 curSum = 0;
        uint256 curIdx = 0;
        for (uint256 i = 0; i < lines.length; i++) {
            if (bytes(lines[i]).length == 0) {
                sums[curIdx] = curSum;
                curSum = 0;
                curIdx = curIdx + 1;
                continue;
            }

            uint256 calories = lines[i].parseUint256();
            curSum = curSum + calories;
        }

        sums = sums.sort();
        return sums[sums.length - 1] + sums[sums.length - 2] + sums[sums.length - 3];
    }
}
