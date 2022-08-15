import "@nomiclabs/hardhat-ethers";
import "@nomiclabs/hardhat-etherscan";
require("dotenv").config({ path: ".env" });
// import * as dotenv from "dotenv";

// dotenv.config()

const ROPSTEN_API_KEY_URL = process.env.ROPSTEN_API_KEY_URL;

const ROPSTEN_PRIVATE_KEY = process.env.ROPSTEN_PRIVATE_KEY;


module.exports = {
  solidity: "0.8.10",
  networks: {
    hardhat: {
      forking: {
        url: ROPSTEN_API_KEY_URL,
      },
    },
    ropsten: {
      url: ROPSTEN_API_KEY_URL,
      accounts: [ROPSTEN_PRIVATE_KEY],
    }
  }
};