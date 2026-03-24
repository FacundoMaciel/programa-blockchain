// SPDX-License-Identifier: LGPL-3.0-only

pragma solidity ^0.8.24;

interface IResult {
    function setResultado(uint256 num_) external;
    function setFeeByMsg(uint256 newFee_) external;
    function setFeeByTx(uint256 newFee_) external;
}