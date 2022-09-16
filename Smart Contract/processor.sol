///SPDX-License-Identifier: MIT
pragma solidity >=0.4.0 <0.9.0;
pragma experimental ABIEncoderV2;

contract Demo
 {
     struct processor {
        uint256 processor_id;
        address processor_address;
        string processor_name;
        uint256 product_id;
        string location;
        string verified;
        int phone_no;
        uint quantity;
        string production_date;
        string expiry_date;
        string expected_price;
    }

    uint256 totalProcessor = 0;
    mapping(uint => processor) processors;

    function storeProcessorInfo(address _processor_address, string memory p_name, uint256 _product_id, string memory loc,  string memory _verified, int _phone_no, uint _quantity, string memory _production_date,string memory _expiry_date, string memory e_price) public 
    {
        processors[totalProcessor] = processor(totalProcessor,_processor_address, p_name, _product_id, loc, _verified, _phone_no,_quantity, _production_date, _expiry_date, e_price);
        totalProcessor = totalProcessor + 1;
    }

    function getProcessorInfos(uint _processor_id) public view returns (uint256, address, string memory, uint256, string memory, string memory, int, uint, string memory, string memory, string memory) 
    {
     
       processor memory p = processors[_processor_id];
       return (
        p.processor_id,
        p.processor_address,
        p.processor_name,
        p.product_id,
        p.location,
        p.verified,
        p.phone_no,
        p.quantity,
        p.production_date,
        p.expiry_date,
        p.expected_price
    );
    }
 }