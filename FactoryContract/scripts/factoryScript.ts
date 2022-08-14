import { ethers } from "hardhat";

async function main() {

  let [valid1, valid2, valid3, valid4, valid5] = await ethers.getSigners();

  const MultisigFactory = await ethers.getContractFactory("MultiSigFactory");
  const multisigFactory = await MultisigFactory.deploy();

  await multisigFactory.deployed();

  let cloned = await multisigFactory.cloneMultiSig([valid1.address, valid2.address, valid3.address, valid4.address, valid5.address]);

  let cloned2 = await multisigFactory.connect(valid2).cloneMultiSig([valid1.address, valid2.address, valid3.address, valid4.address, valid5.address]);

  let cloned3 = await multisigFactory.connect(valid3).cloneMultiSig([valid1.address, valid2.address, valid3.address, valid4.address, valid5.address]);
  
  
  let result = await (await cloned.wait()).logs[0].topics.length;
  let result2 = await (await cloned2.wait()).logs[0].topics.length;
  let result3 = await (await cloned3.wait()).logs[0].topics.length;

  let clonedstuff = await multisigFactory.clonedAddresses()

  let results = await clonedstuff;
  

  console.log("Factory contract deployed to this address:", multisigFactory.address);

  console.log(result, "Factory clone successfully");
  console.log(result2, "Factory clone successfully");
  console.log(result3, "Factory clone successfully");

  console.log(results, "Factory addresses successfully");


  
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
