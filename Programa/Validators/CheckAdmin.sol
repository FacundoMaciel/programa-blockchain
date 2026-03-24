// SPDX-License-Identifier: LGPL-3.0-only

pragma solidity ^0.8.24;

// Custom Errors
error SenderNotAdmin(address);

contract RequireTest {

    // Variables
    address public admin;

    constructor(address admin_) {
        admin = admin_;
    }

    // Functions
    // Function + if check: msg.sender sea igual a admin
    function checkAdmin() public view {
        if(msg.sender != admin) revert();
    }

    // funcion + require check
    function checkAdminRequire() public view {
        require(msg.sender == admin, "Msg.sender is not admin");
    }

    // if + custom errors
    function checkAdminCustomErrors() public view {
        if(msg.sender != admin) revert SenderNotAdmin(msg.sender);
    }

}
