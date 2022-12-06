// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console2.sol";
import "../AoCUtils.sol";

// reuse lib from day 3
import "./ObjectCodeLib.sol";

contract Day0601 {
    // use calldata to be able to use the [:] indexing syntax
    function answer(string calldata input) public pure returns (uint256) {
        uint256 len = bytes(input).length;
        for (uint256 i = 0; i < len - 3; i++) {
            string memory s = input[i:i + 4];
            string[] memory chars = AoCUtils.stringToChars(s);

            ObjectCode oc = ObjectCodeLib.EMPTY;
            for (uint256 j = 0; j < 4; j++) {
                oc = ObjectCodeLib.or(oc, ObjectCodeLib.fromChar(chars[j]));
            }
            // not optimal but it works
            uint256 distinct = ObjectCodeLib.countDistinct(oc);
            //console2.log("%s : %i", s, distinct);
            if (distinct == 4) {
                return i + 4;
            }
        }
        return 0;
    }
}
