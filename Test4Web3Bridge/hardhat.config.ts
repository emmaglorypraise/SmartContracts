import "@nomiclabs/hardhat-ethers";
import "@nomiclabs/hardhat-etherscan";
require("dotenv").config({ path: ".env" });

const ETHEREUM_MAINNET_API_KEY_URL = process.env.ETHEREUM_MAINNET_API_KEY_URL;

const ROPSTEN_API_KEY_URL = process.env.ROPSTEN_API_KEY_URL;

const ROPSTEN_PRIVATE_KEY = process.env.ROPSTEN_PRIVATE_KEY;

const API_TOKEN = process.env.API_TOKEN;

// const ETHEREUM_MAINNET_API_KEY_URL = "https://mainnet.infura.io/v3/7e0349ac80744375934bcf0ae67a9a9c";


module.exports = {
  solidity: "0.8.10",
  networks: {
    hardhat: {
      forking: {
        url: ETHEREUM_MAINNET_API_KEY_URL,
      },
    },
    ropsten: {
      url: ROPSTEN_API_KEY_URL,
      accounts: [ROPSTEN_PRIVATE_KEY],
  }
  },
  etherscan: {
    apiKey: API_TOKEN
  },
  lockGasLimit: 200000000000,
  gasPrice: 10000000000,
};