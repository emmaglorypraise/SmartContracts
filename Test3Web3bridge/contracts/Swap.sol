// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;


import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract TOKEN1 is ERC20("Token1", "TK1"){
  function mintOne() internal {
        _mint(msg.sender, 10000 * 10 ** 18);
  }
  function transferToken1(address _sender1, address _receiver1, uint _amount1) internal {
        transferFrom(_sender1, _receiver1, _amount1);
  }
  // 
}

contract TOKEN2 is ERC20("Token2", "TK2"){
  function mintTwo() internal {
        _mint(msg.sender, 10000 * 10 ** 18);
  }
  function transferToken2(address _sender2, address _receiver2, uint _amount2) internal {
       transferFrom(_sender2, _receiver2, _amount2);
  }
}

contract Swap {

    IERC20 public token1;
    address public owner1;
    uint public amount1;
    IERC20 public token2;
    address public owner2;
    uint public amount2;

    constructor(
        address _token1,
        address _owner1,
        uint _amount1,
        address _token2,
        address _owner2,
        uint _amount2
    ) {
        token1 = IERC20(_token1);
        owner1 = _owner1;
        amount1 = _amount1;
        token2 = IERC20(_token2);
        owner2 = _owner2;
        amount2 = _amount2;

    }


    uint tokenAprice = 5;
    uint tokenBprice = 20;
    

  struct order {

    address tokenAddressToSwap;
    uint amountToSWap;

    address tokenAddressToReceieve;
    uint amountToreceive;
    bool swapped;

    uint ID;
    uint deadline;
  }

  mapping (uint => order) public trackOrder;

  function createOrder(uint _amountToSWap)  public {
    uint ID = 1;
    order storage initiateSwap = trackOrder[ID];
    initiateSwap.amountToSWap = _amountToSWap;
    initiateSwap.amountToreceive = _amountToSWap * 2;
    initiateSwap.tokenAddressToReceieve =_tokenAddressToReceieve;
    ID++;
  }

  function swap()  public {
    require(msg.sender == owner1 || msg.sender == owner2, "Not authorized to swap!");
    transferToken1(owner1, owner2, amount1);
    transferToken2(owner2, owner1, amount2);
  }


  function executeOrder(uint _orderID)  public {
    order storage executeSwap = trackOrder[_orderID];
    uint amountToSWap = executeSwap.amountToSWap;
    transferFrom(token1, owner1, owner2, amountToSWap)
    executeSwap.amountToSWap = 0;

    uint amountToReceive = executeSwap.amountToSWap;
    uint tokenAddressToReceieve = executeSwap.tokenAddressToReceieve;
    transferFrom(token2, owner2, tokenAddressToReceieve, amountToReceive);
    executeSwap.amountToreceive = 0;

  }

  function transferFrom(
        IERC20 token,
        address sender,
        address recipient,
        uint amount
    ) private {
        bool sent = token.transferFrom(sender, recipient, amount);
        require(sent, "Token transfer failed");
  }

  // function priceOracle() returns(){
  // }

  receive() external payable {
  }

  fallback() external payable{
  }
}