# Smart Contract Exercise
The purpose of this exercise is to practice bug hunting in a smart contract.

## How to use the exercise
1. Under `src` we have a broken smart contract and an empty test file.

2. Your first goal is to comment out problem areas in the broken smart contract to give yourself a sense of the possible problems.

3. Your next goal is to first write tests according to the specs mentioned below to ensure that the tests fail.

4. Once this is accomplished, rewrite the contract to address the bugs.

5. You should fork this repo and complete the exercise independently of other forkers. When you are done with the repo you can then check with the other forks for how well you have debugged the contract.

## Smart Contract Specification
**Overview**
The smart contract this repository will be testing is a staking contract which gives out protocol tokens for staking.

This specification is used commonly in most DeFi protocols to incentivize people to hold tokens over some period of time.

**Expected Behavior**
1. Creator of ERC20 token mints some new ERC20 token upon deploying the contract. 

50% of ERC20 tokens are sent to the Creator and the remaining 50% of ERC20 tokens are sent to the staking contract for rewards.

2. Holders of the ERC20 token should be able to transfer the ERC20 tokens and have the correct balances credited to the rightful addresses.

3. Holders of the ERC20 token can stake the ERC20 tokens to acquire some additional staking token (also an erc20) which denotes the tokens staked in the protocol.

This staking token will entitle the staker to rewards for the ERC20 staked upon calling the getReward() function or exit() function.

