const { expect } = require('chai');
const { ethers } = require('hardhat');

describe('DCarroApp', function () {
  it('Owner should set user data', async function () {
    const Contract = await ethers.getContractFactory('DCarroApp');
    const contract = await Contract.deploy();
    await contract.deployed();

    const setUserDataTx = await contract.setUserData(
      'Eric',
      'Pluto',
      '0132228888'
    );

    // wait until the transaction is mined
    await setUserDataTx.wait();

    expect(await contract.getUserName()).to.equal('Eric');
    expect(await contract.getUserLocation()).to.equal('Pluto');
    expect(await contract.getUserContact()).to.equal('0132228888');

    const [owner, addr1, addr2] = await ethers.getSigners();

    await expect(
      contract.connect(addr1).setUserData('Heimdall', 'Asgard', '0132222222')
    ).to.be.revertedWith('Only owner access');
  });
});
