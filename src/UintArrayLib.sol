// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

library UintArrayLib {
    function sort(uint256[] memory self) internal pure returns (uint256[] memory) {
        _quick_sort_uint(self, int256(0), int256(self.length - 1));
        return self;
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
}
