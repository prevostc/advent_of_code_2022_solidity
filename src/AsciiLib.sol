// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

/**
 * Set of fast string methods for Solidity when dealing with ascii strings only.
 */
library AsciiLib {
    bytes1 constant NL = bytes1("\n");
    bytes1 constant NUM_0_BYTES1 = bytes1("0");
    bytes1 constant NUM_9_BYTES1 = bytes1("9");
    uint8 constant NUM_0_UINT8 = uint8(bytes1("0"));
    uint8 constant NUM_9_UINT8 = uint8(bytes1("9"));

    /**
     * @dev Returns the character at the given index.
     * @param self The string to get the character from.
     * @param index The index of the character to get.
     * @return The character at the given index.
     */
    function charAt(bytes memory self, uint256 index) internal pure returns (bytes1) {
        return self[index];
    }

    /**
     * @dev Returns the substring of the given string.
     * @param self The string to get the substring from.
     * @param start The index of the first character to include in the substring.
     * @param end The index of the first character to exclude from the substring.
     * @return The substring of the given string.
     */
    function substring(bytes memory self, uint256 start, uint256 end) internal pure returns (string memory) {
        bytes memory result = new bytes(end - start);
        for (uint256 i = start; i < end;) {
            uint256 idx;
            unchecked {
                idx = i - start;
            }
            result[idx] = self[i];
            unchecked {
                i++;
            }
        }
        return string(result);
    }

    /**
     * @dev Returns the substring of the given string.
     * @param self The string to get the substring from.
     * @param start The index of the first character to include in the substring.
     * @return The substring of the given string.
     */
    function substring(bytes memory self, uint256 start) internal pure returns (string memory) {
        return substring(self, start, self.length);
    }

    /**
     * @dev Returns the index of the first occurrence of the given character in the string.
     * @param self The string to search in.
     * @param c The character to search for.
     * @return The index of the first occurrence of the given character in the string. -1 if not found.
     */
    function indexOf(bytes memory self, bytes1 c) internal pure returns (int256) {
        for (uint256 i = 0; i < self.length; i++) {
            if (self[i] == c) {
                return int256(i);
            }
        }
        return -1;
    }

    /**
     * @dev Returns the length of the first line in the string.
     * @param self The string to search in.
     * @return The length of the first line in the string.
     */
    function firstLineWidth(bytes memory self) internal pure returns (uint256) {
        for (uint256 i = 0; i < self.length;) {
            bytes1 char = self[i];
            if (char == NL) {
                return i;
            }
            unchecked {
                i++;
            }
        }
        return self.length;
    }

    /**
     * @dev Interpret the input as a grid of uint8 values.
     * @param self The string to interpret.
     * @param width The width of the grid.
     * @param height The height of the grid.
     * @return The grid of uint8 values.
     */
    function toUint8Grid(bytes memory self, uint256 width, uint256 height) internal pure returns (uint8[] memory) {
        uint8[] memory grid = new uint8[](width * height);
        uint256 idx = 0;
        uint256 len = self.length;

        for (uint256 i = 0; i < len;) {
            bytes1 c = self[i];

            unchecked {
                i++;
            }

            if (c == NL) {
                continue;
            }

            unchecked {
                // we assume the input is valid
                grid[idx] = uint8(c) - NUM_0_UINT8;
                idx++;
            }
        }

        return grid;
    }
}
