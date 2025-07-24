// SPDX-License-Identifier: MIT

// pragma solidity ^0.8.18; // this is a way to write the version of solidity saying 0.8.18 or greater
pragma solidity 0.8.24; // only using this for zksync test network
// pragma solidity >=0.8.18 <0.9.0; // this is a solidity version
import {SimpleStorage} from "./SimpleStorage.sol"; // always default to this type of import

// Contract can deploy another Contract
contract StorageFactory {
    
    // uint256 public favoriteNumber;
    // type visibility name;
    SimpleStorage[] public listOfSimpleStorageContracts;
    // address[] public listOfSimpleStorageAddresses;

    function createSimpleStorageContract() public {
         // How does the storage factory know what a simple storage looks like
         SimpleStorage newSimpleStorageContract = new SimpleStorage();
         listOfSimpleStorageContracts.push(newSimpleStorageContract);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public  {
        // ADDRESS
        // ABI - Application Binary Interface
        listOfSimpleStorageContracts[_simpleStorageIndex].store(_newSimpleStorageNumber);

    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {
        return listOfSimpleStorageContracts[_simpleStorageIndex].retrieve();
        
    }

}