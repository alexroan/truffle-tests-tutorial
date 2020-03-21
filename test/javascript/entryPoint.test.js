const EntryPoint = artifacts.require("./EntryPoint.sol");

require('chai')
    .use(require('chai-as-promised'))
    .should();

contract("EntryPoint", accounts => {
    describe("Storing Values", () => {
        it("Stores correctly", async () => {
            const entryPoint = await EntryPoint.deployed();

            let numberOfValues = await entryPoint.getNumberOfValues();
            numberOfValues.toString().should.equal("0");

            await entryPoint.storeTwoValues(2,4);
            numberOfValues = await entryPoint.getNumberOfValues();
            numberOfValues.toString().should.equal("2");
        });
    });
});