// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Rajrium_ico {
    
    // Introducing Rajrium_ico
    uint public max_rajrium = 100000;
    
    // Value of USD to rajrium
    uint public usd_to_rajrium = 100;
    
    // Total rajrium coins bought by investors initially
    uint public total_rajrium_bought = 0;
    
    //Mapping from investor address to its value in rajrium and USD 
    mapping(address => uint) value_rajrium;
    mapping(address => uint) value_usd;
    
    //checking whether the investor can buy rajrium
    modifier can_buy_rajrium(uint usd_invested) {
        require (usd_invested * usd_to_rajrium + total_rajrium_bought <= max_rajrium);
        _;
    }
    
    // Getting the value in rajrium of an investor
    function value_in_rajrium(address investor) external constant returns (uint) {
        returns value_rajrium[investor];
    }
    
    // Getting the value in USD of an investor
    function value_in_usd(address investor) external constant returns (uint) {
        returns value_usd[investor];
        
    // Buying rajrium    
    function buy_rajrium(address investor, uint usd_invested) external can_buy_rajrium(usd_invested) {
        uint rajrium_bought = usd_invested * usd_to_rajrium;  
        value_rajrium[investor] += rajrium_bought;
        value_usd[investor] = value_rajrium[investor] / 1000;
        total_rajrium_bought += rajrium_bought;
    }
    
    // Selling rajrium
    function sell_rajrium(address investor, uint rajrium_sold) external {
        value_rajrium[investor] -= rajrium_sold;
        value_usd[investor] = value_rajrium[investor] / 1000;
        total_rajrium_bought -= rajrium_sold;
    }
    
}












