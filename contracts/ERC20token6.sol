/**
 *Submitted for verification at Etherscan.io on 2022-09-30
*/

// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;


contract ERC20token6{

////////////// State variables ////////////

    string public token6Name; 
    string public token6Symbol; 
    uint256 public token6TotalSupply;
    uint256 public tokenSupply;
    uint256 public  token6decimals; 
    address internal owner;

////////////// Mappings ////////////////

    mapping(address => uint256) balances;

    constructor(){
        token6Name = "Token6";
        token6Symbol = "TK6";
        token6decimals = 10;
        tokenSupply = 300;
        token6TotalSupply = tokenSupply*(10**uint256(token6decimals));
        balances[msg.sender] += token6TotalSupply;
        owner = msg.sender;
    }

////////////// Modifier ////////////////

     modifier onlyOwner() {
        require(msg.sender == owner, "only owner can call this method");
        _;
    }

////////////// Readable Functions //////////////// 

    function totalsupply() public view returns(uint256){
        return token6TotalSupply;
    }
    function balanceof(address tokenOwner)  public view returns(uint256) { 
        return balances[tokenOwner];
        }

////////////// Main Functions ////////////////

    function mint(address to, uint _tokens) public onlyOwner returns(bool) {
        token6TotalSupply += _tokens;
        balances[to] += _tokens;
        return true;
    }

    function transfer(address to, uint token)  public  returns(bool){
        require(balances[msg.sender] >= token, "you should have some token");
        balances[msg.sender] -= token;
        balances[to] += token;
        return true;
    }

    function burn(uint _tokens) public onlyOwner returns(bool) {
     token6TotalSupply -= _tokens;
     balances[msg.sender] -= _tokens;
     return true;
    }
}