require("@nomiclabs/hardhat-ethers");

module.exports = {
  defaultNetwork: "",
  networks: {
    hardhat: {
    },
    matic: {
      url: '',
      accounts: [''],
    }
  },
  solidity: {
    version: "0.1.0",
    settings: {
    }
  },
  paths: {
    sources: "./contracts",
    tests: "",
    cache: "",
    artifacts: ""
  },
}