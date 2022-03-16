//PSDX-License-Identifier: MIT

pragma solidity ^0.5.11;

contract Loop{
    uint public count = 0;
    function loop(uint n) public{
        for( uint i=0; i<n;i++)
            count += 1;
    }
}