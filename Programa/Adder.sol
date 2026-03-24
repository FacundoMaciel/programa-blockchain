// SPDX-License-Identifier: LGPL-3.0-only

pragma solidity ^0.8.24;

import "./Interfaces/IResult.sol";

contract Adder {

    // Variables
    address public result;

    constructor(address result_) {
        result = result_;
    }

    // External functions
    function addition(uint256 num1_, uint256 num2_) external {
        uint256 results_ = num1_ + num2_;
        IResult(result).setResultado(results_);
    }

    // Internal functions

}