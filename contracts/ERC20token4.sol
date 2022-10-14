/**
 *Submitted for verification at Etherscan.io on 2022-09-30
*/

// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;


contract ERC20token4{

////////////// State variables ////////////

    string public token4Name; 
    string public token4Symbol; 
    uint256 public token4TotalSupply;
    uint256 public tokenSupply;
    uint256 public  token4decimals; 
    address internal owner;

////////////// Mappings ////////////////

    mapping(address => uint256) balances;

    constructor(){
        token4Name = "Token4";
        token4Symbol = "TK4";
        token4decimals = 18;
        tokenSupply = 200;
        token4TotalSupply =tokenSupply*(10**uint256(token4decimals));
        balances[msg.sender] += token4TotalSupply;
        owner = msg.sender;
    }

////////////// Modifier ////////////////

     modifier onlyOwner() {
        require(msg.sender == owner, "only owner can call this method");
        _;
    }

////////////// Readable Functions //////////////// 

    function totalsupply() public view returns(uint256){
        return token4TotalSupply;
    }
    function balanceOf(address tokenOwner)  public view returns(uint256) { 
        return balances[tokenOwner];
        }

////////////// Main Functions ////////////////

    function mint(address to, uint _tokens) public onlyOwner returns(bool) {
        token4TotalSupply += _tokens;
        balances[to] += _tokens;
        return true;
    }
    function transfer(address to, uint token)  public  returns(bool){
        require(balances[msg.sender] >= token, "you should have some tokens");
        balances[msg.sender] -= token;
        balances[to] += token;
        return true;
    }
    function burn(uint _tokens) public onlyOwner returns(bool) {
     token4TotalSupply -= _tokens;
     balances[msg.sender] -= _tokens;
     return true;
    }
}