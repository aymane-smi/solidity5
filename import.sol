//PSDX-License-Identifier: MIT

pragma solidity ^0.5.12;

import './foo.sol';

contract Import{
    Foo foo = new Foo();
    function getName() public returns(string memory){
        return foo.name();
    }
}