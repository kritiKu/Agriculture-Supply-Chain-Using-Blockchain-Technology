///SPDX-License-Identifier: MIT
pragma solidity >=0.4.0 <0.9.0;
pragma experimental ABIEncoderV2;

contract Demo
 {
      struct Sell_To_Distributor {
        uint256 processor_id;
        uint256 distributor_id;
        uint256 product_id;
        string product_name;
        string quantity;
        string Price;
        uint256 SeialId;
        bool bought;
    } 

        uint256 totalSellToDistributor = 0;

        mapping(uint256 => Sell_To_Distributor) public entryMap2;
        mapping(uint256 => mapping(uint256 => mapping(uint256 => uint256))) public SellToDistributorMap;
       
    //PROCESSOR DISTRIBUTOR MAPPING FUNCTION
    function SellToDistributorConnect(uint256 _processorId, uint256 _productId, string memory _product_name, string memory _quantity, string memory _price) public {
        
        Sell_To_Distributor storage entry2 = entryMap2[totalSellToDistributor]; 
        entry2.SeialId = totalSellToDistributor;
        entry2.processor_id = _processorId;
        entry2.distributor_id = 0;
        entry2.product_id = _productId;
        entry2.product_name = _product_name;
        entry2.quantity = _quantity;
        entry2.Price = _price;
        entry2.bought = false;

        totalSellToDistributor = totalSellToDistributor + 1;
       
    }

    function SellToDistributorShow(uint256 _processorId, uint256 _distributorId, uint256 _productId) public view returns (string memory, string memory, string memory )
    {
        uint256 key = SellToDistributorMap[_processorId][_distributorId][_productId];
        Sell_To_Distributor storage entry2 = entryMap2[key];
        
     return (entry2.product_name, entry2.quantity, entry2.Price );
    }
    function showSellToDistributorBySerialId(uint256 _serialId) public view returns (string memory, string memory, string memory )
    {
       
        Sell_To_Distributor storage entry2 = entryMap2[_serialId];
        
     return (entry2.product_name, entry2.quantity, entry2.Price );
    }

    function buyByDistributorId(uint256 _serialId, uint256 _distributor_id) public
    {
        Sell_To_Distributor storage entry2 = entryMap2[_serialId];
        entry2.distributor_id = _distributor_id;
        entry2.bought = true;
    }
    function ShowAllSellToDistributor() public view returns(uint256 _totalSellToDistributor, uint256[] memory _serial_id, uint256[] memory _processor_id, uint256[] memory __distributor_id, uint256[] memory _product_id, string[] memory _product_name, string[] memory _quantity, string[] memory _Price, bool[] memory _bought)
    {
        _serial_id = new uint256[](totalSellToDistributor);
        _processor_id = new uint256[](totalSellToDistributor);
        __distributor_id = new uint256[](totalSellToDistributor);
        _product_id = new uint256[](totalSellToDistributor);
        _product_name = new string[](totalSellToDistributor);
        _quantity = new string[](totalSellToDistributor);
        _Price = new string[](totalSellToDistributor);
        _bought = new bool[](totalSellToDistributor);
        

        for (uint256 i=0; i<totalSellToDistributor; i++){
            _serial_id[i] = entryMap2[i].SeialId;
            _processor_id[i] = entryMap2[i].processor_id;
            __distributor_id[i] = entryMap2[i].distributor_id;
            _product_id[i] = entryMap2[i].product_id;
            _product_name[i] = entryMap2[i].product_name;
            _quantity[i] = entryMap2[i].quantity;
            _Price[i] = entryMap2[i].Price;
            _bought[i] = entryMap2[i].bought;

        }

        _totalSellToDistributor = totalSellToDistributor;
    }
 }