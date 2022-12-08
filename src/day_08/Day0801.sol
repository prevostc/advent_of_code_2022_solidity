// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console2.sol";
import {StringLib} from "../StringLib.sol";

contract Day0801 {
    using StringLib for string;

    function answer(string memory input) public view returns (uint256) {
        string[] memory lines = input.split("\n");

        // using any kind of function call makes the code way too slow :(

        uint32 width = uint32(lines[0].length());
        uint32 height = uint32(lines.length);
        uint8[] memory treeHeights = new uint8[](width * height);

        console2.log("Loading forest: %s x %s", width, height);
        // load the struct
        for (uint32 col = 0; col < width; col++) {
            for (uint32 row = 0; row < height; row++) {
                uint8 treeHeight = uint8(lines[row].charAt(col).parseUint256());
                treeHeights[col + row * width] = treeHeight;
            }
        }

        // "look" once from each direction then merge the results
        // if it's the first, then it's visible
        // if the current height is higher than the max height, then it is visible
        bool[] memory visibleFromLeft = new bool[](width * height); // should be init from 0
        bool[] memory visibleFromTop = new bool[](width * height); // should be init from 0
        bool[] memory visibleFromRight = new bool[](width * height); // should be init from 0
        bool[] memory visibleFromDown = new bool[](width * height); // should be init from 0

        // there might be a better way to do this, but I'm not sure how to do it

        console2.log("looking from the left");
        uint8 maxH = 0;
        for (uint32 row = 0; row < height; row++) {
            for (uint32 col = 0; col < width; col++) {
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
        for (uint32 col = 0; col < width; col++) {
            for (uint32 row = 0; row < height; row++) {
                uint8 treeHeight = treeHeights[col + row * width];
                if (row == 0 || treeHeight > maxH) {
                    visibleFromTop[col + row * width] = true;
                    maxH = treeHeight;
                }
            }
        }
        //console2.log("====== visible from top");
        //printVisibilityMap(visibleFromTop, width, height);

        console2.log("looking from the right");
        maxH = 0;
        for (uint32 row = 0; row < height; row++) {
            for (uint32 _col = width; _col > 0; _col--) {
                uint32 col = _col - 1;
                uint8 treeHeight = treeHeights[col + row * width];
                if (col == width - 1 || treeHeight > maxH) {
                    visibleFromRight[col + row * width] = true;
                    maxH = treeHeight;
                }
            }
        }
        //console2.log("====== visible from right");
        //printVisibilityMap(visibleFromRight, width, height);

        console2.log("looking from the bottom");
        maxH = 0;
        for (uint32 col = 0; col < width; col++) {
            for (uint32 _row = height; _row > 0; _row--) {
                uint32 row = _row - 1;
                uint8 treeHeight = treeHeights[col + row * width];
                if (row == height - 1 || treeHeight > maxH) {
                    visibleFromDown[col + row * width] = true;
                    maxH = treeHeight;
                }
            }
        }
        //console2.log("====== visible from down");
        //printVisibilityMap(visibleFromDown, width, height);

        // count the visible trees
        uint32 visibleCount = 0;
        for (uint32 col = 0; col < width; col++) {
            for (uint32 row = 0; row < height; row++) {
                uint32 idx = col + row * width;
                bool isVisible =
                    visibleFromLeft[idx] || visibleFromTop[idx] || visibleFromRight[idx] || visibleFromDown[idx];
                if (isVisible) {
                    visibleCount++;
                }
            }
        }

        return visibleCount;
    }

    function printVisibilityMap(bool[] memory visibleMap, uint32 width, uint32 height) public view {
        for (uint256 row = 0; row < height; row++) {
            string memory line = "";
            for (uint256 col = 0; col < width; col++) {
                if (visibleMap[col + row * width]) {
                    line = string.concat(line, "X");
                } else {
                    line = string.concat(line, "-");
                }
            }
            console2.log(line);
        }
    }
}
