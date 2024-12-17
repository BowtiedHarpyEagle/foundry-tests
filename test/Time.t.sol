// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {Auction} from "src/Time.sol";

contract TimeTest is Test {
    Auction public auction;
    uint256 private startAt;

    // vm.warp sets block.timestamp to future time
    // vm.roll sets block number
    // skip increments current timestamp
    // rewind decrements current timestamp

    function setUp() public {
        auction = new Auction();
        startAt = block.timestamp;
    }

    function testBidFailsBeforeStartTime() public {
        vm.expectRevert(bytes("auction has not started yet"));
        auction.bid();
    }

    function testBidSucceedsAfterStartTime() public {
        vm.warp(startAt + 1 days);
        auction.bid();
    }

    function testBidFailsAfterEndTime() public {
        vm.warp(startAt + 2 days);
        vm.expectRevert(bytes("auction has ended"));
        auction.bid();
    }
}
