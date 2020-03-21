pragma solidity >=0.5.0;

import "./Background.sol";

contract EntryPoint {
    Background public background;

    constructor(address _background) public{
        background = Background(_background);
    }

    function storeTwoValues(uint first, uint second) public {
        background.storeValue(first);
        background.storeValue(second);
    }

    function getNumberOfValues() public view returns (uint) {
        return background.getNumberOfValues();
    }
}