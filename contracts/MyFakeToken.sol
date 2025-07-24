// SPDX-License-Identifier: MIT
pragma solidity >=0.8.18 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    constructor() ERC20("TestToken", "TEST") {
        _mint(msg.sender, 1000000 * 10 ** 18);
    }
}