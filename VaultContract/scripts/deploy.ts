import { ethers } from "hardhat";

async function main() {

  // const lockedAmount = ethers.utils.parseEther("1");

  const Vault = await ethers.getContractFactory("Vault");
  const vault = await Vault.deploy();

  await vault.deployed();

  console.log("Deployed contract successfully:", vault.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
