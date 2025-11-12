// SPDX-License-Identifier: MIT
pragma solidity 0.5.10;

contract TRXToken {
    // Token metadata
    string public name = "Tron X Test";
    string public symbol = "TRX";
    uint8 public decimals = 6;

    // Totals and balances
    uint256 public totalSupply;
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    // Events
    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor() public {
        uint256 base = 10000000;
        totalSupply = base * (10 ** uint256(decimals));
        balanceOf[msg.sender] = totalSupply;
        emit Transfer(address(0), msg.sender, totalSupply);
    }

    function transfer(address to, uint256 value) public returns (bool) {
        require(balanceOf[msg.sender] >= value, "Not enough balance");
        balanceOf[msg.sender] -= value;
        balanceOf[to] += value;
        emit Transfer(msg.sender, to, value);
        return true;
    }

    // Read functions implicitly provided by public variables:
    // name(), symbol(), decimals(), totalSupply(), balanceOf(address), allowance(address,address)
}
