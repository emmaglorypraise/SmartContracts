pragma solidity 0.8.4;
import "./LibCast.sol";


contract Cast{
using Arithmetic for uint;
using Arithmetic for Arithmetic.Workers;
Arithmetic.Workers aw;

uint tem;

mapping(uint=>Arithmetic.Workers) workers;

mapping(uint=>mapping(uint=>mapping(string=>bytes32))) Wahala;
function checkAdd(uint256 a,uint256 b) public view returns(uint256){

    return tem.add(b);
}

function setStruct(uint8 _c,string memory _n,uint256 id) public {
  aw.constructStruct(_c,_n,id,workers);
}

function see(uint id) public view returns(Arithmetic.Workers memory){
return workers[id];
}
}