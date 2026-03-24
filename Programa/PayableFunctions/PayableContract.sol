// SPDX-License-Identifier: LGPL-3.0-only

pragma solidity ^0.8.24;

error SenderNotAdmin(address);

contract PayableContract {

    function sendEther() public payable {}

}