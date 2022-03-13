//PSDX-License-Identifier: MIT

pragma solidity ^0.5.3;

contract wei_ether{
    uint public oneWei = 1 wei;
    uint public oneEth = 1 ether;

    function testOneWei() public pure returns(bool){
        return 1 wei == 1;
    }

    function testOneEther() public pure returns(bool){
        return 1 ether == 1e18 wei; 
    }
}