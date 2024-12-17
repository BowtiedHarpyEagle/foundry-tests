// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {Auction} from "src/Time.sol";

contract TimeTest is Test {
    Auction public auction;
    uint256 private startAt;

    function setup() public {
        auction = new Auction();
        startAt = block.timestamp;
    }
}
