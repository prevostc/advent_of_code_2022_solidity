// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console2.sol";
import "../AoCUtils.sol";

contract MultiStack {
    // make it a store variable so we have access to pop() and push() methods
    string[][] private stacks;

    function initStacks(uint256 stacksCount) internal {
        stacks = new string[][](stacksCount);
    }

    function stackCount() internal view returns (uint256) {
        return stacks.length;
    }

    function pushToStack(uint256 stackNumber, string memory element) internal {
        stacks[stackNumber].push(element);
    }

    function popFromStack(uint256 stackNumber) internal returns (string memory) {
        string[] storage stack = stacks[stackNumber];
        string memory element = stack[stack.length - 1];
        stack.pop();
        return element;
    }

    function moveStackElement(uint256 fromStackNumber, uint256 toStackNumber) internal {
        string memory element = popFromStack(fromStackNumber);
        pushToStack(toStackNumber, element);
    }

    function getStackTopElement(uint256 stackNumber) internal view returns (string memory) {
        string[] storage stack = stacks[stackNumber];
        return stack[stack.length - 1];
    }

    function _printDebugStacks() internal view {
        console2.log("STACKS:");
        for (uint256 i = 0; i < stackCount(); i++) {
            string[] memory stack = stacks[i];
            console2.log("stacks[%d]: %s", i, AoCUtils.stringJoin(stack, ","));
        }
    }
}

contract Day0501 is MultiStack {
    function answer(string memory input) public returns (string memory) {
        // split the input into lines
        string[] memory lines = AoCUtils.stringToArray(input, "\n");

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

        console2.log("stacksHeight", stacksHeight);
        console2.log("stacksCount", stacksCount);

        // initialize stacks array
        initStacks(stacksCount);
        for (uint256 l = stacksHeight; l > 0; l--) {
            string memory line = lines[l - 1];
            //console2.log("======== line", line);
            //_printDebugStacks();
            string[] memory chars = AoCUtils.stringToChars(line);

            for (uint256 c = 0; c < stacksCount; c++) {
                // iterate on content only, ignore brackets and spaces
                string memory char = chars[((c * 4) + 1)];
                if (AoCUtils.stringEquals(char, " ")) {
                    continue;
                }
                //console2.log("char", char);
                //console2.log("c", c);
                pushToStack(c, char);
            }
            //_printDebugStacks();
        }
        console2.log("========");
        _printDebugStacks();
        console2.log("========");

        // now, play the moves
        for (uint256 m = stacksHeight + 2; m < lines.length; m++) {
            _printDebugStacks();
            string memory line = lines[m];
            console2.log("======== line", line);
            string[] memory words = AoCUtils.stringToArray(line, " ");
            uint256 moveCount = AoCUtils.stringToUint(words[1]);
            uint256 fromStackNumber = AoCUtils.stringToUint(words[3]);
            uint256 toStackNumber = AoCUtils.stringToUint(words[5]);
            console2.log("moveCount", moveCount);
            console2.log("fromStackNumber", fromStackNumber);
            console2.log("toStackNumber", toStackNumber);
            for (uint256 i = 0; i < moveCount; i++) {
                moveStackElement(fromStackNumber - 1, toStackNumber - 1);
            }
        }

        console2.log("========");
        _printDebugStacks();
        console2.log("========");

        // now create the answer
        string memory answer = "";
        for (uint256 i = 0; i < stackCount(); i++) {
            string memory stackTopElement = getStackTopElement(i);
            answer = string.concat(answer, stackTopElement);
        }

        return answer;
    }
}
