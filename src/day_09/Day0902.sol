// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console2.sol";
import {StringLib} from "../StringLib.sol";
import {AsciiLib} from "../AsciiLib.sol";
import {BitSetLib} from "../BitSetLib.sol";

contract Day0902 {
    using StringLib for string;
    using AsciiLib for bytes;
    using BitSetLib for bytes;

    struct Point {
        uint256 x;
        uint256 y;
    }

    enum Direction {
        Up,
        Down,
        Left,
        Right
    }

    struct Move {
        Direction direction;
        uint256 distance;
    }

    uint8 constant ROPE_LENGTH = 10;
    uint256 constant START_XY = 200;

    Point[ROPE_LENGTH] rope;

    Point gridMax = Point(START_XY + 5, START_XY + 5);

    constructor() {
        for (uint8 i = 0; i < ROPE_LENGTH; i++) {
            rope[i] = Point(START_XY, START_XY);
        }
    }

    /**
     * Path tracking
     */
    mapping(uint256 => bool) markedPointsMap;
    uint256 markedPointCount = 0;

    function _markPoint(Point storage p) internal {
        uint256 pointHash = p.x + p.y * 100000;
        if (!markedPointsMap[pointHash]) {
            markedPointsMap[pointHash] = true;
            markedPointCount++;
        }
    }

    /**
     * Debug print
     */
    function _updateGridMax(Point storage p) internal returns (Point memory) {
        if (p.x > gridMax.x) {
            gridMax.x = p.x;
        }
        if (p.y > gridMax.y) {
            gridMax.y = p.y;
        }
        return gridMax;
    }

    function _printGrid() internal view {
        for (int256 _y = int256(gridMax.y); _y >= 0; _y--) {
            uint256 y = uint256(_y);
            string memory line = "";

            for (uint256 x = 0; x <= gridMax.x; x++) {
                bool found = false;
                for (uint8 i; i < ROPE_LENGTH; i++) {
                    Point storage p = rope[i];
                    if (x == p.x && y == p.y) {
                        line = string.concat(line, AsciiLib.uint8ToString(i));
                        found = true;
                        break;
                    }
                }
                if (!found) {
                    line = string.concat(line, ".");
                }
            }
            console2.log(line);
        }
    }

    /**
     * H/T Moving around logic
     */

    function _updateHead(Point storage head, Direction direction) internal {
        if (direction == Direction.Up) {
            head.y = head.y + 1;
        } else if (direction == Direction.Down) {
            head.y = head.y - 1;
        } else if (direction == Direction.Left) {
            head.x = head.x - 1;
        } else if (direction == Direction.Right) {
            head.x = head.x + 1;
        }
    }

    function _updateTail(Point storage head, Point storage tail) internal {
        if (head.x == tail.x && head.y == tail.y) {
            return;
        }

        if (head.x == tail.x) {
            if (head.y > tail.y) {
                tail.y = head.y - 1;
            } else {
                tail.y = head.y + 1;
            }
            return;
        }
        if (head.y == tail.y) {
            if (head.x > tail.x) {
                tail.x = head.x - 1;
            } else {
                tail.x = head.x + 1;
            }
            return;
        }

        // diagonal touching
        if (_absUintDiff(head.x, tail.x) == 1 && _absUintDiff(head.y, tail.y) == 1) {
            return;
        }

        // perfect diagonal not touching
        if (_absUintDiff(head.x, tail.x) == 2 && _absUintDiff(head.y, tail.y) == 2) {
            if (head.y > tail.y) {
                tail.y = head.y - 1;
            } else {
                tail.y = head.y + 1;
            }
            if (head.x > tail.x) {
                tail.x = head.x - 1;
            } else {
                tail.x = head.x + 1;
            }
            return;
        }

        // diagonal not touching case, assume H and T were touching previously
        if (_absUintDiff(head.x, tail.x) == 1) {
            tail.x = head.x;
            if (head.y > tail.y) {
                tail.y = head.y - 1;
            } else {
                tail.y = head.y + 1;
            }
            return;
        }

        if (_absUintDiff(head.y, tail.y) == 1) {
            tail.y = head.y;
            if (head.x > tail.x) {
                tail.x = head.x - 1;
            } else {
                tail.x = head.x + 1;
            }
            return;
        }

        console2.log("head: (%s, %s)", head.x, head.y);
        console2.log("tail: (%s, %s)", tail.x, tail.y);
        revert("unhandled case");
    }

    /**
     * Math Util
     */

    function _absUintDiff(uint256 a, uint256 b) private pure returns (uint256) {
        unchecked {
            if (a > b) {
                return a - b;
            }
            return b - a;
        }
    }

    /**
     * Overcome max gas issues by splitting the input into multiple steps
     */
    function answerStep(string memory line) public {
        string[] memory parts = line.split(" ");
        string memory direction = parts[0];
        uint256 distance = parts[1].parseUint256();

        Move memory move;
        if (direction.equals("U")) {
            move = Move(Direction.Up, distance);
        } else if (direction.equals("D")) {
            move = Move(Direction.Down, distance);
        } else if (direction.equals("L")) {
            move = Move(Direction.Left, distance);
        } else if (direction.equals("R")) {
            move = Move(Direction.Right, distance);
        } else {
            revert("invalid direction");
        }

        //console2.log("=============");
        //console2.log("distance: %s", uint256(move.distance));
        //console2.log("direction: %s", uint256(move.direction));
        for (uint256 d = 0; d < move.distance; d++) {
            _updateHead(rope[0], move.direction);
            _updateGridMax(rope[0]);
            // update all rope nodes in order
            for (uint256 i; i < ROPE_LENGTH - 1;) {
                _updateTail(rope[i], rope[i + 1]);
                //console2.log("=== %s -> %i", i, i + 1);
                //_printGrid();
                unchecked {
                    i++;
                }
            }
            // only mark the last point
            _markPoint(rope[ROPE_LENGTH - 1]);
        }
    }

    function answer() public view returns (uint256) {
        return markedPointCount;
    }
}
