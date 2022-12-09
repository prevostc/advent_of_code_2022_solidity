// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console2.sol";
import {StringLib} from "../StringLib.sol";
import {AsciiLib} from "../AsciiLib.sol";

contract Day0902 {
    using StringLib for string;
    using AsciiLib for string;

    function answer(string memory input) public view returns (uint256) {
        string[] memory lines = input.split("\n");
        
        return 0;
    }
}
