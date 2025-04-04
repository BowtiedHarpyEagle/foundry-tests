// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol"; 
import {Bit} from "../src/Bit.sol";

// Topics:
// Fuzz
// assume and bound
// stats 

contract FuzzTest is Test { 
    
    Bit public b;

    function setUp() public {
        b = new Bit();
    }

    function mostSignificantBit(uint256 x) private pure returns (uint256) {
        uint256 i = 0;
        while ((x >>= 1) > 0) {
            i++;            
        }
        return i;
    }

    function testMostSignificantBitManual() public view{
        assertEq(b.mostSignificantBit(0), 0);
        assertEq(b.mostSignificantBit(1), 0);
        assertEq(b.mostSignificantBit(2), 1);
        assertEq(b.mostSignificantBit(4), 2);
        assertEq(b.mostSignificantBit(8), 3);
        assertEq(b.mostSignificantBit(16), 4);
        assertEq(b.mostSignificantBit(type(uint256).max), 255);
    }

    function testLeastSignificantBitFuzz(uint256 x) public view{
        // assume if false; fuzz test will skip and try another random value
        // for another fuzz test
        // skip if x = 0
        vm.assume(x > 0);
        assertGt(x, 0);
        
        uint i = b.mostSignificantBit(x);
        assertEq(i, mostSignificantBit(x));
    }
}