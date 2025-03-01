module.exports = {
  networks: {
    development: {
      host: "127.0.0.1", // Ganache runs locally
      port: 8545,        // Default Ganache port
      network_id: "*",   // Match any network
      gas: 6721975, // Increase if needed
      gasPrice: 20000000000
    },
  },
  compilers: {
    solc: {
      version: "0.8.0", // Use Solidity version compatible with your contract
},
},
};