// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console2.sol";
import "../AoCUtils.sol";

contract Day0201 {
    enum Move {
        ROCK,
        PAPER,
        SCISORS
    }

    mapping(Move => Move) beatsMap;
    mapping(string => Move) moveCodes;

    constructor() {
        beatsMap[Move.ROCK] = Move.SCISORS;
        beatsMap[Move.PAPER] = Move.ROCK;
        beatsMap[Move.SCISORS] = Move.PAPER;

        moveCodes["A"] = Move.ROCK;
        moveCodes["B"] = Move.PAPER;
        moveCodes["C"] = Move.SCISORS;
        moveCodes["X"] = Move.ROCK;
        moveCodes["Y"] = Move.PAPER;
        moveCodes["Z"] = Move.SCISORS;
    }

    function getOutcomeScore(Move myMove, Move opponentMove) public view returns (uint256) {
        if (myMove == opponentMove) {
            return 3; // draw
        } else if (beatsMap[myMove] == opponentMove) {
            return 6; // won
        } else {
            return 0; // lost
        }
    }

    function getShapeScore(Move move) public pure returns (uint256) {
        if (move == Move.ROCK) {
            return 1;
        } else if (move == Move.PAPER) {
            return 2;
        } else {
            return 3;
        }
    }

    function answer(string memory input) public view returns (uint256) {
        string[] memory lines = AoCUtils.stringToArray(input, "\n");

        // split string to iterate
        uint256 total = 0;
        for (uint256 i = 0; i < lines.length; i++) {
            console2.log("HERE");
            string memory line = lines[i];
            console2.log("line:", line);
            // convert to moves
            string[] memory codes = AoCUtils.stringToArray(line, " ");
            console2.log("moves:", codes[0], codes[1]);
            Move opponentMove = moveCodes[codes[0]];
            Move myMove = moveCodes[codes[1]];

            // get result of the match
            total += getOutcomeScore(myMove, opponentMove) + getShapeScore(myMove);
            console2.log("total:", total);
        }

        return total;
    }
}
