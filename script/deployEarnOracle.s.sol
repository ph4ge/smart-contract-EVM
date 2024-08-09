/*
    Copyright 2022 JOJO Exchange
    SPDX-License-Identifier: Apache-2.0
*/

pragma solidity ^0.8.9;

import "forge-std/Script.sol";
import "../src/oracle/EarnOracle.sol";

contract EarnOracleScript is Script {
    // add this to be excluded from coverage report
    function test() public { }

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("JOJO_BASE_DEPLOYER_PK");
        vm.startBroadcast(deployerPrivateKey);
        new EarnOracle(
            //fundingRateHedging
            0x8B7e1924fF57EEc8EbD87254E4de6Ff397f039D3
        );
        console2.log("deploy HelperContract");
        vm.stopBroadcast();
    }
}
