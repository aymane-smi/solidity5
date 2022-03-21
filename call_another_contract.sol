//PSDX-License-Identifier: MIT

pragma solidity ^0.5.12;

contract Calle{
    uint public x;
    uint public value;

    function setX(uint _x) public returns(uint){
        x = _x;
        return x;
    }

    function setXandsetEther(uint _x) public payable returns(uint, uint){
        x = _x;
        value = msg.value;
        return (x, value);
    }
}

contract Caller{
    function setX(Calle calle, uint _x) public {
        uint x = calle.setX(_x);
    }

    function setXfromAddress(address addr, uint _x) public {
        Calle calle = Calle(addr);
        calle.setX(_x);
    }

    function setXandsetEther(Calle calle, uint _x) public payable{
        (uint x, uint value) = calle.setXandsetEther.value(msg.value)(_x);
    }
}