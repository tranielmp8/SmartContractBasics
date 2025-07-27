// SPDX-License-Identifier: MIT

// pragma solidity ^0.8.18; // this is a way to write the version of solidity saying 0.8.18 or greater
pragma solidity 0.8.24; // only using this for zksync test network
// pragma solidity >=0.8.18 <0.9.0; // use this if not using zksync test network


contract SimpleStorage {
    // Basic Types: boolean, uint, int, address, bytes
    uint256 myFavNumber; // automatically gives a value of 0, if not set

    // List of numbers
    uint256[] listOfNumbers; // [1, 2, 3, 4, 5];

    struct Person {
        uint256 favNumber;
        string name;
    }

    Person public traniel = Person({favNumber: 8, name: "Traniel"});

    function store(uint256 _favNumber) public  virtual { // public is the visibility modifier, _favNumber is the parameter of the function   )
        myFavNumber = _favNumber;

    }


    // view, pure are two functions in which you are not changing the state so it will be blue in remix
    // the store function we created above will change the variable meaning something changes
    // view or pur means we will not have to send a transaction or spend gas
    function retrieve() public view returns(uint256) {
        return myFavNumber;
    }

    struct User {
        address userAddress;
        uint age;
        string name;
    }


    Person[] public listOfPeople;

    mapping(string => uint256) public  nameToFavoriteNumber;

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber; // basically the key = _name and the value = _favoriteNumber;
    }

    // User public superman = User(0xa5899743c45AC3138abDed54D8b6147558FF568A, 41, "Clark Kent");
    // User public superboy = User({userAddress: 0xc4536726c45AC3138abDed54ae61899F777BBA54, age: 25, name: "superboy"});
}

