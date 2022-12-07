// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {StringLib} from "../StringLib.sol";
import {BitSetLib, BitSet} from "../BitSetLib.sol";

contract Day0602 {
    using StringLib for string;
    using BitSetLib for BitSet;

    // use calldata to be able to use the [:] indexing syntax
    function answer(string calldata input) public pure returns (uint256) {
        uint256 len = bytes(input).length;
        uint256 packetSize = 14;

        for (uint256 i = 0; i < len - (packetSize - 1); i++) {
            string memory s = input[i:i + packetSize];
            string[] memory chars = s.split("");

            BitSet oc = BitSetLib.EMPTY;
            for (uint256 j = 0; j < packetSize; j++) {
                oc = oc.or(BitSetLib.fromChar(chars[j]));
            }
            // not optimal but it works
            if (oc.countDistinct() == packetSize) {
                return i + packetSize;
            }
        }
        return 0;
    }
}
