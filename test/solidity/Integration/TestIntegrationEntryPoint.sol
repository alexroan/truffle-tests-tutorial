pragma solidity >=0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../../../contracts/Background.sol";
import "../../../contracts/EntryPoint.sol";

contract TestIntegrationEntryPoint {

    BackgroundTest public backgroundTest;
    EntryPoint public entryPoint;

    // Run before every test function
    function beforeEach() public {
        backgroundTest = new BackgroundTest();
        entryPoint = new EntryPoint(address(backgroundTest));
    }

    // Check that storeTwoValues() works correctly.
    // EntryPoint contract should call background.storeValue()
    // so we use our mock extension BackgroundTest contract to
    // check that the integration workds
    function testItStoresTwoValues() public {
        uint value1 = 5;
        uint value2 = 20;
        entryPoint.storeTwoValues(value1, value2);
        uint result1 = backgroundTest.values(0);
        uint result2 = backgroundTest.values(1);
        Assert.equal(result1, value1, "Value 1 should be correct");
        Assert.equal(result2, value2, "Value 2 should be correct");
    }

    // Check that entry point calls our mock extension correctly
    // indicating that the integration between contracts is working
    function testItCallsGetNumberOfValuesFromBackground() public {
        uint result = entryPoint.getNumberOfValues();
        Assert.equal(result, 999, "It should call getNumberOfValues");
    }
}

// Extended from Background because values is private in actual Background
// but we're not testing background in this unit test
contract BackgroundTest is Background {
    uint[] public values;

    function storeValue(uint value) public {
        values.push(value);
    }

    function getNumberOfValues() public view returns(uint) {
        return 999;
    }
}