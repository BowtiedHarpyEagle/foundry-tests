// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import {Test, console} from "forge-std/Test.sol";
import {HelloWorld} from "../src/HelloWorld.sol";

contract HelloWorldTest is Test {
    HelloWorld public helloWorld;

    function setUp() public {
        helloWorld = new HelloWorld();
    }

    function testGreet() public view {
        console.log("Greeting: ", helloWorld.greet());
        assertEq(helloWorld.greet(), "Hello World!");
    }
}
