// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console2.sol";
import {StringLib} from "../StringLib.sol";
import {AsciiLib} from "../AsciiLib.sol";
import {UintArrayLib} from "../UintArrayLib.sol";

library Calculus {
    enum Operator {
        ADD,
        MULTIPLY
    }

    struct Operation {
        Operator op;
        // if negative, then it's an index into the args array (idx = (-1 * arg) -1)
        // if positive, then it's a literal value
        int256 argL;
        int256 argR;
    }

    function eval(Operation memory op, uint256[] memory args) internal pure returns (uint256) {
        uint256 argL = op.argL < 0 ? args[uint256(-1 * op.argL - 1)] : uint256(op.argL);
        uint256 argR = op.argR < 0 ? args[uint256(-1 * op.argR - 1)] : uint256(op.argR);
        if (op.op == Operator.ADD) {
            return argL + argR;
        } else if (op.op == Operator.MULTIPLY) {
            return argL * argR;
        } else {
            revert("invalid operator");
        }
    }
}

contract Day1101 {
    using StringLib for string;
    using AsciiLib for bytes;

    struct Monkey {
        uint256[] items;
        MonkeyTest test;
        Calculus.Operation operation;
    }

    struct MonkeyTest {
        uint256 divisibleBy;
        uint256 gotoTrue;
        uint256 gotoFalse;
    }

    Monkey[] monkeys;
    uint256[] inspectCount;

    Monkey monkey;

    function init(string memory input) public {
        string[] memory lines = input.split("\n");

        for (uint256 i; i < lines.length; i++) {
            string memory line = lines[i];
            if (!line.startsWith("Monkey")) {
                continue;
            }

            // reset
            monkey = Monkey({
                test: MonkeyTest({divisibleBy: 0, gotoTrue: 0, gotoFalse: 0}),
                operation: Calculus.Operation({op: Calculus.Operator.ADD, argL: 0, argR: 0}),
                items: new uint256[](0)
            });

            // starting items
            line = lines[i + 1];
            line = line.substring(18);
            string[] memory lineParts = line.split(", ");
            for (uint256 j; j < lineParts.length; j++) {
                monkey.items.push(lineParts[j].parseUint256());
            }

            // operation
            line = lines[i + 2];
            line = line.substring(19);
            lineParts = line.split(" ");
            monkey.operation.op = lineParts[1].equals("+") ? Calculus.Operator.ADD : Calculus.Operator.MULTIPLY;
            monkey.operation.argL = lineParts[0].equals("old") ? int256(-1) : lineParts[0].parseInt256();
            monkey.operation.argR = lineParts[2].equals("old") ? int256(-1) : lineParts[2].parseInt256();

            // test
            line = lines[i + 3];
            line = line.substring(21);
            monkey.test.divisibleBy = line.parseUint256();
            line = lines[i + 4];
            line = line.substring(29);
            monkey.test.gotoTrue = line.parseUint256();
            line = lines[i + 5];
            line = line.substring(30);
            monkey.test.gotoFalse = line.parseUint256();

            // FINALLY
            monkeys.push(monkey);
        }
        inspectCount = new uint256[](monkeys.length);
    }

    function monkeyRound(uint256 idx) internal {
        Monkey storage m = monkeys[idx];
        console2.log("Monkey round: %s", idx);

        // inspect all items one by one
        for (uint256 i; i < m.items.length; i++) {
            console2.log("inspecting item: %s (%s)", m.items[i], i);
            inspectCount[idx]++;
            uint256 item = m.items[i];

            // apply operation
            console2.log("applying operation");
            uint256[] memory args = new uint256[](1);
            args[0] = item;
            item = Calculus.eval(m.operation, args);

            // apply boredom
            console2.log("applying boredom");
            item = item / 3;

            // apply test
            console2.log("applying test");
            if (item % m.test.divisibleBy == 0) {
                monkeys[m.test.gotoTrue].items.push(item);
            } else {
                monkeys[m.test.gotoFalse].items.push(item);
            }
        }

        m.items = new uint256[](0);
    }

    function step() public {
        // one step is a whole round for all monkeys
        for (uint256 i; i < monkeys.length; i++) {
            monkeyRound(i);
        }
    }

    function answer() public view returns (uint256) {
        uint256[] memory inspectCounts = UintArrayLib.sort(inspectCount);
        return inspectCounts[inspectCounts.length - 1] * inspectCounts[inspectCounts.length - 2];
    }
}
