// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console2.sol";
import "../AoCUtils.sol";
import "./ObjectCodeLib.sol";

contract Day0301 {
    function answer(string memory input) public pure returns (uint256) {
        string[] memory lines = AoCUtils.stringToArray(input, "\n");

        uint256 sum = 0;
        for (uint256 l = 0; l < lines.length; l++) {
            bytes memory line = bytes(lines[l]);
            uint256 midpoint = line.length / 2;
            ObjectCode left = ObjectCodeLib.EMPTY;
            ObjectCode right = ObjectCodeLib.EMPTY;
            for (uint256 c = 0; c < line.length; c++) {
                ObjectCode code = ObjectCodeLib.fromBytes1(line[c]);
                if (c < midpoint) {
                    left = ObjectCodeLib.or(left, code);
                } else {
                    right = ObjectCodeLib.or(right, code);
                }
            }

            ObjectCode intersection = ObjectCodeLib.and(left, right);
            sum += ObjectCodeLib.sumPriority(intersection);
        }
        return sum;
    }
}
