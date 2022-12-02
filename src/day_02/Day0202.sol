// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console2.sol";
import "../AoCUtils.sol";

contract Day0202 {
    enum Move {
        ROCK,
        PAPER,
        SCISORS
    }
    enum Result {
        WIN,
        LOSE,
        DRAW
    }

    mapping(Move => Move) beatsMap;
    mapping(string => Move) moveCodes;
    mapping(string => Result) resultCodes;

    constructor() {
        beatsMap[Move.ROCK] = Move.SCISORS;
        beatsMap[Move.PAPER] = Move.ROCK;
        beatsMap[Move.SCISORS] = Move.PAPER;

        moveCodes["A"] = Move.ROCK;
        moveCodes["B"] = Move.PAPER;
        moveCodes["C"] = Move.SCISORS;

        resultCodes["X"] = Result.LOSE;
        resultCodes["Y"] = Result.DRAW;
        resultCodes["Z"] = Result.WIN;
    }

    function getMoveToPlay(Move opponentMove, Result expectedResult) public view returns (Move) {
        if (expectedResult == Result.WIN) {
            return beatsMap[beatsMap[opponentMove]];
        } else if (expectedResult == Result.LOSE) {
            return beatsMap[opponentMove];
        } else {
            return opponentMove;
        }
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
            Result expectedResult = resultCodes[codes[1]];
            Move myMove = getMoveToPlay(opponentMove, expectedResult);
            console2.log("moves:", uint256(opponentMove), uint256(expectedResult), uint256(myMove));

            // get result of the match
            total += getOutcomeScore(myMove, opponentMove) + getShapeScore(myMove);
            console2.log("total:", total);
        }

        return total;
    }
}
