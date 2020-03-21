pragma solidity >=0.5.0;

import "./Background.sol";

contract EntryPoint {
    address public backgroundAddress;

    constructor(address _background) public{
        backgroundAddress = _background;
    }

    function getBackgroundAddress() public view returns (address) {
        return backgroundAddress;
    }

    function storeTwoValues(uint first, uint second) public {
        Background(backgroundAddress).storeValue(first);
        Background(backgroundAddress).storeValue(second);
    }

    function getNumberOfValues() public view returns (uint) {
        return Background(backgroundAddress).getNumberOfValues();
    }
}