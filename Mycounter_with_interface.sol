//PSDX-License-identifier: MIT;

pragma solidity ^0.5.12;

interface Icounter{
    function counter()external view returns(uint);
    function incrementCounter()external;
}

contract MyCounter{
    function incrementCount(address _addr)external{
        Icounter(_addr).incrementCounter();
    }

    function getCounter(address _addr)external view returns(uint){
        return Icounter(_addr).counter();
    }
}