/**
 *Submitted for verification at Etherscan.io on 2022-09-28
*/

// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;
contract ERC20token2{

////////////// State variables ////////////

    string internal token2Name;
    string internal token2Symbol; 
    uint256 internal tokenSupply;
    uint256 internal token2TotalSupply;
    uint256 internal  token2decimals; 
    address internal owner;

/////////////// Events ////////////////// 

    event Transfer(address from, address to, uint tokens);
    event Approval(address from,address to, uint tokens);

////////////// Mappings ////////////////

    mapping(address => uint256) balances;
    mapping(address => mapping(address => uint256)) allownce;

    constructor(){
        token2Name ="TOKEN2";
        token2Symbol = "TK2";
        tokenSupply=150;
        token2decimals = 8;
        token2TotalSupply = tokenSupply*(10**uint256(token2decimals));
        balances[msg.sender] += token2TotalSupply;
        owner = msg.sender;
    }

////////////// Modifier ////////////////

    modifier onlyOwner() {
        require(msg.sender == owner, "only owner can call this method");
        _;
    }

////////////// Readable Functions //////////////// 

    function name()  public view returns(string memory) {
         return token2Name;
        }
    function symbol() public view returns(string memory) { 
        return token2Symbol;
        }
    function totalSupply()  public view returns(uint256) { 
        return token2TotalSupply;
        }
    function decimals()  public view returns(uint256) {
         return token2decimals;
         }

    function balanceOf(address tokenOwner)  public view returns(uint256){
         return balances[tokenOwner]; 
         }

////////////// Main Functions ////////////////

    function transfer(address to, uint token)  public {
        require(balances[msg.sender] >= token, "you should have some token");
        balances[msg.sender] -= token;
        balances[to] += token;

        emit Transfer(msg.sender,to,token);
    }
    function approve(address spender, uint tokens)  public {
        require(balances[msg.sender]>= tokens,"You have not sufficient tokens");
        allownce[msg.sender][spender] += tokens;

        emit Approval(msg.sender, spender,tokens);
    }
    function allowance(address _owner, address spender)  public view returns(uint){
        return allownce[_owner][spender];
    }
    function transferFrom(address _owner, address to, uint tokens) public {
        require(balances[_owner] >= tokens,"Owner has not sufficient tokens");
        require(allownce[_owner][msg.sender] >= tokens,"Spender has not sufficient approved tokens");
        balances[_owner] -= tokens;
        balances[to] += tokens;
        allownce[_owner][msg.sender] -= tokens;

        emit Transfer(_owner,to,tokens);  
    }  
}