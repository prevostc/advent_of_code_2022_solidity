// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "solidity-stringutils/strings.sol";

library StringLib {
    using strings for *;

    function split(string memory self, string memory delim) internal pure returns (string[] memory) {
        strings.slice memory stringSlice = self.toSlice();
        strings.slice memory delimeterSlice = delim.toSlice();

        if (delimeterSlice.len() == 0) {
            string[] memory parts = new string[](stringSlice.len());
            for (uint256 i = 0; i < parts.length; i++) {
                parts[i] = stringSlice.nextRune().toString();
            }
            return parts;
        } else {
            string[] memory parts = new string[](stringSlice.count(delimeterSlice) + 1);
            for (uint256 i = 0; i < parts.length; i++) {
                parts[i] = stringSlice.split(delimeterSlice).toString();
            }
            return parts;
        }
    }

    function startsWith(string memory self, string memory prefix) internal pure returns (bool) {
        return self.toSlice().startsWith(prefix.toSlice());
    }

    function len(string memory self) internal pure returns (uint256) {
        strings.slice memory stringSlice = self.toSlice();
        return stringSlice.len();
    }

    function substring(string memory self, uint256 start, uint256 end) internal pure returns (string memory) {
        // very inefficient but works
        string[] memory parts = split(self, "");
        string memory result = "";
        for (uint256 i = start; i < end && i < parts.length; i++) {
            result = string.concat(result, parts[i]);
        }
        return result;
    }

    function charAt(string memory self, uint256 index) internal pure returns (string memory) {
        strings.slice memory stringSlice = self.toSlice();
        for (uint256 i = 0; i < index; i++) {
            stringSlice.nextRune();
        }
        return stringSlice.nextRune().toString();
    }

    function substring(string memory self, uint256 start) internal pure returns (string memory) {
        // very inefficient but works
        string[] memory parts = split(self, "");
        string memory result = "";
        for (uint256 i = start; i < parts.length; i++) {
            result = string.concat(result, parts[i]);
        }
        return result;
    }

    function equals(string memory self, string memory b) internal pure returns (bool) {
        return strings.equals(self.toSlice(), b.toSlice());
    }

    // https://ethereum.stackexchange.com/a/132434/90011
    function parseUint256(string memory self) internal pure returns (uint256) {
        bytes memory b = bytes(self);
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
