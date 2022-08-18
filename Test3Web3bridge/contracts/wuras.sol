// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
import "./IERC20.sol";



contract swap{
    IERC20 token;


    struct Order{
        address _to;
        address fromToken;
        address toToken;
        uint amountIN;
        uint amountOut;
        bool status;
    }
    mapping(uint => Order) _order;
    uint ID = 1;


    function createOrder(address _fromToken, address _toToken, uint amountIn, uint DesiredAmountOut) public {
        require(IERC20(_fromToken).transferFrom(msg.sender, address(this),amountIn), "transfer Failed");
        Order storage OD = _order[ID];
        OD.fromToken = _fromToken;
        OD.toToken = _toToken;
        OD.amountIN = amountIn;
        OD.amountOut = DesiredAmountOut;
        OD.status = true;

        ID++;
    }

    function executeOrder(uint _ID) public {
        Order storage OD = _order[_ID];
        assert(OD.status);
        uint _amountOUT = OD.amountOut;
        require(IERC20(OD.toToken).transferFrom(msg.sender, address(this),_amountOUT), "transfer Failed");
        OD.status = false;
        IERC20(OD.fromToken).transfer(msg.sender, OD.amountIN);
        IERC20(OD.toToken).transfer(OD._to, _amountOUT);

    }
}