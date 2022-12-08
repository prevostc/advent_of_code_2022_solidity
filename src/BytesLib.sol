// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

library BytesLib {
    // https://ethereum.stackexchange.com/a/13057/90011
    function fromUint256(uint256 x) internal pure returns (bytes memory b) {
        b = new bytes(32);
        for (uint256 i = 0; i < 32; i++) {
            b[i] = bytes1(uint8(x / (2 ** (8 * (31 - i)))));
        }
    }

    function fromUint32(uint32 x) internal pure returns (bytes memory b) {
        b = new bytes(4);
        for (uint32 i = 0; i < 4; i++) {
            b[i] = bytes1(uint8(x / (2 ** (8 * (3 - i)))));
        }
    }

    function toBinary(bytes memory self) internal pure returns (string memory) {
        string memory result = "0b";
        for (uint256 i = 0; i < self.length; i++) {
            bytes1 b = self[i];
            for (uint256 j = 0; j < 8; j++) {
                bytes1 mask = bytes1(uint8(2) ** uint8(7 - j));
                if ((b & mask) == mask) {
                    result = string(abi.encodePacked(result, "1"));
                } else {
                    result = string(abi.encodePacked(result, "0"));
                }
            }
        }
        return result;
    }
}
