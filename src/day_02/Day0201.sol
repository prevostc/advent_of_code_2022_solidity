// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {StringLib} from "../StringLib.sol";

contract Day0201 {
    using StringLib for string;

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
        string[] memory lines = input.split("\n");

        // split string to iterate
        uint256 total = 0;
        for (uint256 i = 0; i < lines.length; i++) {
            string memory line = lines[i];
            // convert to moves
            string[] memory codes = line.split(" ");
            Move opponentMove = moveCodes[codes[0]];
            Move myMove = moveCodes[codes[1]];

            // get result of the match
            total += getOutcomeScore(myMove, opponentMove) + getShapeScore(myMove);
        }

        return total;
    }
}
