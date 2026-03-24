// SPDX-License-Identifier: LGPL-3.0-only

pragma solidity ^0.8.24;

contract Result {
    // Variables
    uint256 public resultado;

    // External functions
    function setResultado(uint256 num1_) external {
        resultado = num1_;
    }

    // Internal functions
}