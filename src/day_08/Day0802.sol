// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console2.sol";
import {StringLib} from "../StringLib.sol";

contract Day0802 {
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
        uint32[] memory scoreFromLeft = new uint32[](width * height); // should be init from 0
        uint32[] memory scoreFromTop = new uint32[](width * height); // should be init from 0
        uint32[] memory scoreFromRight = new uint32[](width * height); // should be init from 0
        uint32[] memory scoreFromDown = new uint32[](width * height); // should be init from 0

        // just brute force it
        for (uint32 row = 0; row < height; row++) {
            for (uint32 col = 0; col < width; col++) {
                uint32 score = 0;
                uint8 treeHeight = treeHeights[col + row * width];
                // look left-to-right
                for (int32 c = int32(col) + 1; c > 0 && c < int32(width); c++) {
                    uint8 h = treeHeights[uint32(c) + row * width];
                    score++;
                    if (h >= treeHeight) {
                        break;
                    }
                }
                scoreFromLeft[col + row * width] = score;

                score = 0;
                // look right-to-left
                for (int32 c = int32(col) - 1; c < int32(width) && c >= 0; c--) {
                    uint8 h = treeHeights[uint32(c) + row * width];
                    score++;
                    if (h >= treeHeight) {
                        break;
                    }
                }
                scoreFromRight[col + row * width] = score;
                score = 0;
                // look from top
                for (int32 r = int32(row) + 1; r > 0 && r < int32(height); r++) {
                    uint8 h = treeHeights[col + uint32(r) * width];
                    score++;
                    if (h >= treeHeight) {
                        break;
                    }
                }
                scoreFromTop[col + row * width] = score;
                score = 0;
                // look from down
                for (int32 r = int32(row) - 1; r < int32(height) && r >= 0; r--) {
                    uint8 h = treeHeights[col + uint32(r) * width];
                    score++;
                    if (h >= treeHeight) {
                        break;
                    }
                }
                scoreFromDown[col + row * width] = score;
            }
        }

        // compute score
        uint32 maxScore = 0;
        for (uint32 col = 0; col < width; col++) {
            for (uint32 row = 0; row < height; row++) {
                uint32 idx = col + row * width;
                uint32 score = scoreFromLeft[idx] * scoreFromTop[idx] * scoreFromRight[idx] * scoreFromDown[idx];
                if (score > maxScore) {
                    maxScore = score;
                }
            }
        }

        return maxScore;
    }
}
