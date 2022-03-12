//PSDX-License-Identifier: MIT

pragma solidity ^0.5.3;

contract pure_view{
    uint public x = 1;

    function addToX(uint y) public view returns(uint){
        return x+y;
    }

    function foo() public pure{

    }
    function foo2() public pure{
        foo();
    }
}