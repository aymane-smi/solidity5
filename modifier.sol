//PSDX-License.Identifier: MIT

pragma solidity ^0.5.3;

contract Modifier{
    address public owner;

    constructor() public{
        owner = msg.sender;
    }
    modifier onlyOwner(){
        require(msg.sender == owner, "not owner");
        _;
    }
    modifier validAddress(){
        require(_addr != address(0), "not a valid address");
        _;
    }

    function changeOwner(address newOwner) public onlyOwner validAddress(newOwner){
        owner = newOwner;
    }

}