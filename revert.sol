//PSDX-License-Identifier: MIT

pragma solidity ^0.5.11;

contract Assert{
    uint public balance;
    uint public constant MAX_VALUE = 2 ** 256 - 1;

    function deposit(uint _amount) public{
        uint oldBalance = _amount;
        if(oldBalance + _amount > 2**256-1)
            revert("Overflow");
        balance += _amount;
    }
    function withdraw(uint _amount) public{
        uint oldBalance = _amount;
        if(balance < _amount)
            revert("Underflow");
        balance -= _amount;
    }
}