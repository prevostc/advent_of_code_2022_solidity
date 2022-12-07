// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {StringLib} from "../StringLib.sol";
import "./MultiStack.sol";

contract Day0502 is MultiStack {
    using StringLib for string;

    function answer(string memory input) public returns (string memory) {
        // split the input into lines
        string[] memory lines = input.split("\n");

        // first, parse initial conditions
        uint256 stacksHeight = 0;
        uint256 stacksCount = 0;
        for (uint256 i = 0; i < lines.length; i++) {
            string memory line = lines[i];
            if (stacksCount == 0) {
                stacksCount = (bytes(line).length + 1) / 4;
            }
            if (bytes(line).length == 0) {
                stacksHeight = i - 1;
                break;
            }
        }

        // initialize stacks array
        initStacks(stacksCount);
        for (uint256 l = stacksHeight; l > 0; l--) {
            string memory line = lines[l - 1];
            string[] memory chars = line.split("");

            for (uint256 c = 0; c < stacksCount; c++) {
                // iterate on content only, ignore brackets and spaces
                string memory char = chars[((c * 4) + 1)];
                if (char.equals(" ")) {
                    continue;
                }
                pushToStack(c, char);
            }
        }

        // parse moves
        for (uint256 m = stacksHeight + 2; m < lines.length; m++) {
            string memory line = lines[m];
            string[] memory words = line.split(" ");
            uint256 moveCount = words[1].parseUint256();
            uint256 fromStackNumber = words[3].parseUint256();
            uint256 toStackNumber = words[5].parseUint256();

            moveMultipleStackElement(moveCount, fromStackNumber - 1, toStackNumber - 1);
        }

        // now create the answer
        string memory res = "";
        for (uint256 i = 0; i < stackCount(); i++) {
            string memory stackTopElement = getStackTopElement(i);
            res = string.concat(res, stackTopElement);
        }

        return res;
    }
}
