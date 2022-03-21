//PSDX-License-identifier: MIT
pragma solidity ^0.5.12;


library SafeMath{
    function add(uint x, uint y)internal pure returns(uint){
        uint z = x + y;
        require(z >= x, "uint overflow");
        return z;
    }
}

contract foo{
    using SafeMath for uint;
    uint public MAX = 2**256 - 1;
    function test(uint x, uint y)public returns(uint){
        return x.add(y);
    }
}