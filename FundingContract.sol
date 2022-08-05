// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

    /// @title Funding Contract

    /// @author Glory Praise Emmanuel

contract sendFundsContract {

    mapping(address => uint256) balances;

    // @dev send function to contract
    function sendFunds() public payable{
        require(msg.value < 0, "please send us money ogben");
        balances[msg.sender] += msg.value;

    }

    // @dev show amount staked by address
    function showAddressBalance() public view returns( uint) {
        return balances[msg.sender];
    }

    // @dev show total money put in contract
    function showContractBalance() public view returns (uint){
        return address(this).balance;
    }



}
    


   