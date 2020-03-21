pragma solidity >=0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../../../contracts/Background.sol";

contract TestBackground {

    Background public background;

    // Run before every test function
    function beforeEach() public {
        background = new Background();
    }

    // Test that it stores a value correctly
    function testItStoresAValue() public {
        uint value = 5;
        background.storeValue(value);
        uint result = background.getValue(0);
        Assert.equal(result, value, "It should store the correct value");
    }

    // Test that it gets the correct number of values
    function testItGetsCorrectNumberOfValues() public {
        background.storeValue(99);
        uint newSize = background.getNumberOfValues();
        Assert.equal(newSize, 1, "It should increase the size");
    }

    // Test that it stores multiple values correctly
    function testItStoresMultipleValues() public {
        for (uint8 i = 0; i < 10; i++) {
            uint value = i;
            background.storeValue(value);
            uint result = background.getValue(i);
            Assert.equal(result, value, "It should store the correct value for multiple values");
        }
    }
}