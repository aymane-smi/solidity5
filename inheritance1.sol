//PSDX-License-Identifier: MIT

pragma solidity ^0.5.3;

contract A{
    // function contractA() public pure returns (string){
    //     return "Contract A";
    // }
    string public name;

    constructor(string memory _name) public {
        name = _name;
    }

}

contract B is A{
    constructor(string memory _name) A(_name) public {
        name = _name;
    }
}