// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

interface IMultiSig {
  function withdrawEther(uint256 _amount) external;
  function Approve(uint256 id) external;
  function contractBalance() external view returns(uint);
}