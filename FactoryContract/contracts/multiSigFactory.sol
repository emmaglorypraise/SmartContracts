// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

import "./multisig.sol";

contract MultiSigFactory {

  // a factory contract that create multiple clones of multisig.sol
  // a function that create a new multisig
  // an array that hold contact addresses created
  // a function that calls the approve function in multisig.sol 
  // a function that calls the withdraw function in multisig.sol 

  MultiSig[] MultiSigAddresses;

  event newClone(MultiSig indexed, uint position);

  function cloneMultiSig(address[] memory _validOwners)  external returns(MultiSig NewMS, uint _length) {
    NewMS = new MultiSig(_validOwners);
    MultiSigAddresses.push(NewMS);
    _length = MultiSigAddresses.length;
    emit newClone(NewMS, _length);
  }

  function clonedAddresses() external view returns (MultiSig[] memory _multisig) {
    _multisig = MultiSigAddresses;
  }

  // function name(address clonedContract) external {

  //   MultiSig
    
  // }
  
  
}