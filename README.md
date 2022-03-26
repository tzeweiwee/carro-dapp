# Basic Sample Hardhat Project

This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, a sample script that deploys that contract, and an example of a task implementation, which simply lists the available accounts.

Try running some of the following tasks:

```shell
npx hardhat accounts
npx hardhat compile
npx hardhat clean
npx hardhat test
npx hardhat node
node scripts/sample-script.js
npx hardhat help
```


## Carro DApp
It will be a DApp where seller can host their own ad page and receive ETH
- Create a car ad
  - Price
  - Title
  - Make
  - Model
  - Availability - active/inactive
  - Picture
- Setting price of the cars, only owner are allowed to change
- Setting active or inactive of the cars, only owner
