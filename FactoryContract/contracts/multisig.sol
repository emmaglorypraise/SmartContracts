// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.9;

  /// @title MultiSig 
  /// @author Glory Praise
  /// @dev A contract that allows 70% of validSigner to Approve before a withdrawal can be successful


contract MultiSig{

    address[] public validSigner;

    constructor(address[] memory _validSigner) {
      validSigner = _validSigner;   
    }

  // function withdrawEther(uint amount) external {
    
  // }

  // function Owners() private view returns (bool) {
  //   // for(uint i = 0; i < validSigner.length; i++) {
  //   //   if (msg.sender )
  //   // }
    
  // }

}
