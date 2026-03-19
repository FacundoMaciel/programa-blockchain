// Licencia
// SPDX-License-Identifier: LGPL-3.0-only

// Version solidity
pragma solidity ^0.8.24;

// Imports
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// Contrato
contract CryptoReal is ERC20 {

    constructor(string memory name_, string memory symbol_) ERC20(name_, symbol_){
        _mint(msg.sender, 1000 * 1e18);
    }


}