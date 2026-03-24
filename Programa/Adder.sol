// SPDX-License-Identifier: LGPL-3.0-only

pragma solidity ^0.8.24;

import "./Interfaces/IResult.sol";

contract Adder {

    // Objeto para llamar a otro smart contract: Interface + address
    // Variables
    address public result;

    constructor(address results_){
        result = results_;
    }

    // Modifiers

    // Events

    // External functions
    function addition(uint256 num1_, uint256 num2_) external {
        uint256 results_ = num1_ + num2_;
        IResult(result).setResultado(results_);
    }

    function setFeeByMsg(uint256 newFee_) external {
        IResult(result).setFeeByMsg(newFee_);
    }

    function setFeeByTx(uint256 newFee_) external {
        IResult(result).setFeeByTx(newFee_);
    }

    // Internal functions

}