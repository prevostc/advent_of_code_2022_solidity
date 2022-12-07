// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {StringLib} from "./StringLib.sol";

library StringArrayLib {
    using StringLib for string;

    // self being the delimiter, like in python
    function join(string[] memory self, string memory delim) public pure returns (string memory) {
        string memory joined = "";
        for (uint256 i = 0; i < self.length; i++) {
            if (i > 0) {
                joined = string.concat(joined, delim);
            }
            joined = string.concat(joined, self[i]);
        }
        return joined;
    }
}
