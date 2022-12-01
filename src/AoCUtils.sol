// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "solidity-stringutils/strings.sol";

library AoCUtils {
    using strings for *;

    function stringToArray(string memory input, string memory delim) public pure returns (string[] memory) {
        strings.slice memory stringSlice = input.toSlice();
        strings.slice memory delimeterSlice = delim.toSlice();
        string[] memory parts = new string[](stringSlice.count(delimeterSlice));
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
}
