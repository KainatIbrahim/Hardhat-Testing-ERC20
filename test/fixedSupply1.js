const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("ERC20token1", function(){
    beforeEach(async function(){
        [owner, add1, add2] = await ethers. getSigners();
        const ERC20token1 = await ethers.getContractFactory("ERC20token1");//helps us to get the class for our contract
        token = await ERC20token1.deploy();
        await token.deployed();
    })
    describe("Token-Details", function(){
        it("it should return the name of token", async function(){
            let Name = await token.name();
            expect(Name).to.equal("TOKEN1");
            console.log("Token Name= ", Name);
        })
        it("it should return the tokensymbol of token", async function(){
            let Symbol = await token.symbol()
            expect(Symbol).to.equal("TK1");
            console.log("Token symbol= ", Symbol);
        })
        it("it should return the token decimals", async function(){
            let Decimal = await token.decimals();
            expect(Decimal).to.equal(18);
            console.log("Token decimal= ", Decimal);
        })
        it("it should return Total supply", async function(){
            let Tsupply = await token.totalSupply();
            console.log("Token Supply= ", Tsupply);
        })
        it("This should return balance of owner ", async function() {
            let BalanceOfOwner = await token.balanceOf(owner.address);
            console.log("Owner Balance= ", BalanceOfOwner);
        })   
    })
    describe("Transfer" ,function(){
        it("This should transfer tokens from owner to add1", async function(){
        let NumOfTokens = 50;
        await token.transfer(add1.address, NumOfTokens);
        console.log("owner balance  after transferred to add1", await token.balanceOf(owner.address));
        expect(await token.balanceOf(add1.address)).to.equal(50);
        console.log("number of tokens transferred= ", NumOfTokens);
        })
    })
    describe("Approve ", function(){
        it("this should approve number tokens to the delegate ", async function(){
            let NumTokens = 50;
            await token.approve(add1.address, NumTokens);
            expect(NumTokens).to.equal(50);
            console.log("Number of tokens approved= ", NumTokens);
        })
    })
    describe ("Transfer-from", async function (){
        it("This should transfer tokens from add1 to add2", async function (){
            let approveamount=50;
            await token.approve(add1.address, approveamount );
            let transferamount=10;
            console.log("owner balance before transfer=", await token.balanceOf(owner.address));
            let delegatecall = await token.connect(add1).transferFrom(owner.address, add2.address, transferamount);
            console.log("owner balance after transfer", await token.balanceOf(owner.address));
            console.log("transferredfrom", delegatecall);
        })
    })
})

    