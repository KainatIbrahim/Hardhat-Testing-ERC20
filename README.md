# Unit Testing for ERC20Mintable Tokens
 ## TokenName-TOKEN1
 ## Using Hardhat to test

- 1st describe block:

      contains a "beforeEach" block, which will be executed before every function test.
- 2nd describe block:

      will return the Token-Details. 
      Inside there are "it" blocks, which tests a specific scenerio inside token details.
- describe Transfer:

      will test whether tokens are being sent to add1 or not.
- describe Approve:

      will check for the delegate's approval from owner.
- describe Transfer-From:

      will first check if delegate is approved or not, then transfer some tokens to a third address and then checks the owner's balance.

- Run the test through npx hardhat test ./test/filename.js
```
