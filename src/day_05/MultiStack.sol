// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console2.sol";
import {StringArrayLib} from "../StringArrayLib.sol";

contract MultiStack {
    using StringArrayLib for string[];

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

    function moveMultipleStackElement(uint256 moveCount, uint256 fromStackNumber, uint256 toStackNumber) internal {
        string[] memory elements = new string[](moveCount);
        for (uint256 i = 0; i < moveCount; i++) {
            elements[i] = popFromStack(fromStackNumber);
        }
        for (uint256 i = 0; i < moveCount; i++) {
            pushToStack(toStackNumber, elements[moveCount - i - 1]);
        }
    }

    function getStackTopElement(uint256 stackNumber) internal view returns (string memory) {
        string[] storage stack = stacks[stackNumber];
        return stack[stack.length - 1];
    }

    function _printDebugStacks() internal view {
        console2.log("STACKS:");
        for (uint256 i = 0; i < stackCount(); i++) {
            string[] memory stack = stacks[i];
            console2.log("stacks[%d]: %s", i, stack.join(","));
        }
    }
}
