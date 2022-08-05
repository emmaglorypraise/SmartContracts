// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

    /// @title Stake Contract

    /// @author Glory Praise Emmanuel

contract stakeContract {

    // @dev Collect funds in a payable `stake()` function and track individual `balances` with a mapping:
    mapping(address => uint256) balances;

    // Make sure to add a `Stake(address,uint256)` event and emit it 
    event StakeEvent(address, uint256);

    // @dev withdraw modifier
    modifier DeadlineCheck {
        require(block.timestamp > deadline, "Wait for maturity time na");
        _;
    }

    // After some `deadline` allow anyone to call an `execute()` function
    uint deadline = block.timestamp + 5 minutes;

    // @dev stake function
    function stake(address _address, uint256 _amount) public payable{
        require(_amount > 0, "No amount staked biko, stake funds ogben");
        balances[_address] += _amount;

        emit StakeEvent(_address, _amount);
    }

    // @dev show amount staked by address
    function showStakedAmount(address _address) public view returns( uint) {
        return balances[_address];
    }

    // @dev show total money staked
    function stakePoolBalance() public view returns (uint){
        return address(this).balance;
    }

    // Add a `timeLeft()` view function that returns the time left before the deadline for the frontend
    function timeLeft() public view returns(uint256) {
        return deadline - block.timestamp;
    }


    // If the `threshold` was not met, allow everyone to call a `withdraw()` function
    // Add a `withdraw()` function to let users withdraw their balance
    function withdraw(address _address, uint256 _amount) public DeadlineCheck {
        require(balances[_address] < 0, "You don't have a stake");
        require(balances[_address] < _amount, "You stake less than this na, you be thief?");

        payable (_address).transfer(_amount);
    }

    // Add the `receive()` special function that receives eth and calls stake()
    receive() payable external {
        stake(msg.sender, msg.value);
    }

}