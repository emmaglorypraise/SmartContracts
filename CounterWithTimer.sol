// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Counter {
    uint256 count;
    uint256 time;
    uint256 deadline = block.timestamp + 30 seconds;
    error timeUp(string);

    modifier checkTime{
        if (block.timestamp > deadline) {
            revert timeUp("Please wait for 30 seconds");
        }

        if (deadline - block.timestamp == 0 ){
            revert timeUp("Time up, wait for 30 minutes");
        }
        
        _;
    }

    function Increase() public checkTime {
        count++;
    }

    function Decrease() public checkTime {
        count--;
    }

    function ViewCounter() public view returns(uint256) {
        return count;
    }

    function returnRemainingTime() public view returns(uint256){
        return deadline - block.timestamp;
    }

    function BlockTimeStamp() public view returns(uint256){
        return block.timestamp;
    }

  
}