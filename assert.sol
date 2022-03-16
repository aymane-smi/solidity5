//PSDX-License-Identifier: MIT

pragma solidity ^0.5.11;

contract Assert{
    uint public balance;
    uint public constant MAX_VALUE = 2 ** 256 - 1;

    function deposit(uint _amount) public{
        uint oldBalance = _amount;
        balance += _amount;

        assert(balance >= oldBalance);
    };

    function withdraw(uint _amount) public{
        uint oldBalance = _amount;
        balance -= _amount;

        assert(balance <= oldBlance);
    };
}