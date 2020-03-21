const Background = artifacts.require("Background");
const EntryPoint = artifacts.require("EntryPoint");

module.exports = async function(deployer) {
    const accounts = await web3.eth.getAccounts();
    let deployedBackground = await deployer.deploy(Background);
    await deployer.deploy(EntryPoint, deployedBackground.address);
};