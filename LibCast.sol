uint256 constant SALARY=20000;

struct Workers{
    uint8 count;
    string name;
}
library Arithmetic{


function add(uint a,uint b) internal pure returns(uint){
    return a+b;
}


function constructStruct(uint8 _c,string memory _n,uint256 id,mapping(uint=>Workers) storage workers) internal {
Workers storage w=workers[id];
w.count=_c;
w.name=_n;

}

}