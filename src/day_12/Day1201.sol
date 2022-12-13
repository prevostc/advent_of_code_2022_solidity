// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console2.sol";
import {StringLib} from "../StringLib.sol";
import {AsciiLib} from "../AsciiLib.sol";

contract Day1201 {
    using StringLib for string;
    using AsciiLib for bytes;

    uint8[] public map;
    uint256 public height;
    uint256 public width;

    struct Point {
        uint256 x;
        uint256 y;
    }

    Point startFrom;
    Point endAt;

    // markers of points we've already visited
    mapping(uint256 => bool) visited;
    // points in current iteration
    Point[] currentPoints;
    Point[] nextPoints;

    uint256 stepCount = 0;

    function init(string memory _input) public returns (uint256) {
        bytes memory input = bytes(_input);

        uint256 len = input.length;
        width = input.firstLineWidth();
        height = len / width;

        uint8[] memory rawMap = input.toUint8GridFromChar(width, height);
        // manual copy because of memory allocation quirks
        map = new uint8[](rawMap.length);
        for (uint256 i = 0; i < rawMap.length; i++) {
            map[i] = rawMap[i];
        }

        for (uint256 i = 0; i < map.length; i++) {
            uint8 val = map[i];
            if (val == 242) {
                startFrom = Point(i % width, i / width);
            }
            if (val == 228) {
                endAt = Point(i % width, i / width);
            }
        }

        // init with all neighbours of start
        Point[] memory points = _getNeighbours(startFrom);
        for (uint256 i = 0; i < points.length; i++) {
            Point memory p = points[i];
            currentPoints.push(p);
            visited[p.x + p.y * width] = true;
        }
        stepCount++;
        _printDebug();
        return 0;
    }

    function _printDebug() public view {
        console2.log("=========");
        for (uint256 y = 0; y < height; y++) {
            string memory line = "";
            for (uint256 x = 0; x < width; x++) {
                uint256 idx = (y * width) + x;
                if (visited[idx]) {
                    line = string.concat(line, " ");
                } else {
                    line = string.concat(line, AsciiLib.uint8ToLetter(map[idx]));
                }
            }
            console2.log(line);
        }
    }

    function _getNeighbours(Point memory p) public view returns (Point[] memory) {
        uint256[] memory _idxs = new uint256[](4);
        bool[] memory _valid = new bool[](4);

        uint256 idx = (p.y * width) + p.x;

        // ugly af, but no dynamic array suks
        uint8 validCounts = 0;

        // left
        if (p.x > 0) {
            _idxs[0] = idx - 1;
            _valid[0] = true;
            validCounts++;
        }
        // right
        if (p.x < width - 1) {
            _idxs[1] = idx + 1;
            _valid[1] = true;
            validCounts++;
        }
        // up
        if (p.y > 0) {
            _idxs[2] = idx - width;
            _valid[2] = true;
            validCounts++;
        }
        // down
        if (p.y < height - 1) {
            _idxs[3] = idx + width;
            _valid[3] = true;
            validCounts++;
        }

        Point[] memory points = new Point[](validCounts);
        uint8 pidx = 0;
        for (uint8 i = 0; i < 4; i++) {
            if (!_valid[i]) {
                continue;
            }
            uint256 midx = _idxs[i];
            uint256 x = midx % width;
            uint256 y = midx / width;

            points[pidx] = Point({x: x, y: y});
            pidx++;
        }

        return points;
    }

    // we'll go depth first, that seems to be the easiest way to do this

    function step() public returns (bool) {
        console2.log("step %s", stepCount);
        delete nextPoints;

        for (uint256 i = 0; i < currentPoints.length; i++) {
            Point memory currentPoint = currentPoints[i];
            uint256 currentVal = map[(currentPoint.y * width) + currentPoint.x];
            console2.log("currentPoints[%s]: (%s;%s)", i, currentPoint.x, currentPoint.y);
            console2.log("currentVal %s", currentVal);

            Point[] memory neighbours = _getNeighbours(currentPoint);
            console2.log("neighbours.length %s", neighbours.length);
            // it's the end when there is only one neighbour and it's the end
            if (neighbours.length == 1 && neighbours[0].x == endAt.x && neighbours[0].y == endAt.y) {
                console2.log("found it");
                stepCount++;
                return true;
            }

            for (uint256 n = 0; n < neighbours.length; n++) {
                Point memory p = neighbours[0];
                uint256 idx = p.x + p.y * width;
                uint8 val = map[idx];
                if (currentVal < val && val - currentVal > 1) {
                    continue;
                }
                if (visited[idx]) {
                    continue;
                }
                visited[idx] = true;
                nextPoints.push(p);
            }
        }

        require(nextPoints.length > 0, "no more points to visit");

        currentPoints = nextPoints;
        stepCount++;

        _printDebug();
        return false;
    }

    function answer() public view returns (uint256) {
        return stepCount;
    }
}
