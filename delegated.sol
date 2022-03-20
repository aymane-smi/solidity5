//PSDX-lICENSE-Identifier: MIT

pragma solidity ^0.5.11;

contract B{
    uint public num;
    address public sender;
    uint public amount;

    function setVars(uint x)public payable{
        num = x;
        sender = msg.sender;
        amount = msg.value;
    }
}

contract B2{
    uint public num;
    address public sender;
    uint public amount;

    function setVars(uint x)public payable{
        num = x*2;
        sender = msg.sender;
        amount = msg.value;
    }
}

contract A{
    uint public num;
    address public sender;
    uint public amount;
    function setVars(address _to, uint x)public payable{
        (bool result, bytes memory data) = _to.delegatecall(
            abi.encodeWithSignature("setVars(uint256)", x)
        );
    }
}