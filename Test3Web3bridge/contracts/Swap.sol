// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;


import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// token 1 - 0xd8b934580fcE35a11B58C6D73aDeE468a2833fa8
// owner 1 - 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4

// token 2 - 0x652c9ACcC53e765e1d96e2455E618dAaB79bA595
// owner 2 - 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2

// amount - 10000000000000000000000

contract TOKEN1 is ERC20("Token1", "TK1"){
  constructor(){
    _mint(msg.sender, 10000 * 10 ** 18); 
  }

  function transferToken1(address _sender1, address _receiver1, uint _amount1) internal {
        transferFrom(_sender1, _receiver1, _amount1);
  }
  // 
}

contract TOKEN2 is ERC20("Token2", "TK2"){
  constructor(){
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

  function createOrder(uint _id,uint _amountToSWap, address _tokenAddressToReceieve)  public {
    order storage initiateSwap = trackOrder[_id];
    initiateSwap.amountToSWap = _amountToSWap;
    initiateSwap.amountToreceive = _amountToSWap * 2;
    initiateSwap.ID ++;
    initiateSwap.tokenAddressToReceieve =_tokenAddressToReceieve;
  }

  function transfer(
        address sender,
        address recipient,
        uint amount
  ) private {
        bool sent = transfer(sender, recipient, amount);
        require(sent, "Token transfer failed");
  }
  // function swap()  public {
  //   require(msg.sender == owner1 || msg.sender == owner2, "Not authorized to swap!");
  //   transferToken1(owner1, owner2, amount1);
  //   transferToken2(owner2, owner1, amount2);
  // }

  function executeOrder(uint _orderID)  public {
    require(msg.sender == owner1 || msg.sender == owner2, "Not authorized to swap!");
    require(
            token1.allowance(owner1, address(this)) >= amount1,
            "Token 1 allowance too low"
    );
    require(
        token2.allowance(owner2, address(this)) >= amount2,
        "Token 2 allowance too low"
    );

    order storage executeSwap = trackOrder[_orderID];
    
    uint amountToSWap = executeSwap.amountToSWap;
    // guards against re-entrancy
    executeSwap.amountToSWap = 0;
    transfer(owner1, owner2, amountToSWap);

    uint amountToReceive = executeSwap.amountToSWap;
    address tokenAddressToReceieve = executeSwap.tokenAddressToReceieve;
    // guards against re-entrancy
    executeSwap.amountToreceive = 0;
    transfer( owner2, tokenAddressToReceieve, amountToReceive);
   

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