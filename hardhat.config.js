require("@nomiclabs/hardhat-ethers");

module.exports = {
  defaultNetwork: "matic",
  networks: {
    hardhat: {
    },
    matic: {
      url: 'https://polygon-mainnet.g.alchemy.com/v2/v3iUUC2ANxbDE-XodD-FcbZi1iGvWTdR',
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