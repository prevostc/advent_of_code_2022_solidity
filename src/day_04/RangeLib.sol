// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

struct Range {
    uint256 min;
    uint256 max;
}

library RangeLib {
    function fullyContains(Range memory self, Range memory other) internal pure returns (bool) {
        return self.min <= other.min && self.max >= other.max;
    }

    function isFullyContainedBy(Range memory self, Range memory other) internal pure returns (bool) {
        return fullyContains(other, self);
    }

    function isExclusive(Range memory self, Range memory other) internal pure returns (bool) {
        return self.max < other.min || self.min > other.max;
    }

    function hasOverlap(Range memory self, Range memory other) internal pure returns (bool) {
        return !isExclusive(self, other);
    }
}
