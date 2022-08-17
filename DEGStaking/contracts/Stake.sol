// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// import "@openzeppelin/contracts/token/ERC20/ERC20Detailed.sol";

/// @dev Glory Praise Emmanuel
/// @title Staking contract with Yield Calculation
/// @notice This is a staking contract that users stake and specify the days they intend to stake and they will get and APY depending on the number of days and amount of token they staked

/// @dev Contract problem and solution
//   When you deposit $ETH to the staking contract there is an annual yield of 20%. This yield is paid out in $ETH . In return you will receive the exact same amount of deposited $ETH in $DEG. $DEG can be considered a placeholder token instead of the deposited $ETH. 

// Example:  Let's say you deposit 100 $ETH to the staking contract for a period of 14 days. Directly upon depositing 100 $ETH you receive 100 $DEG to your wallet. Once the 14 days are over and you withdraw your stake, you will: 

// 1. Deposit 100 $DEG back to the contract in the same transaction
// 2. Receive 100 $ETH back to your wallet
// 3. Receive your staking yield in $ETH 

// The staking yield can be calculated according to this formula: 

// 14: Staking duration in days
// 100: Number of $ETH Staked

// 14÷365≈0,0384 → 0,0384×100≡3.84 $D

contract DEGTOKEN is ERC20("DEGEN", "DEG"){
  // constructor("DEGEN", "DEG") public {
  //   // _mint(address(this), 10000 * 10 * 18);
  // }

  function mint(uint _amount) internal {
        _mint(
          msg.sender, _amount);
  }
  
}

contract DEGStaking is DEGTOKEN {
  
  uint noOfDays;
  uint amountStaked;
  uint deadline;
  uint yearsLater;
  uint public yield;

  mapping (address => uint) public DEGBalance;

  modifier deadlineCheck {
     require(block.timestamp > noOfDays, "Deadline not reached yet");
    _;
  }

  function checkContractETHBalance() public view returns(uint){
    return address(this).balance;
  }

  function staking(uint _days) public payable {
    require(msg.value > 0, "You need to stake more that 1ETH");
    require(_days > 0, "staking period must be more than 0 days");

    DEGBalance[msg.sender] += msg.value;

    amountStaked += msg.value;
    noOfDays = block.timestamp + (_days * 1 days);
    yearsLater = block.timestamp + 365 days;

    mint(msg.value);
  
  }

  function withdraw() public deadlineCheck payable {

    require(amountStaked > 0, "You dont have a stake yet");
    require(balanceOf(msg.sender) >= amountStaked, "You don't use our token, nothing for you");
    
    uint availableDEG = DEGBalance[msg.sender];
    DEGBalance[msg.sender] -= availableDEG;

    yield = calculateYield(noOfDays, amountStaked, yearsLater);
    uint totalMoneyToSend = availableDEG + yield;

    DEGBalance[msg.sender] = 0;

    _transfer(msg.sender, address(this), DEGBalance[msg.sender]);
    payable (msg.sender).transfer(totalMoneyToSend);

  }

  function calculateYield(uint _days, uint stakedAmount, uint _yearsLater) private returns(uint)  {
     uint calculatedYield = _days/ _yearsLater;
     yield = calculatedYield * stakedAmount;
     return yield;
  }

  receive() external payable {
    
  }
}