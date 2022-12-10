// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console2.sol";
import {StringLib} from "../StringLib.sol";
import {AsciiLib} from "../AsciiLib.sol";

contract Day1001 {
    using StringLib for string;
    using AsciiLib for string;

    int256 x = 1;
    int256[] x_hist;

    function answer(string memory input) public returns (int256) {
        string[] memory lines = input.split("\n");

        for (uint256 i = 0; i < lines.length; i++) {
            string memory line = lines[i];

            if (line.startsWith("noop")) {
                // nothing
                x_hist.push(x);
            } else if (line.startsWith("addx")) {
                int256 num = line.split(" ")[1].parseInt256();

                x_hist.push(x);
                x_hist.push(x);
                x += num;
            }
        }

        int256 sum = 0;

        for (uint256 i = 19; i < x_hist.length; i = i + 40) {
            int256 signalStrength = x_hist[i] * int256(i + 1);
            console2.log("signalStrength: ", uint256(signalStrength));
            sum += signalStrength;
        }
        return sum;
    }
}
