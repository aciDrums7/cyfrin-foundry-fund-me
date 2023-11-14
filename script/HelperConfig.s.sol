// SPDX-License-Identifier: MIT

//1) Deploy mocks when we are on a local anvil chain
//2) Keep tracks of contract address accross different chains
//3 Sepolia ETH/USD
//4 Mainnet ETH/USD

pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";

contract HelperConfig is Script {
    // If we're on a local anvil chain, we deploy mocks
    // Otherwise, grap the existing address from the live network
    NetworkConfig public activeNetworkConfig;

    struct NetworkConfig {
        address priceFeed; // ETH/USD price feed address
    }

    constructor() {
        //? aka 'if we're on Sepolia chain'
        if (block.chainid == 11155111) {
            activeNetworkConfig = getSepoliaEthConfig();
        } else if (block.chainid == 1) {
            activeNetworkConfig = getMainnetEthConfig();
        } else {
            activeNetworkConfig = getAnvilEthConfig();
        }
    }

    function getSepoliaEthConfig() public pure returns (NetworkConfig memory) {
        // priceFeed address
        NetworkConfig memory sepoliaConfig = NetworkConfig({
            priceFeed: 0x694AA1769357215DE4FAC081bf1f309aDC325306
        });
        return sepoliaConfig;
    }

    function getMainnetEthConfig() public pure returns (NetworkConfig memory) {
        // priceFeed address
        NetworkConfig memory sepoliaConfig = NetworkConfig({
            priceFeed: 0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419
        });
        return sepoliaConfig;
    }

    function getAnvilEthConfig() public pure returns (NetworkConfig memory) {
        // priceFeed address
    }
}
