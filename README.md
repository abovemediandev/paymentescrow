# Permissionless Payment Escrow
This is an immutable smart contract escrow designed to facilitate payments between untrusted buyers and untrusted sellers. The only trusted element is a third party arbitrator who is mutually agreed upon between a buyer and a seller before a purchase. After making a purchase, funds are locked in the contract until a dispute window is over. The buyer can dispute up until that window closes. Afterwards, the funds are claimable by the seller. The seller can refund the buyer at any time.

When a dispute is initiated, the arbitrator has 6 months to resolve, in favor of the buyer or seller, before the funds can be clawed back by the buyer.

There is no owner to this contract. No fees for use. No payment to an arbitrator (must be handled elsewhere).

### Seller Options
Sellers can setup their currently accepted arbitrator, minimum acceptable purchase amount and the length of the dispute window. Sellers can even disallow disputes if they set the dispute window to zero. Certain restrictions apply that can be viewed in the contract code.

### Buyer Purchase
A buyer understands and agrees to the seller's options before making a purchase. These options are locked to the purchase even if the seller changes them afterwards. Using a unique (for the seller) bytes32 purchase code, the buyer makes a purchase via makePurchase function call.

### Seller Claim
A seller can claim multiple purchase codes linked to their address simultaneously after the dispute window has ended.

### Seller Refund
A seller can refund the buyer at anytime, even after a dispute is resolved in their favor.

### Buyer Dispute
A buyer can initiate a purchase dispute from the purchased time until the dispute window has ended. For sellers that have a zero dispute window, it is not possible to dispute a purchase.

### Buyer Clawback
After 6 months of unresolved dispute, the buyer can clawback their funds.

### Arbitrator Actions
The arbitrator can either refund the buyer or resolve for seller if a dispute is raised by the buyer. The seller still needs to claim the funds if the arbitrator resolves in its favor.

## Disclaimer
This code comes with no guarantees, no warranty, and is provided as is. Use at your own risk. The developer is not responsible for loss from use of this code.

## Deployments
Ethereum: https://etherscan.io/address/0x7d7f4d67bf954f58dbedba5b671a8f8767bffb83 (USDC)
