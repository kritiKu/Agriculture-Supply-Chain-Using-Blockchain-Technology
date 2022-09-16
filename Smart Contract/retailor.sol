///SPDX-License-Identifier: MIT
pragma solidity >=0.4.0 <0.9.0;

contract Demo
 {
     struct retailor {
        uint256 retailor_id;
        address retailor_address;
        string retailor_name;
        uint256 product_id;
        string location;
        int phone_no;
        string quantity;
        string expected_price;
    }

    uint256 totalRetailor = 0;
    mapping(uint => retailor) retailors;

    function storeRetailorInfo(address _retailor_address, string memory r_name, uint256 _product_id, string memory loc,  int _phone_no,  string memory _quantity,  string memory e_price) public 
    {
      retailors[totalRetailor] =retailor(totalRetailor, _retailor_address, r_name, _product_id, loc,_phone_no,_quantity, e_price);
    }

    function getRetailorInfos(uint256 _retailor_id) public view returns (uint256, address, string memory, uint256, string memory, int, string memory, string memory) 
    {
      retailor memory r = retailors[_retailor_id];
     return (
        r.retailor_id,
        r.retailor_address,
        r.retailor_name,
        r.product_id,
        r.location,
        r.phone_no,
        r.quantity,
        r.expected_price
    );

   }
 }