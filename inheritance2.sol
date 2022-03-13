//PSDX-License-Identifier: MIT

pragma solidity ^0.5.11;

contract A{
    function foo() public pure returns(string memory){
        return "A";
    }
}

contract B{
    function bar() public pure returns (string memory){
        return "B";
    }
    function foo() public pure returns (string memory){
        return "B";
    }
}

// contract C is A, B{}
contract C is B, A{}