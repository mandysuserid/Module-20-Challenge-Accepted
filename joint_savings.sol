/*
Joint Savings Account
---------------------

To automate the creation of joint savings accounts, you will create a solidity smart contract that accepts two user addresses that are then able to control a joint savings account. Your smart contract will use ether management functions to implement various requirements from the financial institution to provide the features of the joint savings account.

The Starting file provided for this challenge contains a `pragma` for solidity version `5.0.0`.
You will do the following:

1. Create and work within a local blockchain development environment using the JavaScript VM provided by the Remix IDE.

2. Script and deploy a **JointSavings** smart contract.

3. Interact with your deployed smart contract to transfer and withdraw funds.

*/

pragma solidity ^0.5.0;

// Define a new contract named `JointSavings`
contract JointSavings {

    // Define variables for contract

    address payable accountOne;
    address payable accountTwo;
    address public lastToWithdraw;
    unit public lastWithdrawAmount;
    unit public contractBalance;

    // Define function to withdraw
    function withdraw(uint amount, address payable recipient) public {

        // Check recipient is accountOne or accountTwo
        require (recipient == accountOne || recipient == accountTwo, "You don't own this account!");

        // Check balance
        require (amount <= address(this).balance, "Insufficient funds!");

        // Set lastToWithdraw to recipient if not already set.
        if (lastToWithdraw != recipient) {
            lastToWithdraw = recipient;
        }
    }

        // Call the 'transfer' function of the 'recipient' and pass it the 'amount' to transfer as an argument.
        recipient.transfer(amount);

        // Set 'lastWithdrawAmount' equal to 'amount'
        lastWithdrawAmount = amount;

        //Call the 'contractBalance' variable and set it equal to the balance of the contractt
        contractBalance = address(this).balance;     
    }

    // Define a `public payable` function named `deposit`.
    function deposit() public payable {

        // Call the 'contractBalance' variable and set it equal to the balance of the contract
        contractBalance = address(this).balance;
    
    
    }

    /*
    Define a `public` function named `setAccounts` that receive two `address payable` arguments named `account1` and `account2`.
    */
    function setAccounts(address payable account1, address payable account2) public{

        // Set the values of `accountOne` and `accountTwo` to `account1` and `account2` respectively.
        accountOne = account1;
        accountTwo = account2;
    }

    /*
    Finally, add the **default fallback function** so that your contract can store Ether sent from outside the deposit function.
    function   () external payable {}
}
