// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console2.sol";
import {StringLib} from "../StringLib.sol";

contract SmallFs {
    using StringLib for string;

    // inspired by openzepprin's DoubleEndedQueue
    // use id indirection to make recursive and nested structures ok to work with
    uint256 internal _nextRegistryId;
    uint256[] internal _dirIds;
    mapping(uint256 => Directory) internal _dirRegistry;
    mapping(uint256 => File) internal _fileRegistry;

    uint256 public rootDirId;
    uint256 public locationDirId;

    struct Directory {
        uint256 parent;
        uint256 id;
        string name;
        uint256 size;
        uint256[] dirIds;
        uint256[] files;
    }

    struct File {
        string name;
        uint256 size;
    }

    constructor() {
        _nextRegistryId = 2;
        _dirRegistry[1] =
            Directory({parent: 0, id: 1, size: 0, name: "/", files: new uint256[](0), dirIds: new uint256[](0)});
        _dirIds.push(1);
        rootDirId = 1;
        locationDirId = 1;
    }

    function createDir(string memory name) public {
        uint256 newDirId = _nextRegistryId++;
        // add the directory to the registry and current location
        _dirRegistry[newDirId] = Directory({
            parent: locationDirId,
            id: newDirId,
            name: name,
            size: 0,
            files: new uint256[](0),
            dirIds: new uint256[](0)
        });
        _dirIds.push(newDirId);
        _dirRegistry[locationDirId].dirIds.push(newDirId);
    }

    function createFile(string memory name, uint256 size) public {
        uint256 newFileId = _nextRegistryId++;
        // add the file to the registry and current location
        _fileRegistry[newFileId] = File({name: name, size: size});
        _dirRegistry[locationDirId].files.push(newFileId);

        // update the size of the directory tree
        uint256 dirId = locationDirId;
        while (dirId != 0) {
            _dirRegistry[dirId].size += size;
            dirId = _dirRegistry[dirId].parent;
        }
    }

    function cdDown(string memory name) public {
        Directory storage location = _dirRegistry[locationDirId];
        // find the directory in the current location
        for (uint256 i = 0; i < location.dirIds.length; i++) {
            if (_dirRegistry[location.dirIds[i]].name.equals(name)) {
                locationDirId = location.dirIds[i];
                return;
            }
        }
        revert("Directory not found");
    }

    function cdUp() public {
        locationDirId = _dirRegistry[locationDirId].parent;
    }

    function _lsTree() public view {
        _lsTreeDepth(_dirRegistry[rootDirId], 0);
    }

    function _lsTreeDepth(Directory memory dir, uint256 depth) private view {
        string memory indent = "";
        for (uint256 i = 0; i <= depth; i++) {
            indent = string.concat(indent, " ");
        }
        console2.log("%s- %s", indent, dir.name);
        for (uint256 i = 0; i < dir.files.length; i++) {
            console2.log(" %s- %s (%d)", indent, _fileRegistry[dir.files[i]].name, _fileRegistry[dir.files[i]].size);
        }
        for (uint256 i = 0; i < dir.dirIds.length; i++) {
            _lsTreeDepth(_dirRegistry[dir.dirIds[i]], depth + 1);
        }
    }
}
