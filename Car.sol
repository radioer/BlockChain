pragma solidity >0.4.22;

contract Car{
    string brand;
    uint public price;
    function setBrand(string memory newBrand) public {
        brand = newBrand;
    }
    function setPrice(uint newPrice) public {
        price = newPrice;
    }

}