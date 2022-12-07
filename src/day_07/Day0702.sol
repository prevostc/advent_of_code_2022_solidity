// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console2.sol";
import {StringLib} from "../StringLib.sol";
import {SmallFs} from "./SmallFs.sol";

contract Day0702 is SmallFs {
    using StringLib for string;

    function answer(string memory input) public returns (uint256) {
        string[] memory lines = input.split("\n");

        // parse the input
        for (uint256 i = 1; i < lines.length; i++) {
            string memory line = lines[i];

            //console2.log('==========line: "%s"', line);

            if (line.startsWith("$ cd ..")) {
                cdUp();
            } else if (line.startsWith("$ cd ")) {
                cdDown(line.substring(5));
            } else if (line.startsWith("$ ls")) {
                // ignore
            } else if (line.startsWith("dir")) {
                createDir(line.substring(4));
            } else {
                string[] memory parts = line.split(" ");
                createFile(parts[1], parts[0].parseUint256());
            }
            //_lsTree();
        }

        // find directory matching the requirements
        uint256 diskSpace = 70000000;
        uint256 spaceRequired = 30000000;
        uint256 targetDiskSpace = diskSpace - spaceRequired;
        uint256 currentTreeSize = _dirRegistry[rootDirId].size;
        uint256 minFreeSpaceNeeded = currentTreeSize - targetDiskSpace;

        uint256 smallestDirSize = currentTreeSize; // worst case we delete the whole tree
        for (uint256 i = 0; i < _dirIds.length; i++) {
            Directory memory dir = _dirRegistry[_dirIds[i]];
            if (dir.size < smallestDirSize && dir.size >= minFreeSpaceNeeded) {
                smallestDirSize = dir.size;
            }
        }
        return smallestDirSize;
    }
}
