import { ethers } from "hardhat";
const helpers = require("@nomicfoundation/hardhat-network-helpers");

async function main() {
  //Interact with two uniswap function
  //1. function swapExactTokensForTokens
  //2. function addLiquidity

  // ----------------- CONSTANTS ----------------------

  const USDCAddress = "0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48";
  const USDTAddress = "0xdAC17F958D2ee523a2206206994597C13D831ec7";
  const UNIRouter = "0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D";
  // const amountOut =   ethers.utils.parseUnits("1800", "6");
  const amountIn =   ethers.utils.parseUnits("1800", "6");

  // 2e6;
  // const amountInMax =   ethers.utils.parseUnits("2000", "6");
  const amountOutMin =   ethers.utils.parseUnits("10", "6");

  const amountADesired = 200;
  const amountBDesired = 800;
  const amountAMin = 1;
  const amountBMin = 1;

  // 3e6;
  // ethers.utils.parseUnits("2000", "18");

  // ----------------- IMPERSONATE SIGNER ON MAINNET ----------------------

  const USDCHolder = "0xf584f8728b874a6a5c7a8d4d387c9aae9172d621";

  await helpers.impersonateAccount(USDCHolder);
  const impersonatedSigner = await ethers.getSigner(USDCHolder);

  const USDC = await ethers.getContractAt(
    "IERC20",
    USDCAddress,
    impersonatedSigner
  );
  const USDT = await ethers.getContractAt("IERC20", USDTAddress);
  const ROUTER = await ethers.getContractAt(
    "IUniswap",
    UNIRouter,
    impersonatedSigner
  );

  const USDCBal = await USDC.balanceOf(USDCHolder);
  const USDTBal = await USDT.balanceOf(USDCHolder);
  // const deadline = Math.floor(Date.now() / 1000) + (60 * 10);
  const deadline = 1660927660;

  console.log("USDC before swap", USDCBal);
  console.log("USDT before swap", USDTBal);


 

  // ----------------- SWAP EXACT TOKEN TO TOKEN ----------------------

  await USDC.approve(UNIRouter, amountIn);

  const result = await ROUTER.swapExactTokensForTokens(
    amountIn,
    amountOutMin,
    [USDCAddress, USDTAddress],
    USDCHolder,
    deadline
  );

  console.log(result.wait());

  const USDCBalAfter = await USDC.balanceOf(USDCHolder);
  const USDTBalAfter = await USDT.balanceOf(USDCHolder);
  
  console.log("USDC after swap", USDCBalAfter);
  console.log("USDT after swap", USDTBalAfter);



  // ----------------- ADD LIQUIDITY FUNCTION ----------------------

  // const result2 = await ROUTER.addLiquidity(
  //   USDCAddress,
  //   USDTAddress,
  //   amountADesired,
  //   amountBDesired,
  //   amountAMin,
  //   amountBMin,
  //   USDCHolder,
  //   deadline
  // );

  // console.log("Liquidity added:", result2.wait());



}

// RESULTS FROM MAINNET FORKING
//USC be4   149376718595560
//USDT       500002764750

//USC after 149376716590810
//USDT       500004764750

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});