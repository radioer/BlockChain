pragma solidity ^0.4.17;

contract Facucet {
    function withdraw(uint amount) public {
        require(amount <= 1000000000000000000);
        msg.sender.transfer(amount);
    }
    function () public payable{}
}