// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IUniswap {
    //The one done in class
    // function swapTokensForExactTokens(
    //     uint amountOut,
    //     uint amountInMax,
    //     address[] calldata path,
    //     address to,
    //     uint deadline
    // ) external returns (uint[] memory amounts);

    //Mine
    //The function, swapExactTokensForTokens, allows a trader to specify an exact number of input tokens he is willing to give and the minimum number of output tokens he is willing to receive in return. 
    function swapExactTokensForTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);

    function addLiquidity(
        address tokenA,
        address tokenB,
        uint amountADesired,
        uint amountBDesired,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB, uint liquidity);
}