// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {AsciiLib} from "../AsciiLib.sol";

contract Day0802 {
    using AsciiLib for bytes;

    function answer(string memory _input) public pure returns (uint256) {
        bytes memory input = bytes(_input);

        uint256 len = input.length;
        uint256 width = input.firstLineWidth();
        uint256 height = len / width;

        uint8[] memory treeHeights = input.toUint8Grid(width, height);

        // "look" once from each direction then merge the results
        // if it's the first, then it's visible
        // if the current height is higher than the max height, then it is visible
        uint256[] memory scoreFromLeft = new uint256[](width * height); // should be init from 0
        uint256[] memory scoreFromTop = new uint256[](width * height); // should be init from 0
        uint256[] memory scoreFromRight = new uint256[](width * height); // should be init from 0
        uint256[] memory scoreFromDown = new uint256[](width * height); // should be init from 0

        // just brute force it
        for (uint256 row = 0; row < height; row++) {
            for (uint256 col = 0; col < width; col++) {
                uint256 score = 0;
                uint8 treeHeight = treeHeights[col + row * width];
                // look left-to-right
                for (int256 c = int256(col) + 1; c > 0 && c < int256(width); c++) {
                    uint8 h = treeHeights[uint256(c) + row * width];
                    score++;
                    if (h >= treeHeight) {
                        break;
                    }
                }
                scoreFromLeft[col + row * width] = score;

                score = 0;
                // look right-to-left
                for (int256 c = int256(col) - 1; c < int256(width) && c >= 0; c--) {
                    uint8 h = treeHeights[uint256(c) + row * width];
                    score++;
                    if (h >= treeHeight) {
                        break;
                    }
                }
                scoreFromRight[col + row * width] = score;
                score = 0;
                // look from top
                for (int256 r = int256(row) + 1; r > 0 && r < int256(height); r++) {
                    uint8 h = treeHeights[col + uint256(r) * width];
                    score++;
                    if (h >= treeHeight) {
                        break;
                    }
                }
                scoreFromTop[col + row * width] = score;
                score = 0;
                // look from down
                for (int256 r = int256(row) - 1; r < int256(height) && r >= 0; r--) {
                    uint8 h = treeHeights[col + uint256(r) * width];
                    score++;
                    if (h >= treeHeight) {
                        break;
                    }
                }
                scoreFromDown[col + row * width] = score;
            }
        }

        // compute score
        uint256 maxScore = 0;
        for (uint256 col = 0; col < width; col++) {
            for (uint256 row = 0; row < height; row++) {
                uint256 idx = col + row * width;
                uint256 score = scoreFromLeft[idx] * scoreFromTop[idx] * scoreFromRight[idx] * scoreFromDown[idx];
                if (score > maxScore) {
                    maxScore = score;
                }
            }
        }

        return maxScore;
    }
}
