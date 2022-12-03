// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console2.sol";
import "../AoCUtils.sol";
import "./ObjectCodeLib.sol";

contract Day0302 {
    function answer(string memory input) public view returns (uint256) {
        string[] memory lines = AoCUtils.stringToArray(input, "\n");

        uint256 sum = 0;

        uint256 groupCount = lines.length / 3;
        for (uint256 g = 0; g < groupCount; g++) {
            uint256 groupStart = g * 3;
            ObjectCode groupCode = ObjectCodeLib.FULL;
            for (uint256 l = groupStart; l < groupStart + 3; l++) {
                bytes memory line = bytes(lines[l]);
                console2.log(lines[l]);

                // find all items in this rucksack
                ObjectCode elfCode = ObjectCodeLib.EMPTY;
                for (uint256 c = 0; c < line.length; c++) {
                    elfCode = ObjectCodeLib.or(elfCode, ObjectCodeLib.fromBytes1(line[c]));
                }

                // intersect with the group items
                groupCode = ObjectCodeLib.and(groupCode, elfCode);
            }

            sum += ObjectCodeLib.sumPriority(groupCode);
        }
        return sum;
    }
}
