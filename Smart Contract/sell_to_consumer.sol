///SPDX-License-Identifier: MIT
pragma solidity >=0.4.0 <0.9.0;
pragma experimental ABIEncoderV2;

contract Demo
 {
     struct Sell_To_Consumer {
        uint256 retailor_id;
        uint256 consumer_id;
        uint256 product_id;
        string product_name;
        string quantity;
        string Price;
        uint256 SeialId;
        bool bought;
    } 

    uint256 totalSellToConsumer = 0;
     //REAILOR CONSUMER MAP
    mapping(uint256 => Sell_To_Consumer) public entryMap4;
    mapping(uint256 => mapping(uint256 => mapping(uint256 => uint256))) public Sell_To_ConsumerMap;

    //RETAILOR CONSUMER MAPPING FUNCTION
    function SellToConsumerConnect(uint256 _retailorId, uint256 _productId, string memory _product_name, string memory _quantity, string memory _price) public {
       

        Sell_To_Consumer storage entry4 = entryMap4[totalSellToConsumer]; // entryMap
        entry4.SeialId = totalSellToConsumer;
        entry4.retailor_id = _retailorId;
        entry4.consumer_id = 0;
        entry4.product_id = _productId;
        entry4.product_name = _product_name;
        entry4.quantity = _quantity;
        entry4.Price = _price;
        entry4.bought = false;


      totalSellToConsumer = totalSellToConsumer + 1;
    }
    function SellToConsumerShow(uint256 _retailorId, uint256 _consumerId, uint256 _productId) public view returns (string memory, string memory, string memory )
    {
        uint256 key = Sell_To_ConsumerMap[_retailorId][_consumerId][_productId];
        Sell_To_Consumer storage entry4 = entryMap4[key];
        
     return (entry4.product_name, entry4.quantity, entry4.Price );
    }
    function showSellToConsumerBySerialId(uint256 _serialId) public view returns (string memory, string memory, string memory  )
    {
       // address key = Sell_To_ConsumerMap[_retailorId][_consumerId][_productId];
        Sell_To_Consumer storage entry4 = entryMap4[_serialId];
        
     return (entry4.product_name, entry4.quantity, entry4.Price );
    }
    function buyByConsumerId(uint256 _serialId, uint256 _consumer_id) public
    {
       // uint256 key = SellToProcessorMap[_farmerId][_processorId][_productId];
        Sell_To_Consumer storage entry4 = entryMap4[_serialId];
        entry4.consumer_id = _consumer_id;
        entry4.bought = true;
    }
    function ShowAllSellToConsumer() public view returns(uint256 _totalSellToConsumer,uint256[] memory _serial_id, uint256[] memory _retailor_id, uint256[] memory _consumer_id, uint256[] memory _product_id, string[] memory _product_name, string[] memory _quantity, string[] memory _Price, bool[] memory _bought)
    {
        _serial_id = new uint256[](totalSellToConsumer);
        _retailor_id = new uint256[](totalSellToConsumer);
        _consumer_id = new uint256[](totalSellToConsumer);
        _product_id = new uint256[](totalSellToConsumer);
        _product_name = new string[](totalSellToConsumer);
        _quantity = new string[](totalSellToConsumer);
        _Price = new string[](totalSellToConsumer);
        _bought = new bool[](totalSellToConsumer);


        for (uint256 i=0; i<totalSellToConsumer; i++){
            _serial_id[i] = entryMap4[i].SeialId;
            _retailor_id[i] = entryMap4[i].retailor_id;
            _consumer_id[i] = entryMap4[i].consumer_id;
            _product_id[i] = entryMap4[i].product_id;
            _product_name[i] = entryMap4[i].product_name;
            _quantity[i] = entryMap4[i].quantity;
            _Price[i] = entryMap4[i].Price;
            _bought[i] = entryMap4[i].bought;

        }

        _totalSellToConsumer = totalSellToConsumer;
    }
 }