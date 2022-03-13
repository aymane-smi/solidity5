//PSDX-License-Identifier: MIT

pragma solidity ^0.5.11;

contract A{
    address public addr = 0x0000000000000000000000000000000000000001;
    function getAddress() public view returns(address){
        return addr;
    }
}

contract B is A{
    address public addr = 0x0000000000000000000000000000000000000002;
}

contract C is A{
    constructor() public {
        addr = 0x0000000000000000000000000000000000000003;
    }
}