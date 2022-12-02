// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console2.sol";
import "../AoCUtils.sol";

contract Day0102 {
    function answer(string memory input) public view returns (uint256) {
        input = string.concat(input, "\n\n");
        string[] memory lines = AoCUtils.stringToArray(input, "\n");

        // do a very inefficient sum by group and then find the max

        // get group count (optional by make code simpler)
        uint256 groupCount = 0;
        for (uint256 i = 0; i < lines.length; i++) {
            if (bytes(lines[i]).length == 0) {
                groupCount = groupCount + 1;
            }
        }
        console2.log("groupCount", groupCount);

        // get sums by group
        uint256[] memory sums = new uint256[](groupCount);
        uint256 curSum = 0;
        uint256 curIdx = 0;
        for (uint256 i = 0; i < lines.length; i++) {
            if (bytes(lines[i]).length == 0) {
                console2.log("new Group", curSum, curIdx);
                sums[curIdx] = curSum;
                curSum = 0;
                curIdx = curIdx + 1;
                continue;
            }

            uint256 calories = AoCUtils.stringToUint(lines[i]);
            curSum = curSum + calories;
        }

        // find top 3 groups, sum the calories
        for (uint256 i = 0; i < sums.length; i++) {
            console2.log("sums", i, sums[i]);
        }

        sums = AoCUtils.sort_uint(sums);
        return sums[sums.length - 1] + sums[sums.length - 2] + sums[sums.length - 3];
    }
}
