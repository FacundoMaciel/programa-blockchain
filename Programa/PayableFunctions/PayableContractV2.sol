// SPDX-License-Identifier: LGPL-3.0-only

pragma solidity ^0.8.24;

contract PayableContractv2 {

    function sendEther() public payable {}

    function withdrawEther(uint256 amount_) public {

        // recipient wallet receptor + call + valor ether + data
        (bool success,) = msg.sender.call{value: amount_}("");
        require(success, "Transfer failed");

    }

}