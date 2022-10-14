const { expect } = require("chai");
const { ethers } = require("hardhat");
const chai= require("chai");
const should = chai.should();
//////////////////////Block that execute before every function//////////////////////
describe("ERC20 mintable token 1", function(){
    beforeEach(async function(){
        [owner, add1, add2, ...addrs] = await ethers.getSigners();
        const ERC20token4 = await ethers.getContractFactory("ERC20token4");
        token = await ERC20token4.deploy();
        await token.deployed();
        //console.log("Address of the current contract: ", token.address);
    })
    it("Is Contract Deployed?", async function(){
        console.log("Yes Contract has been Deployed Successfully!");
    })
////////////////////Test for token details//////////////////////
    describe("Token Details", function(){
        it("It should set right owner of the contract ", async function(){
            const balanceSupply= await token.balanceOf(owner.address);
            expect(await token.totalsupply()).to.equal(balanceSupply);
            console.log("Contract owner: ",owner.address);
            console.log("total Supply: ", await token.totalsupply());
            console.log("balance of Owner is",balanceSupply);
        })
        it("This should return balance of owner ", async function() {
            const BalanceOfOwner = await token.balanceOf(owner.address);
            console.log("Owner Balance= ", BalanceOfOwner);
        })
        it("Total supply: ", async function(){
            let Tsupply = await token.totalsupply();
            //expect Tsupply.
            console.log("Total supply= ", Tsupply);
        }) 
   
        it("This should return details of the token ", async function(){
        const Name = "TOKEN4";
        const Symbol = "TK4";
        const decimals = 18;
        expect(Name).to.equal("TOKEN4");
        console.log("Token Name= ", Name);
        expect(Symbol).to.equal("TK4");
        console.log("Token symbol= ", Symbol);
        expect(decimals).to.equal(18);
        console.log("Token decimals= ", decimals);
        })

    })
///////////////////Transfer///////////////////////
    describe("Transfer" , function(){
        it("Transfer should transfer tokens from owner to add1", async function(){
        //let NumOfTokens = 10;
        const supplyBeforetransfer= await token.totalsupply();
        console.log("supply before transfer ", supplyBeforetransfer);
        const ownerBalanceBeforetransfer = await token.balanceOf(owner.address);
        console.log("Owner balance before minting any token!! ", ownerBalanceBeforetransfer);
        await token.transfer(add1.address, 1000);
        console.log("Owner balance after transfer", await token.balanceOf(owner.address));
        console.log("add1 balance after transfer", await token.balanceOf(add1.address));
        })
    })
//////////////////////Mint///////////////////////////
    describe("Test Mint Function", function(){
        it('mint should increase the total supply and address balance', async function() {
            const supplyBeforeMint= await token.totalsupply();
            console.log("supply before mint ", supplyBeforeMint);
            const ownerBalanceBeforeMint = await token.balanceOf(owner.address);
            console.log("Owner balance before minting any token!! ", ownerBalanceBeforeMint);
            await token.mint(add1.address, 2000);
            expect(token.totalsupply())==(supplyBeforeMint+2000);
            expect(token.balanceOf(owner.address))==(ownerBalanceBeforeMint+2000);
            console.log("Balance of add1 after minting: ", await token.balanceOf(add1.address));
            console.log("Balance of owner= ", await token.balanceOf(owner.address));
        })
    })
//////////////////////////burn///////////////////////////
    describe("Test Burn Function", function(){
        it("This function should decrease token supply and owner balance", async function(){
            const supplyBeforeBurn = await token.totalsupply();
            console.log("supply before burn ", supplyBeforeBurn);
            console.log("Balance of add1 before burn: ", await token.balanceOf(add1.address));
            const ownerBalanceBeforeBurn = await token.balanceOf(owner.address);
            console.log("owner balance before burn ", ownerBalanceBeforeBurn);
            await token.burn(200);
            expect(token.totalsupply())==(supplyBeforeBurn-200);
            expect(token.balanceOf(owner.address))==(ownerBalanceBeforeBurn-200);
            console.log("Balance of add1 after burn: ", await token.balanceOf(add1.address));
            console.log("Balance of owner= ", await token.balanceOf(owner.address));
        
        })
    })  

})