// SPDX-License-Identifier: MIT
pragma solidity 0.8.24; // only using this for zksync test network
// pragma solidity >=0.8.18 <0.9.0; // this is a solidity version

import { SimpleStorage } from "./SimpleStorage.sol";

// inheritance
contract AddFiveStorage is SimpleStorage {
    // + 5
    // overrides
    // virtual override 

    function store(uint256 _newNumber) public override  {
        myFavNumber = _newNumber + 5;
    }
}