// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "solidity-stringutils/strings.sol";

contract Day01 {
    using strings for *;

    function _stringToArray(string memory input, string memory delim) public pure returns (string[] memory) {
        strings.slice memory stringSlice = input.toSlice();
        strings.slice memory delimeterSlice = delim.toSlice();
        string[] memory parts = new string[](stringSlice.count(delimeterSlice));
        for (uint256 i = 0; i < parts.length; i++) {
            parts[i] = stringSlice.split(delimeterSlice).toString();
        }
        return parts;
    }

    // https://ethereum.stackexchange.com/a/132434/90011
    function _stringToUint(string memory s) public pure returns (uint256) {
        bytes memory b = bytes(s);
        uint256 result = 0;
        for (uint256 i = 0; i < b.length; i++) {
            uint256 c = uint256(uint8(b[i]));
            if (c >= 48 && c <= 57) {
                result = result * 10 + (c - 48);
            }
        }
        return result;
    }

    function answer(string memory input) public pure returns (uint256) {
        string[] memory lines = _stringToArray(input, "\n");

        uint256 maxSum = 0;
        uint256 maxIdx = 0;

        uint256 curSum = 0;
        uint256 curIdx = 0;
        // split string to iterate
        for (uint256 i = 0; i <= lines.length; i++) {
            // beginning of new group or end of input
            if (i == lines.length || bytes(lines[i]).length == 0) {
                if (curSum > maxSum) {
                    maxSum = curSum;
                    maxIdx = curIdx;
                }
                curSum = 0;
                curIdx = curIdx + 1;
                continue;
            }

            // otherwise, keep consuming the group
            uint256 calories = _stringToUint(lines[i]);
            curSum = curSum + calories;
        }

        return maxIdx + 1;
    }
}
