import "@nomiclabs/hardhat-ethers";
import "@nomiclabs/hardhat-etherscan";
require("dotenv").config({ path: ".env" });

const ETHEREUM_MAINNET_API_KEY_URL = process.env.ETHEREUM_MAINNET_API_KEY_URL;

const ALCHEMY_RINKEBY_API_KEY_URL = process.env.ALCHEMY_RINKEBY_API_KEY_URL;

const GOERLI_API_KEY_URL = process.env.GOERLI_API_KEY_URL;

const GOERLI_PRIVATE_KEY = process.env.GOERLI_PRIVATE_KEY;

const API_TOKEN = process.env.API_TOKEN;

module.exports = {
  solidity: "0.8.10",
  networks: {
    hardhat: {
      forking: {
        url: ETHEREUM_MAINNET_API_KEY_URL,
      },
    },
    goerli: {
      url: GOERLI_API_KEY_URL,
      accounts: [GOERLI_PRIVATE_KEY],
  },
  rinkeby: {
    url: ALCHEMY_RINKEBY_API_KEY_URL,
    accounts: [GOERLI_PRIVATE_KEY],
  }
  },
  etherscan: {
    apiKey: API_TOKEN
  },
  lockGasLimit: 200000000000,
  gasPrice: 10000000000,
};