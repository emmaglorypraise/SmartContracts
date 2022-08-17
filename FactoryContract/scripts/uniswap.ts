import { ethers } from "hardhat";

async function main() {
  //interact with uniswap swapTokenforExactToken function
  //swap usdt to dai
  //TO-DO
  //erc20 token interface
  //Approve the uniswap contract
  //check balance of signer before swap
  //swap token caling the function
  //check balance after swap.

  const USCAddress = "0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48";
  const USDTAddress = "0xdAC17F958D2ee523a2206206994597C13D831ec7";
  const UNIRouter = "0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D";
  const amountOut = 2e6;
  const amountInMax = 3e6;

  const helpers = require("@nomicfoundation/hardhat-network-helpers");
  const USCHolder = "0xf584f8728b874a6a5c7a8d4d387c9aae9172d621";
  await helpers.impersonateAccount(USCHolder);
  const impersonatedSigner = await ethers.getSigner(USCHolder);

  const USC = await ethers.getContractAt(
    "IERC20",
    USCAddress,
    impersonatedSigner
  );
  const USDT = await ethers.getContractAt("IERC20", USDTAddress);
  const ROUTER = await ethers.getContractAt(
    "IUniswap",
    UNIRouter,
    impersonatedSigner
  );

  const USCBal = await USC.balanceOf(USCHolder);
  const USDTBal = await USDT.balanceOf(USCHolder);

  console.log("balance before swap", USCBal, USDTBal);


  await USC.approve(UNIRouter, amountInMax);

  const result = await ROUTER.swapTokensForExactTokens(
    amountOut,
    amountInMax,
    [USCAddress, USDTAddress],
    USCHolder,
    1660681746
  );

  console.log(result.wait());

    const USCBalAfter = await USC.balanceOf(USCHolder);
    const USDTBalAfter = await USDT.balanceOf(USCHolder);

    console.log("balance after swap", USCBalAfter, USDTBalAfter);
}

//USC be4   149376718595560
//USDT       500002764750

//USC after 149376716590810
//USDT       500004764750

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});