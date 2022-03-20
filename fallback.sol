//PSDX-License-identifier: Mit

pragma solidity ^0.5.11;

contract fallBack{
    event Log(uint gas);

    function() external payable{
        //the fallback function is triggered whenever the fallback contract
        //send or reiceve ETH from/to another contract
        emit Log(gasleft());
    }
}
contract Sender{
    //if there is an error it will be thrown
    function Transfer(address payable _to) public payable{
        _to.transfer(msg.value);
    }

    function Call(address payable _to) public payable{
        (bool result) = _to.call.value(msg.value)("");
        require(result, "can't be sent");
    }
}