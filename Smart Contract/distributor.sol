//SPDX-License-Identifier: MIT
pragma solidity >=0.4.0 <0.9.0;

contract Demo
 {
     struct distributor {
        uint256 distributor_id;
        address distributor_address;
        string distributor_name;
        address product_address;
        string location;
        uint transpotation_charge;
        int phone_no;
        string quantity;
        string expected_price;
    }

    uint256 totalDistributor = 0;
    mapping(uint => distributor) distributors;

    function storeDistributorInfo(address _distributor_address, string memory d_name, address _product_address, string memory loc, uint t_charge, int _phone_no,  string memory  _quantity,  string memory e_price) public 
    {
      distributors[totalDistributor] = distributor(totalDistributor, _distributor_address, d_name, _product_address, loc, t_charge,_phone_no,_quantity, e_price);
      
    }

    function getDistributorInfos(uint256 _distributor_id) public view returns (uint256, address, string memory, address, string memory,  uint, int, string memory, string memory) 
    {
      distributor memory d = distributors[_distributor_id];
     return (
        d.distributor_id,
        d.distributor_address,
        d.distributor_name,
        d.product_address,
        d.location,
        d.transpotation_charge,
        d.phone_no,
        d.quantity,
        d.expected_price
      );
    }
 }