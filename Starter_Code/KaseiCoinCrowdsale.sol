pragma solidity ^0.5.0;

import "./KaseiCoin.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";


// Have the KaseiCoinCrowdsale contract inherit the following OpenZeppelin:
// * Crowdsale
// * MintedCrowdsale
contract KaseiCoinCrowdsale is Crowdsale, MintedCrowdsale{ // UPDATE THE CONTRACT SIGNATURE TO ADD INHERITANCE
    
    // Provide parameters for all of the features of your crowdsale, such as the `rate`, `wallet` for fundraising, and `token`.
    constructor(
        uint256 rate,
        address payable wallet,
        KaseiCoin token
    ) public Crowdsale(rate, wallet, token) {

    }
}


contract KaseiCoinCrowdsaleDeployer {

    address public kasei_token_address; 
    address public kasei_crowdsale_address;

    // Add the constructor.
    constructor(
        string memory name,
        string memory symbol,
        address payable wallet
    )
    public {
        // Create a new instance of the KaseiCoin contract.
        // YOUR CODE HERE!
        
        kasei_token_address=address(KaseiCoin);
        
        // Assign the token contract’s address to the `kasei_token_address` variable.
        //hi

        // Create a new instance of the `KaseiCoinCrowdsale` contract
            kasei token=new KaseiCoin(name,symbol,initial_supply=0);
        kasei_crowdsale_address=address(KaseiCoinCrowdsale);

        // Set the `KaseiCoinCrowdsale` contract as a minter
        token.addMinter(kasei_crowdsale_address);
        token.renounceMinter();
    }
}
