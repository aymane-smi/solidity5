//PSDX-License-Identifier: MIT

pragma solidity ^0.5.12;

contract Enum{
    enum Status{
        Pendding,//0
        Shipped,//1
        Accepted,//2
        Rejected,//3
        Canceled//4
    }

    Status public status;

    function ShippedAction() public{
        require(status == Status.Pendding);
        status = Status.Shipped;
    }

    function AcceptedAction() public{
        require(status == Status.Shipped);
        status = Status.Accepted;
    }

    function RejectedAction() public {
        require(status == Status.Shipped);
        status = Status.Rejected;
    }

    function CanceledAction() public{
        require(status == Status.Pendding);
        status = Status.Canceled;
    }
}