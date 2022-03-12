//PSDX-License-Identifier : MIT

pragma solidity ^0.5.3;

contract State{
    string public text;
    
    function set(string memory _text) public{
        text = _text;
    }

    function get() public view returns(string memory){
        return text;
    }
}