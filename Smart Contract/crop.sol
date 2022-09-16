///SPDX-License-Identifier: MIT
pragma solidity >=0.4.0 <0.9.0;
pragma experimental ABIEncoderV2;

contract Demo
 {
     struct crop{
        uint256 product_id;
        address crop_address;
        string crop_name;
        string pesticides_name; 
        string seed;
        string quantity;
        string expected_price;
    }

    uint256 totalCrop = 0;
    mapping(uint => crop) crops;

    //CROP FUNCTION
    function storeCropInfo(address _crop_address, string memory _crop_name, string memory _pesticides_name, string memory _seed, string memory _quantity, string memory _expected_price) public 
    {
        crops[totalCrop] = crop(totalCrop, _crop_address, _crop_name, _pesticides_name, _seed, _quantity, _expected_price); 
        totalCrop = totalCrop + 1;
    }
    
 
    function getCropInfos(uint256 _product_id) public view returns (uint256, address, string memory,string memory, string memory, string memory, string memory)
    {
       crop memory cr = crops[_product_id];
       return (cr.product_id, cr.crop_address, cr.crop_name, cr.pesticides_name, cr.seed, cr.quantity,cr.expected_price);

    }
 }