// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {console} from "forge-std/console.sol";
import {WETH} from "../../src/WETH.sol";

// Note: open testing, randomly call all publicly available functions

contract WETH_OpenInvariantTest is Test {

    WETH public weth;

    function setUp() public {
        weth = new WETH();
    }

    function invariant_TotalSupplyIsAlwaysZero() public view{
        assertEq(weth.totalSupply(), 0);
    }
}
