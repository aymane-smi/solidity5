//PSDX-License-Identifier: MIT

pragma solidity ^0.5.11;

contract Parent{
    //can't be read outside parent contract
    function privateText() private pure returns(string memory){
        return 'private text';
    }
    //even we use readPrivateText function outside the parent contract the value of provateText well not be seen
    function  readPrivateText() public pure returns(string memory){
        privateText();
    }

    function publicText() public pure  returns(string memory){
        return "public text";
    }
    //only current Contract and there child can get access to it
    function internalText() internal pure returns(string memory){
        return "internal text";
    }
    //only parent contract and the current contract can get access to it child contract are not allowed!
    function externalText() public pure returns(string memory){
        return "external text";
    }
    uint public a = 1;
    uint private b = 2;
    uint internal c = 3;
    //external keyword ca'nt be used be a state
}

contract Child is Parent{
}
