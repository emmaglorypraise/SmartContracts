// SPDX-License-Identifier: MIT

pragma solidity 0.8.10;

library CalculationLIbrary {
  function multiply(uint a, uint b) pure internal returns (uint result) {
    return(a * b);
  }
  function add(uint a, uint b) pure internal returns (uint result) {
    return(a + b);
  }
  function sub(uint a, uint b) pure internal returns (uint result) {
    return(a - b);
  }
  function div(uint a, uint b) pure internal returns (uint result) {
    return(a / b);
  }

}

contract UsingLibrary {

  using CalculationLIbrary for uint;

  address owner = address(this);

  function multiply(uint a, uint b) pure public returns (uint) {
    return a.multiply(b);
  }
  function add(uint a, uint b) pure public returns (uint) {
    return a.multiply(b);
  }
  function sub(uint a, uint b) pure public returns (uint) {
    return a.multiply(b);
  }
  function div(uint a, uint b) pure public returns (uint) {
    return a.multiply(b);
  }
}