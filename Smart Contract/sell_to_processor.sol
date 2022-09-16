///SPDX-License-Identifier: MIT
pragma solidity >=0.4.0 <0.9.0;
pragma experimental ABIEncoderV2;

contract Demo
 {
     struct Sell_To_Processor {
        uint256 farmer_id;
        uint256 processor_id;
        uint256 crop_id;
        string crop_name;
        string quantity;
        string Price;
        uint256 SeialId;
        bool bought;
    } 

    uint256 totalSellToProcessor = 0; 
     
    mapping(uint256 => Sell_To_Processor) public entryMap1;
    mapping(uint256 => mapping(uint256 => mapping(uint256 => uint256))) public SellToProcessorMap;

    function SellToProcessorConnect(uint256 _farmerId, uint256 _cropId, string memory _crop_name, string memory _quantity, string memory _price) public {
    //    uint256 totalSellToProcessor = SellToProcessorMap[_farmerId][_processorId][_productId];

        Sell_To_Processor storage entry1 = entryMap1[totalSellToProcessor]; // entryMap
        entry1.SeialId = totalSellToProcessor;
        entry1.farmer_id = _farmerId;
        entry1.processor_id = 0;
        entry1.crop_id = _cropId;
        entry1.crop_name = _crop_name;
        entry1.quantity = _quantity;
        entry1.Price = _price;
        entry1.bought = false;
        
      

        totalSellToProcessor = totalSellToProcessor + 1;
        // SellToProcessorMap[_farmerId][_processorId][_productId] = key; 
    }
    function SellToProcessorShow(uint256 _farmerId, uint256 _processorId, uint256 _cropId) public view returns (string memory, string memory, string memory )
    {
        uint256 key = SellToProcessorMap[_farmerId][_processorId][_cropId];
        Sell_To_Processor storage entry1 = entryMap1[key];
        
     return (entry1.crop_name, entry1.quantity, entry1.Price );
    }

     function showSellToProcessorBySerialId(uint256 _serialId) public view returns (string memory, string memory, string memory)
    {
       // uint256 key = SellToProcessorMap[_farmerId][_processorId][_productId];
        Sell_To_Processor storage entry1 = entryMap1[_serialId];
        
     return (entry1.crop_name, entry1.quantity, entry1.Price);
    }

    function buyByProcessorId(uint256 _serialId, uint256 _processor_id) public
    {
       // uint256 key = SellToProcessorMap[_farmerId][_processorId][_productId];
        Sell_To_Processor storage entry1 = entryMap1[_serialId];
        entry1.processor_id = _processor_id;
        entry1.bought = true;
    }
    function ShowAllSellToProcessor() public view returns(uint256 _totalSellToProcessor,uint256[] memory _serial_id, uint256[] memory _farmer_id, uint256[] memory _processor_id, uint256[] memory _crop_id, string[] memory _crop_name, string[] memory _quantity, string[] memory _Price, bool[] memory _bought)
    {
        _serial_id = new uint256[](totalSellToProcessor);
        _farmer_id = new uint256[](totalSellToProcessor);
        _processor_id = new uint256[](totalSellToProcessor);
        _crop_id = new uint256[](totalSellToProcessor);
        _crop_name = new string[](totalSellToProcessor);
        _quantity = new string[](totalSellToProcessor);
        _Price = new string[](totalSellToProcessor);
        _bought = new bool[](totalSellToProcessor);

        for (uint256 i=0; i<totalSellToProcessor; i++){
            _serial_id[i] = entryMap1[i].SeialId;
            _farmer_id[i] = entryMap1[i].farmer_id;
            _processor_id[i] = entryMap1[i].processor_id;
            _crop_id[i] = entryMap1[i].crop_id;
            _crop_name[i] = entryMap1[i].crop_name;
            _quantity[i] = entryMap1[i].quantity;
            _Price[i] = entryMap1[i].Price;
            _bought[i] = entryMap1[i].bought;

        }

        _totalSellToProcessor = totalSellToProcessor;
    }
 }