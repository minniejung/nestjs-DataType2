// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DataType2 {
    string private message = "Hello, Solidity!";
    uint256[] private numbers;
    string[] private names;
    bytes private dynamicData;
    bytes32 private fixedData =
        0xabcdef1234560000000000000000000000000000000000000000000000000000;

    struct User {
        string name;
        uint256 age;
    }

    mapping(address => uint256) private balances;
    mapping(address => User) private users;

    // setters

    function setMessage(string memory _newMsg) public {
        message = _newMsg;
    }

    function addNumber(uint256 _num) public {
        numbers.push(_num);
    }

    function addName(string memory _name) public {
        names.push(_name);
    }

    function setBalance(address _addr, uint256 _value) public {
        balances[_addr] = _value;
    }

    function setUser(address _addr, string memory _name, uint256 _age) public {
        // require(
        //     keccak256(abi.encodePacked(_name)) !=
        //         keccak256(abi.encodePacked("")),
        //     "Name cannot be empty"
        // );
        require(bytes(_name).length > 0, "Name cannot be empty");
        users[_addr] = User({name: _name, age: _age});
    }

    function setDynamicData(bytes memory _data) public {
        dynamicData = _data;
    }

    function setFixedData(bytes32 _data) public {
        fixedData = _data;
    }

    // getters

    function getMessage() public view returns (string memory) {
        return message;
    }

    function getNumbers() public view returns (uint256[] memory) {
        return numbers;
    }

    function getNumber(uint256 _idx) public view returns (uint256) {
        require(_idx < numbers.length, "Index out of bounds");
        return numbers[_idx];
    }

    function getNames() public view returns (string[] memory) {
        return names;
    }

    function getBalance(address _addr) public view returns (uint256) {
        return balances[_addr];
    }

    function getUser(address _addr) public view returns (User memory) {
        require(users[_addr].age != 0, "User not found");
        return users[_addr];
    }

    function getDynamicData() public view returns (bytes memory) {
        return dynamicData;
    }

    function getFixedData() public view returns (bytes32) {
        return fixedData;
    }

    function getDetails()
        public
        view
        returns (
            string memory,
            uint256[] memory,
            string[] memory,
            bytes32,
            bytes memory
        )
    {
        return (message, numbers, names, fixedData, dynamicData);
    }
}
