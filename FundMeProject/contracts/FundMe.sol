
// SPDX-License-Identifier: MIT
pragma solidity >=0.8.18 <0.9.0;

// imports
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import { PriceConverter } from "./PriceConverter.sol";

error NotOwner();

contract FundMe {
    using PriceConverter for uint256;

    uint256 public constant MINIMUM_USD = 5e18;

    address[] public funders;
    // mapping(address funder => uint256 amountFunded) public addressToAmountFunded;
    mapping(address  => uint256 ) public addressToAmountFunded;

    address public immutable i_owner;

    constructor() {
        i_owner = msg.sender;
    }

    function fund() public payable {
        require(msg.value.getConversionRate() >= MINIMUM_USD,  "didn't send enough ETH");
        // made this function payable
        // Minimum of $5 sent
        // addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
        addressToAmountFunded[msg.sender] += msg.value;
        funders.push(msg.sender);
    }

    function withdraw() public onlyOwner {
         // forloop
         for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
         }
         // reset the array
         funders = new address[](0);

         // Now to Withdraw funds

        // transfer
        // payable(msg.sender).transfer(address(this).balance); 
         // send
        bool sendSuccess = payable(msg.sender).send(address(this).balance);
        require(sendSuccess, "Send Failed");
         // call
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call Failed!");

    }

    modifier onlyOwner() {
        //require(msg.sender == i_owner, "Sender is not owner!");
        if(msg.sender != i_owner) { revert NotOwner(); }
        _;
        
    }

    // What happens if someone sends this contract ETH without calling the fund function??
    receive() external payable {
        fund();
    } 

    fallback() external payable {
        fund();
    }


}