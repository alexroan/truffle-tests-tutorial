pragma solidity >=0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../../../contracts/Background.sol";
import "../../../contracts/EntryPoint.sol";

contract TestEntryPoint {

    // Ensure that dependency injection working correctly
    function testItHasCorrectBackground() public {
        Background backgroundTest = new Background();
        EntryPoint entryPoint = new EntryPoint(address(backgroundTest));
        address expected = address(backgroundTest);
        address target = entryPoint.getBackgroundAddress();
        Assert.equal(target, expected, "It should set the correct background");
    }

}