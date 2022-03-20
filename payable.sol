//PSDX-License-Identifier: MIT

pragma solidity ^0.5.12;

contract Wallet {
    //use payable keyword to make owner address recieve ether
    address payable public owner;
    event Deposit(address addr, uint value, uint balance);
    event Withdraw(uint amount, uint balance);
    event Transfer(address to, uint amount, uint balance);
    constructor() public{
        //when the conract is deployd we attach the sender address to the owner
        owner = msg.sender;
    }

    function deposit()public payable{
        //sender: who call the depositunction
        //value: value that been sent
        //address(this): current amount of the contract
        emit Deposit(msg.sender, msg.value, address(this).balance);
    }
    modifier onlyOwner(){
        require(owner == msg.sender, "action accessable only for the owner!");
        _;
    }
    function withdraw(uint _amount) public onlyOwner{
        owner.transfer(_amount);
        emit Withdraw(_amount, address(this).balance);
    }
    //transfer is override here but _to.transfer is a built-in function 
    function transfer(address payable _to, uint _amount) public onlyOwner{
        _to.transfer(_amount);
        emit Transfer(_to, _amount, address(this).balance);
    }

    function currentBalance() public view returns(uint){
        return address(this).balance;
    }
}