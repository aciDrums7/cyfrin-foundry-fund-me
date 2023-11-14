// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundMeTest is Test {
    FundMe fundMe;

    function setUp() external {
        vm.startBroadcast();
        fundMe = new FundMe();
        vm.stopBroadcast();
    }

    function testMinimumDollarIsFive() public {
        assertEq(fundMe.MINIMUM_USD(), 5e18);
    }
}
