import { ethers } from "hardhat";

async function main() {

  const depositAmount = ethers.utils.parseEther("1");
  
  // ----------------- DEPLOYED HERE ----------------------
  // const Lottery = await ethers.getContractFactory("Lottery");
  // const lottery = await Lottery.deploy();
  // const lottery = await Lock.deploy(unlockTime, { value: depositAmount });
  // await lottery.deployed();
  // console.log("Lottery contract deployed at:", lottery.address);

  // ----------------- INTERACTED WITH CONTRACT  HERE ----------------------

  const CONTRACT_ADDRESS = "0x1036F9435FB7Cd302575Fb8caba523D23EeeCAA4";
  const LOTTERY = await ethers.getContractAt("ILottery", CONTRACT_ADDRESS, );
  // await LOTTERY.deposit({ value: depositAmount});
  await LOTTERY.checkLotteryBalance();
  // await LOTTERY.checkWinnerBalancdeposit({ value: depositAmount});
  // await LOTTERY.checkNoOfPlayers();

  // ----------------- CONTRACT ADDRESS AND  TRANSACTION HASH HERE HERE ----------------------
  // - CONTRACT ADDRESS ON ROPSTEN : 0x1036F9435FB7Cd302575Fb8caba523D23EeeCAA4
  // - TRANSACTION HASH(DEPOSIT FUNCTION) : 0x5fa85fbfe2bebde15cc20ce2891e230eef42e954c79dfa5d36f546ff0ec3f149

}


// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
