require("dotenv").config({ path: ".env" });
import { BytesLike } from "ethers";
import { ethers } from "hardhat";

async function main() {
  let provider = {
    PrivateKey: process.env.ROPSTEN_PRIVATE_KEY as BytesLike,
    URL: process.env.ROPSTEN_API_KEY_URL,
  };
  const provider2 = ethers.getDefaultProvider("ropsten", provider.URL);
  let wallet = new ethers.Wallet(provider.PrivateKey, provider2);
  const _value = ethers.utils.parseEther("1");

  const CONTRACTADDRESS = "0x6e828b59fc799b6ef92e42d2f39e438a7477f469";
  const MULTISIG = await ethers.getContractAt("IMultiSig", CONTRACTADDRESS);
    // await wallet.sendTransaction({ to: CONTRACTADDRESS, value: _value });
    // console.log();
    // console.log("contractBalanc", await MULTISIG.contractBalance());

  await MULTISIG.withdrawEther(_value);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

