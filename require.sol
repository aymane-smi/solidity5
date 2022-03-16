//PSDX-License-Identifier: MIT

pragma solidity ^0.5.11;

contract Assert{
    uint public balance;
    uint public constant MAX_VALUE = 2 ** 256 - 1;

    function deposit(uint _amount) public{
        uint oldBalance = _amount;
        uint newBalance = oldBalance + _amount;
        require(newBlance >= oldBalance, "Overflow");
        balance = newBalance;
    }

    function withdraw(uint _amount) public{
        uint oldBalance = _amount;
        uint newBalance = oldBalance - _amount;
        require(newBlance <= oldBalance, "Underflow");
        balance = newBalance;
    }
}