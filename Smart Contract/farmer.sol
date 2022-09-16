///SPDX-License-Identifier: MIT
pragma solidity >=0.4.0 <0.9.0;

contract Demo
 {
     struct farmer {
        uint256 farmer_id;
        address farmer_address;
        string farmer_name;
        string phone_no;
        string location;
        
    }
    uint256 totalFarmers = 0;

    mapping(uint => farmer) farmers;

    function storefarmerInfo(address _farmer_address, string memory f_name, 
    string memory p_no, string memory loc) 
     public {
        farmers[totalFarmers] = farmer(totalFarmers, _farmer_address, f_name, p_no, loc); 
        totalFarmers = totalFarmers + 1;
    }

    function getfarmerInfos(uint256 _farmer_id) public view returns (uint256, address, string memory,
   string memory, string memory)
    {
       farmer memory f = farmers[_farmer_id];
     return (f.farmer_id, f.farmer_address, f.farmer_name, f.phone_no, f.location);

    }
 }