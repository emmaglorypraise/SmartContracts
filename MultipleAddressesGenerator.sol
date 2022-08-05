// using ethereumjs-wallet library

var Wallet = require('ethereumjs-wallet');

let numberOfAddress = 5;  //Number of private keys and addresses you want to generate

for (let i =  0; i <= numberOfAddress; i++) {

  const wallet = Wallet['default'].generate();
  let privateKey = wallet.getPrivateKeyString();
  let address = wallet.getAddressString();

  console.log("Private Key: " + privateKey);
  console.log("Ethereum Address: " + address);

}