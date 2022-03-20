//PSDX-License-Identifier: MIT
pragma solidity ^0.5.12;

contract ReceiveEther{
    function() external payable{}

    function getBalance()public view returns(uint){
        return address(this).balance;
    }
}

contract SendEther{
    //cost 2300 gas
    //throw error if the gas is insufficient
    //if the eth > than @ balance
    //using payable keyword to be able to send eth 
    function sendViaTransfer(address payable _to)public payable{
        _to.transfer(msg.value);
    }

    //cost 2300 gas
    //return boolean (false == amount not sent) (true amount was sent)
    //using payable keyword to b able to send eth
    function sendViaSend(address payable _to)public payable{
        bool result = _to.send(msg.value);
        // assert(result);
        require(result, "can't be sent");
    }

    //we can specify the cost
    //highley recommanded to use
    //using payable keyword to b able to send eth
    //empty argument trigger fallback function of recieving contract
    function sendViaCall(address payable _to) public payable{
        (bool result, bytes memory data) = _to.call.gas(1000).value(msg.value)("");
        require(result, "can't be sent");
    }
}