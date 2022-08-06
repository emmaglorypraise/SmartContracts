// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.4;

contract Energy{

    // should have total supply
    // transferrable
    // name
    // symbol
    // decimal
    // user balance
    // burnable - burn function


    uint constant totalSupply = 10000;
    uint circulatingSuppy;
    string constant name = "Energy";
    string constant symbol = "ERG";
    uint constant decimal = 1e18;
    address owner;


    mapping(address => uint) public _balance;

    mapping (address => mapping(address => uint)) _allowance;

    event tokenMint(address _to, uint amount);
    event _transfer(address from, address to, uint amount);

    modifier onlyOwner() {
      require(owner == msg.sender, "No permission except to owner");
      _;
      
    }

    modifier checkBalance(address _owner, uint amount)  {
      uint balance = balanceOfAddress(_owner);
      require(balance >= amount, "Insufficient funds");
      _;
    }

    constructor() {
      owner = msg.sender;
    }

    function _name() pure public returns(string memory){
        return name;
    }

    function _symbol() pure public returns(string memory){
        return symbol;
    }

    function _decimal() pure public returns(uint){
        return decimal;
    }

    function _totalSupply() pure public returns(uint){
        return totalSupply;
    }

    function mint(uint amount, address _to) public onlyOwner returns(uint){
        circulatingSuppy += amount;
        require(circulatingSuppy <= totalSupply, "Total supply of token exceeded");
        require(_to != address(0), "mint to address zero");
        uint value = amount * decimal;
        _balance[_to] += value;
        emit tokenMint(_to, value);
        return value;
    }

    function transfer(address _to, uint amount) external {
      require(_to != address(0), "mint to address zero");
      uint userBalance = _balance[msg.sender];
      require(userBalance >= amount, "Insufficient fund");

      uint burnableToken = _burn(amount);
      uint transferrable = amount - burnableToken;

      _balance[msg.sender] -= amount;
      _balance[_to] += transferrable;

      emit _transfer(msg.sender, _to, amount);

    }


    function _burn(uint amount) private returns(uint burnableToken){
      burnableToken = calculateBurn(amount);

      circulatingSuppy -= burnableToken/ decimal;
    }

    function calculateBurn(uint amount) public pure returns(uint burn){
      burn = (amount * 10)/100;
    }

    function balanceOfAddress(address who) public view returns(uint) {
      return _balance[who];
    }

    function approve(address spender, uint amount)  external  checkBalance(msg.sender, amount) {
      require(spender != address(0));
      uint allow = _allowance[msg.sender][spender];
      if(allow == 0){
        _allowance[msg.sender] [spender]= amount;
      } else {
        _allowance[msg.sender][spender] += amount;
      }
    }

    function transferFrom(address from, address _to, uint amount) external checkBalance(from, amount){
      require(_to == msg.sender, "Not an approved spender");
      uint allowanceBalance = _allowance[from][_to];
      require(allowanceBalance >= amount, "no allowance for you");

      uint burnableToken = _burn(amount);
      uint transferrable = amount - burnableToken;


      _allowance[from][_to] -= transferrable;

      _balance[from] -= amount;
      _balance[_to] += amount;
    }

}