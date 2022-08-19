// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

interface IMYNFT {
   function safeMint(address to, string memory uri) external;
   function tokenURI(uint256 tokenId) external returns (string memory);
}