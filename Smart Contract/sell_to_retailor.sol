//SPDX-License-Identifier: MIT
pragma solidity >=0.4.0 <0.9.0;
pragma experimental ABIEncoderV2;

contract Demo
 {
     struct Sell_To_Retailor {
        uint256 distributor_id;
        uint256 retailor_id;
        uint256 product_id;
        string product_name;
        string quantity;
        string Price;
        uint256 SeialId;
        bool bought;
    }

    uint256 totalSellToRetailor = 0;

    mapping(uint256 => Sell_To_Retailor) public entryMap3;
    mapping(uint256 => mapping(uint256 => mapping(uint256 => uint256))) public Sell_To_RetailorMap;

    //DISTRIBUTOR RETAILOR MAPPING FUNCTION
    function SellToRetailorConnect(uint256 _distributorId, uint256 _productId, string memory _product_name, string memory _quantity, string memory _price) public {
       

        Sell_To_Retailor storage entry3 = entryMap3[totalSellToRetailor]; // entryMap
        entry3.SeialId = totalSellToRetailor;
        entry3.distributor_id = _distributorId;
        entry3.retailor_id = 0;
        entry3.product_id = _productId;
        entry3.product_name = _product_name;
        entry3.quantity = _quantity;
        entry3.Price = _price;
        entry3.bought = false;

        totalSellToRetailor = totalSellToRetailor + 1;
    }
    function SellToRetailorShow(uint256 _distributorId, uint256 _retailorId, uint256 _productId) public view returns (string memory, string memory, string memory )
    {
         uint256 key = Sell_To_RetailorMap[_distributorId][_retailorId][_productId];
        Sell_To_Retailor storage entry3 = entryMap3[key];
        
     return (entry3.product_name, entry3.quantity, entry3.Price );
    }
    function showSellToRetailorBySerialId(uint256 _serialId) public view returns (string memory, string memory, string memory )
    {
       // address key = Sell_To_RetailorMap[_distributorId][_retailorId][_productId];
        Sell_To_Retailor storage entry3 = entryMap3[_serialId];
        
     return (entry3.product_name, entry3.quantity, entry3.Price );
    }
    function buyByRetailorId(uint256 _serialId, uint256 _retailor_id) public
    {
        Sell_To_Retailor storage entry3 = entryMap3[_serialId];
        entry3.retailor_id = _retailor_id;
        entry3.bought = true;
    }

    function ShowAllSellToRetailor() public view returns(uint256 _totalSellToRetailor, uint256[] memory _serial_id, uint256[] memory _distributor_id, uint256[] memory _retailor_id, uint256[] memory _product_id, string[] memory _product_name, string[] memory _quantity, string[] memory _Price, bool[] memory _bought)
    {
        _serial_id = new uint256[](totalSellToRetailor);
        _distributor_id = new uint256[](totalSellToRetailor);
        _retailor_id = new uint256[](totalSellToRetailor);
        _product_id = new uint256[](totalSellToRetailor);
        _product_name = new string[](totalSellToRetailor);
        _quantity = new string[](totalSellToRetailor);
        _Price = new string[](totalSellToRetailor);
        _bought = new bool[](totalSellToRetailor);

        

        for (uint256 i=0; i<totalSellToRetailor; i++){
            _serial_id[i] = entryMap3[i].SeialId;
            _distributor_id[i] = entryMap3[i].distributor_id;
            _retailor_id[i] = entryMap3[i].retailor_id;
            _product_id[i] = entryMap3[i].product_id;
            _product_name[i] = entryMap3[i].product_name;
            _quantity[i] = entryMap3[i].quantity;
            _Price[i] = entryMap3[i].Price;
            _bought[i] = entryMap3[i].bought;

        }

        _totalSellToRetailor = totalSellToRetailor;
    }

 }