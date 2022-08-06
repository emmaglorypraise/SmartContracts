// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.4;

/// @author Glory Praise Emmanuel
///  @title Vibes ERC20Token
///  @notice An ERC20 Token using Openszeppelin contract that mints to contract, and has a withdraw function to transfer tokens to another address

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract ERC20Token is ERC20("Vibes", "VI"){
  constructor() {
      _mint(address(this), 10000e18);
  }
  

  function withdrawFromContract(address _to, uint _amount) public {
      uint currentBalance = balanceOf(address(this));
      uint withdrawAmount = _amount;
      require(currentBalance >= withdrawAmount, "Not enough money to transfer");
      _transfer(address(this), _to, withdrawAmount);
  }

  function sentBalance(address _address) public view returns(uint){
      return balanceOf(_address);
  }

   function contractBalance() public view returns(uint){
      return balanceOf(address(this));
  }

}