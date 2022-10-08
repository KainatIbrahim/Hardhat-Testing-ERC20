/**
 *Submitted for verification at Etherscan.io on 2022-09-28
*/

// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

////////////// State variables ////////////

contract ERC20token1{
    string internal token1Name; 
    string internal token1Symbol; 
    uint256 internal token1Supply;
    uint256 internal token1TotalSupply;
    uint256 internal  token1decimals;
    address internal owner;

/////////////// Events //////////////////    

    event Transfer(address from, address to, uint tokens);
    event Approval(address from,address to, uint tokens);

////////////// Mappings ////////////////

    mapping(address => uint256) balances;
    mapping(address => mapping(address => uint256)) allownce;

    constructor(){
        token1Name ="TOKEN1";
        token1Symbol = "TK1";
        token1Supply=100;
        token1decimals = 18;
        token1TotalSupply = token1Supply*(10**uint256(token1decimals));
        balances[msg.sender] += token1TotalSupply;
        owner = msg.sender;
    }

////////////// Modifier ////////////////

    modifier onlyOwner() {
        require(msg.sender == owner, "ONLY OWNERS CAN CALL!!");
        _;
    }

////////////// Readable Functions //////////////// 

    function name()  public view returns(string memory) {
         return token1Name;
        }
    function symbol() public view returns(string memory) { 
        return token1Symbol;
        }
    function totalSupply()  public view returns(uint256) { 
        return token1TotalSupply;
        }
    function decimals()  public view returns(uint256) {
         return token1decimals;
         }

    function balanceOf(address tokenOwner)  public view returns(uint256){
         return balances[tokenOwner]; 
         }

////////////// Main Functions ////////////////

    function transfer(address to, uint token)  public  returns(bool){
        require(balances[msg.sender] >= token, "YOU MUST HAVE A TOKEN TO PROCEES!!");
        balances[msg.sender] -= token;
        balances[to] += token;
        emit Transfer(msg.sender,to,token);
        return true;
    }
    function approve(address spender, uint tokens)  public returns(bool success) {
        require(balances[msg.sender]>= tokens,"YOU HAVE NO SUFFICIENT TOKEN");
        allownce[msg.sender][spender] += tokens;
        emit Approval(msg.sender, spender,tokens);
        return true;

    }
    function allowance(address _owner, address spender)  public view returns(uint){
        return allownce[_owner][spender];
    }
    function transferFrom(address _owner, address to, uint tokens) public returns(bool success) {
        require(balances[_owner] >= tokens,"OWNER DON'T HAVE SUFFICIENT TOKENS!!");
        require(allownce[_owner][msg.sender] >= tokens,"SPENDER DONT HAVE SUFFICIENT APPROVED TOKENS!!");
        balances[_owner] -= tokens;
        balances[to] += tokens;
        allownce[_owner][msg.sender] -= tokens;
        emit Transfer(_owner,to,tokens);
        return true;
        
    }
}