// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "solidity-stringutils/strings.sol";

library StringLib {
    using strings for *;

    function split(string memory self, string memory delim) public pure returns (string[] memory) {
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

    function startsWith(string memory self, string memory prefix) public pure returns (bool) {
        strings.slice memory stringSlice = self.toSlice();
        strings.slice memory prefixSlice = prefix.toSlice();
        return stringSlice.startsWith(prefixSlice);
    }

    function length(string memory self) public pure returns (uint256) {
        strings.slice memory stringSlice = self.toSlice();
        return stringSlice.len();
    }

    function substring(string memory self, uint256 start, uint256 end) public pure returns (string memory) {
        // very inefficient but works
        string[] memory parts = split(self, "");
        string memory result = "";
        for (uint256 i = start; i < end && i < parts.length; i++) {
            result = string.concat(result, parts[i]);
        }
        return result;
    }

    function charAt(string memory self, uint256 index) public pure returns (string memory) {
        return substring(self, index, index + 1);
    }

    function substring(string memory self, uint256 start) public pure returns (string memory) {
        // very inefficient but works
        string[] memory parts = split(self, "");
        string memory result = "";
        for (uint256 i = start; i < parts.length; i++) {
            result = string.concat(result, parts[i]);
        }
        return result;
    }

    function equals(string memory self, string memory b) public pure returns (bool) {
        return keccak256(abi.encodePacked((self))) == keccak256(abi.encodePacked((b)));
    }

    // https://ethereum.stackexchange.com/a/132434/90011
    function parseUint256(string memory self) public pure returns (uint256) {
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

library StringArrayLib {
    // self being the delimiter, like in python
    function join(string[] memory self, string memory delim) public pure returns (string memory) {
        string memory joined = "";
        for (uint256 i = 0; i < self.length; i++) {
            if (i > 0) {
                joined = string.concat(joined, delim);
            }
            joined = string.concat(joined, self[i]);
        }
        return joined;
    }
}
