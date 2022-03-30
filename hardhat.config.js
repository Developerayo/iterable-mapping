require("@nomiclabs/hardhat-ethers");

module.exports = {
  defaultNetwork: "matic",
  networks: {
    hardhat: {
    },
    matic: {
      url: '',
      accounts: [''],
    }
  },
  solidity: {
    version: "0.8.0",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200
      }
    }
  },
  paths: {
   
  },
  mocha: {
    timeout: 20000
  }
}