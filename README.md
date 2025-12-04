# MyToken (MTK)

## 📌 Overview
MyToken is a simple ERC-20 compatible token built on the Ethereum blockchain for learning purposes. This project demonstrates how cryptocurrency tokens work using Solidity smart contracts and the Remix IDE.

It includes all core ERC-20 functionalities such as transfers, approvals, allowances, balance tracking, and event logging.

---

## 🪙 Token Details
- **Name**: MyToken  
- **Symbol**: MTK  
- **Decimals**: 18  
- **Total Supply**: 1,000,000 MTK  
- **Standard**: ERC-20  

---

## ✅ Features
- ✅ Standard ERC-20 implementation  
- ✅ Transfer tokens between addresses  
- ✅ Approve and `transferFrom` functionality  
- ✅ Event emission for transparency  
- ✅ Balance tracking  
- ✅ Allowance tracking  
- ✅ Helper functions for easier access  

---

## 🚀 How to Deploy

1. Open Remix IDE: https://remix.ethereum.org  
2. Create a new file named `MyToken.sol`  
3. Paste the smart contract code  
4. Go to the **Solidity Compiler** tab  
5. Select compiler version **0.8.x or higher**  
6. Click **Compile MyToken.sol**  
7. Go to the **Deploy & Run Transactions** tab  
8. Select **JavaScript VM (London)** as the environment  
9. Enter the initial supply in the constructor:

## 🔁 Transfer Tokens
- transfer(address to, uint256 amount) → returns bool

## ✅ Approve Spending
- approve(address spender, uint256 amount) → returns bool

## 🔄 Transfer on Behalf (Using Allowance)
- transferFrom(address from, address to, uint256 amount) → returns bool

## 📊 Check Allowance
- allowance(address owner, address spender) → returns uint256

## 📦 Get Total Supply (Helper Function)
- getTotalSupply() → returns uint256

## 🧾 Get Token Information (Helper Function)
- getTokenInfo() → returns (string, string, uint8, uint256)


