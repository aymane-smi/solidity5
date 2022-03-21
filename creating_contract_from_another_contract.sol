//PSDX-lICENSE-Identifier: MIT

pragma solidity ^0.5.12;

contract Car{
    string public model;
    address public owner;

    constructor(address _addr, string memory _model)public payable{
        owner = _addr;
        model = _model;
    }
}

contract CarFactory{
    Car[] public cars;

    function create(string memory _model)public{
        Car car = new Car(address(this), _model);
        cars.push(car);
    }

    function createAndSendEther(address _owner, string memory _model) public payable{
        Car car = (new Car).value(msg.value)(_owner, _model);
    }
}