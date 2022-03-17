//PSDX-License-identifier: MIT;

pragma solidity ^0.5.11;

contract Map{
    mapping (address => uint) public Map;

    function set(address _addr, uint i) public{
        Map[_addr] = i;
    }

    function get(address _addr) public view returns(uint){
        return Map[_addr];
    }

    function remove(address _addr) public {
        delete Map[_addr];
    }
}