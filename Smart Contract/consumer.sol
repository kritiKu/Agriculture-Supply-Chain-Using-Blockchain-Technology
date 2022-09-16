///SPDX-License-Identifier: MIT
pragma solidity >=0.4.0 <0.9.0;

contract Demo
 {
     struct consumer{
        uint256 consumer_id;
        address consumer_address;
        string consumer_name;
        int phone_no;
        string location;
        string product_name;
        string brand_name;
        string food_quality;
        string quantity;
        string expected_price;
    }

    uint256 totalConsumer = 0;
    mapping(uint => consumer) consumers;

    function storeConsumerInfo(address _consumer_address, string memory c_name, int _phone_no, string memory loc, string memory _product_name, string memory _brand_name,string memory _food_quality, string memory _quantity, string memory e_price) public 
    {
      consumers[totalConsumer] = consumer(totalConsumer, _consumer_address, c_name, _phone_no, loc, _product_name, _brand_name, _food_quality, _quantity, e_price);
      
    }

    function getConsumerInfos(uint _consumer_id) public view returns (uint256, address, string memory, int, string memory, string memory, string memory, string memory, string memory, string memory ) 
    {
      consumer memory c = consumers[_consumer_id];
     return (
        c.consumer_id,
        c.consumer_address,
        c.consumer_name,
        c.phone_no,
        c.location,
        c.product_name,
        c.brand_name,
        c.food_quality,
        c.quantity,
        c.expected_price
    );

 }
 }