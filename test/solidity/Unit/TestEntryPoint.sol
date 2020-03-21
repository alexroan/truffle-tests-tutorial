pragma solidity >=0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../../../contracts/Background.sol";
import "../../../contracts/EntryPoint.sol";

contract TestEntryPoint {

    BackgroundTest public backgroundTest;
    EntryPoint public entryPoint;

    event LogInt(uint num);

    function beforeEach() public {
        backgroundTest = new BackgroundTest();
        entryPoint = new EntryPoint(address(backgroundTest));
    }

    function testItHasCorrectBackground() public {
        address expected = address(backgroundTest);
        address target = entryPoint.getBackgroundAddress();
        Assert.equal(target, expected, "It should set the correct background");
    }

    function testItStoresTwoValues() public {
        uint value1 = 5;
        uint value2 = 20;
        entryPoint.storeTwoValues(value1, value2);
        uint result1 = backgroundTest.values(0);
        uint result2 = backgroundTest.values(1);
        Assert.equal(result1, value1, "Value 1 should be correct");
        Assert.equal(result2, value2, "Value 2 should be correct");
    }

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