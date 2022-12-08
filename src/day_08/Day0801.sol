// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console2.sol";
import {AsciiLib} from "../AsciiLib.sol";

contract Day0801 {
    using AsciiLib for bytes;

    function answer(string memory _input) public view returns (uint256) {
        bytes memory input = bytes(_input);

        uint256 len = input.length;
        uint256 width = input.firstLineWidth();
        uint256 height = len / width;

        uint8[] memory treeHeights = input.toUint8Grid(width, height);

        uint256 treeCount = width * height;

        // "look" once from each direction then merge the results
        // if it's the first, then it's visible
        // if the current height is higher than the max height, then it is visible
        bool[] memory visibleFromLeft = new bool[](treeCount); // should be init from 0
        bool[] memory visibleFromTop = new bool[](treeCount); // should be init from 0
        bool[] memory visibleFromRight = new bool[](treeCount); // should be init from 0
        bool[] memory visibleFromDown = new bool[](treeCount); // should be init from 0

        // there might be a better way to do this, but I'm not sure how to do it

        console2.log("looking from the left");
        uint8 maxH = 0;
        for (uint256 row = 0; row < height; row++) {
            for (uint256 col = 0; col < width; col++) {
                uint8 treeHeight = treeHeights[col + row * width];
                if (col == 0 || treeHeight > maxH) {
                    visibleFromLeft[col + row * width] = true;
                    maxH = treeHeight;
                }
            }
        }
        //console2.log("====== visible from left");
        //printVisibilityMap(visibleFromLeft, width, height);

        console2.log("looking from the top");
        maxH = 0;
        for (uint256 col = 0; col < width; col++) {
            for (uint256 row = 0; row < height; row++) {
                uint8 treeHeight = treeHeights[col + row * width];
                if (row == 0 || treeHeight > maxH) {
                    visibleFromTop[col + row * width] = true;
                    maxH = treeHeight;
                }
            }
        }

        console2.log("looking from the right");
        maxH = 0;
        for (uint256 row = 0; row < height; row++) {
            for (uint256 _col = width; _col > 0; _col--) {
                uint256 col = _col - 1;
                uint8 treeHeight = treeHeights[col + row * width];
                if (col == width - 1 || treeHeight > maxH) {
                    visibleFromRight[col + row * width] = true;
                    maxH = treeHeight;
                }
            }
        }

        console2.log("looking from the bottom");
        maxH = 0;
        for (uint256 col = 0; col < width; col++) {
            for (uint256 _row = height; _row > 0; _row--) {
                uint256 row = _row - 1;
                uint8 treeHeight = treeHeights[col + row * width];
                if (row == height - 1 || treeHeight > maxH) {
                    visibleFromDown[col + row * width] = true;
                    maxH = treeHeight;
                }
            }
        }

        // count the visible trees
        uint256 visibleCount = 0;
        for (uint256 col = 0; col < width; col++) {
            for (uint256 row = 0; row < height; row++) {
                uint256 idx = col + row * width;
                bool isVisible =
                    visibleFromLeft[idx] || visibleFromTop[idx] || visibleFromRight[idx] || visibleFromDown[idx];
                if (isVisible) {
                    visibleCount++;
                }
            }
        }

        return visibleCount;
    }
}
