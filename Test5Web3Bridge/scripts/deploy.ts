import { ethers } from "hardhat";
require("dotenv").config({ path: ".env" });

async function main() {

  // ----------------- DEPLOY SCRIPT HERE ----------------------

  // const MYNFT = await ethers.getContractFactory("MYNFT");
  // const nft = await MYNFT.deploy();

  // await nft.deployed();

  // console.log("My NFT contract deployed at:", nft.address);


  // ----------------- INTERACTED WITH CONTRACT  HERE ----------------------

  // GOERLI CONTRACT ADDRESS: 0x1036F9435FB7Cd302575Fb8caba523D23EeeCAA4;
  // RINKEBY CONTRACT ADDRESS: 0xcf8eB37EC1Be61A4A26C093E99bE0435cca4E118;
  // OPENSEA LINK: https://testnets.opensea.io/assets/rinkeby/0xcf8eb37ec1be61a4a26c093e99be0435cca4e118/0


  const CONTRACT_ADDRESS = "process.env.CONTRACT_ADDRESS";
  const WALLET_ADDRESS = "process.env.CONTRACT_ADDRESS";
  const PINATA_CID = "process.env.PINATA_CID";


  const MYDEPLOYEDNFT = await ethers.getContractAt("IMYNFT", CONTRACT_ADDRESS );
  await MYDEPLOYEDNFT.safeMint(WALLET_ADDRESS, PINATA_CID);
  await MYDEPLOYEDNFT.tokenURI(1)

}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
