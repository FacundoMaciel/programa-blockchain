// SPDX-License-Identifier: LGPL-3.0-only

pragma solidity ^0.8.24;

import "./Interfaces/IResult.sol";

contract Adder {

    // Variables
    address public resultado;
    address public admin;
    uint256 public fee;

    constructor(address resultado_, address admin_){
        resultado = resultado_;
        admin = admin_;
        fee = 5;
    }

    // Modifiers

    // Events

    // External functions
    function addition(uint256 num1_, uint256 num2_) external {
        uint256 resultado_ = num1_ + num2_;
        IResult(resultado).setResultado(resultado_);
    }

    function setFee(uint256 newFee_) external {
        if (msg.sender != admin) revert();
        fee = newFee_;
    }

    // Internal functions

}