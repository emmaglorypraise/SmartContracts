import "@nomiclabs/hardhat-ethers";
import "@nomiclabs/hardhat-etherscan";
require("dotenv").config({ path: ".env" });

const ALCHEMY_RINKEBY_API_KEY_URL = process.env.ALCHEMY_RINKEBY_API_KEY_URL;

const RINKEBY_PRIVATE_KEY = process.env.RINKEBY_PRIVATE_KEY;

const API_TOKEN = process.env.API_TOKEN;

module.exports = {
  solidity: "0.8.9",
  networks: {
    hardhat: {
      forking: {
        url: ALCHEMY_RINKEBY_API_KEY_URL,
      },
    },
    rinkeby: {
      url: ALCHEMY_RINKEBY_API_KEY_URL,
      accounts: [RINKEBY_PRIVATE_KEY],
    }
  },
  etherscan: {
    apiKey: API_TOKEN
  }
};