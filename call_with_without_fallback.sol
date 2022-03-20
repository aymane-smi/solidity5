//PSDX-License-Identifier: MIT

pragma solidity  ^0.5.11;

contract Recieve{
    event Receive(address addr, uint amount, string text);
    function() external payable{
        emit Receive(msg.sender, msg.value, "Fallback was called");
    }

    function foo(string memory text, uint x)public payable returns(uint){
        emit Receive(msg.sender, msg.value, text);
        return x+1;
    }
}

contract Send{
    event Response(bool result, bytes data);
    //in data function we must pass types as there default value i.e: uint256(not uint), int256(not int)...
    function CallExist(address payable _to)public payable{
        (bool result, bytes memory data) = _to.call.gas(5000).value(msg.value)(
            abi.encodeWithSignature("foo(string,uint256)", "calling foo in recive contract", 123)
        );
        emit Response(result, data);
    }

    function CallNotExist(address payable _to)public payable{
        (bool result, bytes memory data) = _to.call(
            abi.encodeWithSignature("notExistingFoo()")
            );
        emit Response(result, data);
    }
}