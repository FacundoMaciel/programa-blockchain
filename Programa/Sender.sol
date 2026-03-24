// SPDX-License-Identifier: LGPL-3.0-only

pragma solidity ^0.8.24;

contract Sender {

    address public owner;

    constructor() {
        owner = msg.sender;
    }

}