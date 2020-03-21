pragma solidity >=0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../../../contracts/Background.sol";

contract TestBackground {

    Background public background;

    function beforeEach() public {
        background = Background(DeployedAddresses.Background());
    }

    function testItStoresAValue() public {
        uint value = 5;
        background.storeValue(value);
        uint result = background.getValue(0);
        Assert.equal(result, value, "It should store the correct value");
    }

    function testItGetsCorrectNumberOfValues() public {
        uint currentSize = background.getNumberOfValues();
        background.storeValue(99);
        uint newSize = background.getNumberOfValues();
        Assert.equal(newSize, currentSize + 1, "It should increase the size");
    }

    function testItStoresMultipleValues() public {
        uint currentSize = background.getNumberOfValues();
        for (uint8 i = 0; i < 10; i++) {
            uint value = i;
            background.storeValue(value);
            uint result = background.getValue(i + currentSize);
            Assert.equal(result, value, "It should store the correct value for multiple values");
        }
    }
}