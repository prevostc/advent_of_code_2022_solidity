// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "solidity-stringutils/strings.sol";

library AoCUtils {
    using strings for *;

    function stringToArray(string memory input, string memory delim) public pure returns (string[] memory) {
        strings.slice memory stringSlice = input.toSlice();
        strings.slice memory delimeterSlice = delim.toSlice();
        string[] memory parts = new string[](stringSlice.count(delimeterSlice) + 1);
        for (uint256 i = 0; i < parts.length; i++) {
            parts[i] = stringSlice.split(delimeterSlice).toString();
        }
        return parts;
    }

    // https://ethereum.stackexchange.com/a/132434/90011
    function stringToUint(string memory s) public pure returns (uint256) {
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

    // https://ethereum.stackexchange.com/a/1518/90011
    function _quick_sort_uint(uint256[] memory arr, int256 left, int256 right) private pure {
        int256 i = left;
        int256 j = right;
        if (i == j) return;
        uint256 pivot = arr[uint256(left + (right - left) / 2)];
        while (i <= j) {
            while (arr[uint256(i)] < pivot) i++;
            while (pivot < arr[uint256(j)]) j--;
            if (i <= j) {
                (arr[uint256(i)], arr[uint256(j)]) = (arr[uint256(j)], arr[uint256(i)]);
                i++;
                j--;
            }
        }
        if (left < j) {
            _quick_sort_uint(arr, left, j);
        }
        if (i < right) {
            _quick_sort_uint(arr, i, right);
        }
    }

    function sort_uint(uint256[] memory data) public pure returns (uint256[] memory) {
        _quick_sort_uint(data, int256(0), int256(data.length - 1));
        return data;
    }
}
