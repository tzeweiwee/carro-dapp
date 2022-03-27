// SPDX-License-Identifier: unlicensed
pragma solidity ^0.8.0;

struct CarAdvert {
    uint256 id;
    string title;
    string make;
    string model;
    uint256 price;
    string imageUrl;
}

contract DCarroApp {
    address public owner;
    string userName;
    string userCreatedDate;
    string userLocation;
    string userContact;

    uint256[] private carIds;
    mapping(uint256 => CarAdvert) public cars;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner access");
        _;
    }

    function setUserData(
        string memory _userName,
        string memory _userLocation,
        string memory _userContact
    ) public onlyOwner {
        userName = _userName;
        userLocation = _userLocation;
        userContact = _userContact;
    }

    function getCars() public view returns (CarAdvert[] memory) {
        CarAdvert[] memory carsArray = new CarAdvert[](carIds.length);
        for (uint256 i = 0; i < carIds.length; i++) {
            carsArray[i] = cars[carIds[i]];
        }

        return carsArray;
    }

    function getUserName() public view returns (string memory) {
      return userName;
    }
    function getUserLocation() public view returns (string memory) {
      return userLocation;
    }
    function getUserContact() public view returns (string memory) {
      return userContact;
    }
}
