//PSDX-License-Identifier: MIT

pragma solidity ^0.5.11;

contract Events{
    event Log(address indexed sender, string message);
    event AnotherLog();

    function TriggerEvent() public{
        emit Log(msg.sender, "HELLO WORLD");
        emit Log(msg.sender, "SECOND MESSAGE");
        emit AnotherLog();
    }
}