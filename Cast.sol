pragma solidity 0.8.4;
import "./LibCast.sol";


contract Cast{
using Arithmetic for uint;
using Arithmetic for Workers;

uint tem;

mapping(uint=>Workers) workers;

mapping(uint=>mapping(uint=>mapping(string=>bytes32))) Wahala;
function checkAdd(uint256 a,uint256 b) public view returns(uint256){

    return tem.add(b);
}

function setStruct(uint8 _c,string memory _n,uint256 id) public {
  //make this work
  //Workers.constructStruct((_c,_n,12,workers));
}

function see(uint id) public view returns(Workers memory){
    return workers[id];
}
}

