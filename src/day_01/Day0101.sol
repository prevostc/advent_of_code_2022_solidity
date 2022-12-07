// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console2.sol";
import {StringLib} from "../StringLib.sol";

contract Day0101 {
    using StringLib for string;

    function answer(string memory input) public pure returns (uint256) {
        string[] memory lines = string.concat(input, "\n\n").split("\n");

        uint256 maxSum = 0;
        uint256 maxIdx = 0;

        uint256 curSum = 0;
        uint256 curIdx = 0;
        // split string to iterate
        for (uint256 i = 0; i < lines.length; i++) {
            // detect end of a group
            if (bytes(lines[i]).length == 0) {
                if (curSum >= maxSum) {
                    maxSum = curSum;
                    maxIdx = curIdx;
                }
                curSum = 0;
                curIdx = curIdx + 1;
                continue;
            }

            // otherwise, keep consuming the group
            uint256 calories = lines[i].parseUint256();
            curSum = curSum + calories;
        }

        return maxSum;
    }
}
