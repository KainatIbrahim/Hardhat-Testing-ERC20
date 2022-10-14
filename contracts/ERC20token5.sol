/**
 *Submitted for verification at Etherscan.io on 2022-09-30
*/

// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;


contract ERC20token5{

////////////// State variables ////////////

    string public token5Name; 
    string public token5Symbol; 
    uint256 public token5TotalSupply;
    uint256 public  token5decimals; 
    uint256 public tokenSupply;
    address internal owner;

////////////// Mappings ////////////////

    mapping(address => uint256) balances;

    constructor(){
        token5Name = "Token5";
        token5Symbol = "TK5";
        token5decimals = 8;
        tokenSupply= 300;
        token5TotalSupply = tokenSupply*(10**uint256(token5decimals));
        balances[msg.sender] += token5TotalSupply;
        owner = msg.sender;
    }

////////////// Modifier ////////////////

     modifier onlyOwner() {
        require(msg.sender == owner, "only owner can call this method");
        _;
    }

////////////// Readable Functions //////////////// 

    function totalsupply() public view returns(uint256){
        return token5TotalSupply;
    }

    function balanceOf(address tokenOwner)  public view returns(uint256) { 
        return balances[tokenOwner];
        }

////////////// Main Functions ////////////////

    function mint(address to, uint _tokens) public onlyOwner returns(bool) {
        token5TotalSupply += _tokens;
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
     token5TotalSupply -= _tokens;
     balances[msg.sender] -= _tokens;
     return true;
    }
}