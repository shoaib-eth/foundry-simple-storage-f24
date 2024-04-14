// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Script} from "forge-std/Script.sol";
import {storageFactory} from "../src/storageFactory.sol";

contract DeployStorageFactory is Script {
    function run() external returns (storageFactory) {
        vm.startBroadcast();
        storageFactory StorageFactory = new storageFactory();
        vm.stopBroadcast();
        return StorageFactory;
    }
}
