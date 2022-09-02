pragma solidity ^0.4.0;

contract zhongchou {

    struct needer{
        address neederAddress;
        uint goal;
        uint amount;

        uint funderCount;
        mapping(uint => funder) funderMap;  
    }

    struct funder {
        address funderAddress;
        uint toMoney;
    }

    uint neederAmount;
    mapping(uint => needer) neederMap;

    function NewNeeder(address _needAddress, uint _goal) public {

        neederAmount++;
        neederMap[neederAmount] = needer(_needAddress, _goal, 0, 0);

    }

    function contribute(address _address, uint _neederAmount) public payable{
        needer storage _needer = neederMap[_neederAmount];
        _needer.amount += msg.value;
        _needer.funderCount++;
        _needer.funderMap[_needer.funderCount] = funder(_address, msg.value);
    }

    function IsComplete(uint _neederAmount) public {
        needer storage _needer = neederMap[_neederAmount];

        if (_needer.amount >= _needer.goal) { 
            _needer.neederAddress.transfer(_needer.amount);
        }
    }

    function test() public view returns(uint, uint, uint) {
        return (neederMap[1].goal, neederMap[1].amount, neederMap[1].funderCount);
    }
}