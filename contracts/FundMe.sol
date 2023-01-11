// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "./PriceConvertor.sol";

contract FundMe {

    using PriceConvertor for uint256;

    // defining the minimum USD amount one can send
    uint256 public minUSD = 50 * 1e18;

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;
    
    function fund() public payable {
        // defining the minimum amount once should have before making a transaction
        require(msg.value.getConversionRate() >= minUSD, "Insuffient funding on the account!!!");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
    }

    

}