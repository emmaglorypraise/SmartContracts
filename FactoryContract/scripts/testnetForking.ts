require("dotenv").config({ path: ".env" });
import { BytesLike } from "ethers";
const helpers = require("@nomicfoundation/hardhat-network-helpers");
import { ethers } from "hardhat";

async function main() {
  const _value = ethers.utils.parseEther("1");

  const CONTRACTADDRESS = "0x6e828b59fc799b6ef92e42d2f39e438a7477f469";
  const MULTISIG = await ethers.getContractAt("IMultiSig", CONTRACTADDRESS);



  const bal = await MULTISIG.contractBalance();
  console.log("contractBalance", bal);

  //2146308405940782866 old

//   contractBalance BigNumber { value: "1210000000100000000" }
// Impersonate balance BigNumber { value: "2146308405940782866" }


  //Impersonate balance2 BigNumber { value: "2145301929936085978" }
// contractBalance 2 BigNumber { value: "1210000000100000000" }

  const address = "0x88538EE7D25d41a0B823A7354Ea0f2F252AD0fAf";
  const address1 = "0x7A3E0DFf9B53fA0d3d1997903A48677399b22ce7";
  const address2 = "0x9ee15CF9EC4B3830bBedA501d85F5329Ea3C595C";
  const address3 = "0x85f20a6924A61904AB44243C7e2c771B3bE46734";
  const address4 = "0x2DBdd859D9551b7d882e9f3801Dbb83b339bFFD7";
  const address5 = "0x5D63564EeF4657F360343196A7bd86ae18d3a92A";
  const address6 = "0x12896191de42EF8388f2892Ab76b9a728189260A";
  const address7 = "0x924843c0c1105b542c7e637605f95F40FD07b4B0";
  const address8 = "0xB632cAf3119860599ce162Fad8753fc4198037b4";

  //   const addresses = [
  //     "0x7A3E0DFf9B53fA0d3d1997903A48677399b22ce7", //
  //     "0x9ee15CF9EC4B3830bBedA501d85F5329Ea3C595C", //
  //     "0x85f20a6924A61904AB44243C7e2c771B3bE46734", //
  //     "0x2DBdd859D9551b7d882e9f3801Dbb83b339bFFD7", //
  //     "0x88538EE7D25d41a0B823A7354Ea0f2F252AD0fAf", // 1
  //     "0x5D63564EeF4657F360343196A7bd86ae18d3a92A", //
  //     "0x12896191de42EF8388f2892Ab76b9a728189260A", //
  //     "0x924843c0c1105b542c7e637605f95F40FD07b4B0", //
  //     "0xB632cAf3119860599ce162Fad8753fc4198037b4",
  //     "0x20497F37a8169c8C9fA09411F8c2CFB7c90dE5d1",
  //     "0xCb3416Fc84c0e9f72F169DD8e53dBc06220591BF",
  //     "0x21c1229D4b781F4F7A95dEb4022B57f346af4CEF",
  // ]

  await helpers.impersonateAccount(address);
  const impersonatedSigner = await ethers.getSigner(address);

  let impBal = await impersonatedSigner.getBalance();
  console.log("Impersonate balance", impBal);


  await helpers.impersonateAccount(address1);
  const impersonatedSigner1 = await ethers.getSigner(address1);


  await helpers.impersonateAccount(address2);
  const impersonatedSigner2 = await ethers.getSigner(address2);


  await helpers.impersonateAccount(address3);
  const impersonatedSigner3 = await ethers.getSigner(address3);


  await helpers.impersonateAccount(address4);
  const impersonatedSigner4 = await ethers.getSigner(address4);


  await helpers.impersonateAccount(address5);
  const impersonatedSigner5 = await ethers.getSigner(address5);


  await helpers.impersonateAccount(address6);
  const impersonatedSigner6 = await ethers.getSigner(address6);


  await helpers.impersonateAccount(address7);
  const impersonatedSigner7 = await ethers.getSigner(address7);


  await helpers.impersonateAccount(address8);
  const impersonatedSigner8 = await ethers.getSigner(address8);



  // const rec = await (await MULTISIG.connect(impersonatedSigner).withdrawEther(_value)).wait();
  // console.log(rec);


  // const approve1 = await MULTISIG.connect(impersonatedSigner1).Approve(8);
  // const approve2 = await MULTISIG.connect(impersonatedSigner2).Approve(8);
  // const approve3 = await MULTISIG.connect(impersonatedSigner3).Approve(8);
  // const approve4 = await MULTISIG.connect(impersonatedSigner4).Approve(8);
  // const approve5 = await MULTISIG.connect(impersonatedSigner5).Approve(8);
  // const approve6 = await MULTISIG.connect(impersonatedSigner6).Approve(8);
  // const approve7 = await MULTISIG.connect(impersonatedSigner7).Approve(8);
  // const approve8 = await MULTISIG.connect(impersonatedSigner8).Approve(8);

  // let impBal2 = await impersonatedSigner.getBalance();
  // console.log("Impersonate balance2", impBal2);

  // const bal2 = await MULTISIG.contractBalance();
  // console.log("contractBalance 2", bal2);
  // await MULTISIG.withdrawEther(_value);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

