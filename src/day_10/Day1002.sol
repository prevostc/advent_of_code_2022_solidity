// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console2.sol";
import {StringLib} from "../StringLib.sol";
import {AsciiLib} from "../AsciiLib.sol";

contract Day1002 {
    using StringLib for string;
    using AsciiLib for string;

    int256 x = 1;
    int256[] x_hist;

    function answer(string memory input) public returns (string memory) {
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

        string memory result = "";
        for (uint256 i = 0; i < x_hist.length; i = i + 40) {
            string memory line = "";
            for (uint256 crtPos = 0; crtPos < 40; crtPos++) {
                uint256 spritePos = uint256(x_hist[i + crtPos]);

                if (crtPos + 1 < spritePos || crtPos + 1 >= spritePos + 3) {
                    line = string.concat(line, ".");
                } else {
                    line = string.concat(line, "#");
                }
            }
            result = string.concat(string.concat(result, line), "\n");
        }
        return result;
    }
}
