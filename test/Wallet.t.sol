// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {Wallet} from "src/Wallet.sol";


// Examples of deal and hoax
// deal(address, uint) - Set balance of address
// hoax(address, uint) - deal + prank, Sets up a prank and set balance

contract WalletTest is Test {
    Wallet public wallet; 

    function setUp() public {
        wallet = new Wallet{value: 1e18}();
    }

    function _send(uint256 _amount) private {
        (bool ok,) = address(wallet).call{value: _amount}("");
        require(ok, "send failed");
    }
    
}