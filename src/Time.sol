// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract Auction {
    uint256 public startAt = block.timestamp + 1 days;
    uint256 public endAt = block.timestamp + 2 days;

    function bid() external view {
        require(block.timestamp >= startAt, "auction has not started yet");
        require(block.timestamp < endAt, "auction has ended");
    }

    function end() external view {
        require(block.timestamp > endAt, "auction has not ended yet");
    }
}
