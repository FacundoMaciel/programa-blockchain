// SPDX-License-Identifier: LGPL-3.0-only

pragma solidity 0.8.24;

error OnlyAdmin(address caller);
error InsufficientBalance(uint256 requested, uint256 available);
error Exceeded(uint256 attempted, uint256 max);

contract CryptoBank {

    // Variables
    uint256 public maxBalance;
    address public admin;
    mapping(address => uint256) public userBalance;

    // Events
    event EtherDeposit(address user_, uint256 etherAmount_);
    event EtherWithdraw(address user_, uint256 etherAmount_);

    // Modifiers
    modifier onlyAdmin() {
        if (msg.sender != admin) revert OnlyAdmin(msg.sender);
        _;
    }
    
    constructor(uint256 maxBalance_, address admin_) {
        maxBalance = maxBalance_;
        admin = admin_;
    }

    // External functions
    // 1. Deposit
    function depositEther() external payable {
        // Condition to validate the maximum deposit limit
        if (userBalance[msg.sender] + msg.value > maxBalance) {
            revert Exceeded(userBalance[msg.sender] + msg.value, maxBalance);
        }

        userBalance[msg.sender] += msg.value;

        emit EtherDeposit(msg.sender, msg.value);
    }

    // 2. Withdraw CEI pattern: 1. Checks, 2. Effects, 3. Interaction
    function withDrawEther(uint256 amount_) external {
        // Condition to revert for not enough ether
        if (amount_ > userBalance[msg.sender]) {
            revert InsufficientBalance(amount_, userBalance[msg.sender]);
        }

        // 1. Update state (important)
        userBalance[msg.sender] -= amount_;

        // 2. Transfer ether
        (bool success, ) = msg.sender.call{value: amount_}("");
        require(success, "Transfer failed");
        
        emit EtherWithdraw(msg.sender, amount_);
    }

    // 3. Modify maxBalance
    function modifyMaxBalance(uint256 newMaxBalance_) external onlyAdmin {
        maxBalance = newMaxBalance_;
    }

    // Internal functions

}