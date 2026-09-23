// SPDX-License-Identifier: MIT
// File: @openzeppelin/contracts/token/ERC20/IERC20.sol

pragma solidity ^0.8.23;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);
    
    function decimals() external view returns (uint8);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

// File: @openzeppelin/contracts/math/SafeMath.sol

/**
 * @dev Wrappers over Solidity's arithmetic operations with added overflow
 * checks.
 *
 * Arithmetic operations in Solidity wrap on overflow. This can easily result
 * in bugs, because programmers usually assume that an overflow raises an
 * error, which is the standard behavior in high level programming languages.
 * `SafeMath` restores this intuition by reverting the transaction when an
 * operation overflows.
 *
 * Using this library instead of the unchecked operations eliminates an entire
 * class of bugs, so it's recommended to use it always.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts with custom message when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}

// File: @openzeppelin/contracts/utils/Address.sol

/**
 * @dev Collection of functions related to the address type
 */
library Address {
    /**
     * @dev Returns true if `account` is a contract.
     *
     * [IMPORTANT]
     * ====
     * It is unsafe to assume that an address for which this function returns
     * false is an externally-owned account (EOA) and not a contract.
     *
     * Among others, `isContract` will return false for the following
     * types of addresses:
     *
     *  - an externally-owned account
     *  - a contract in construction
     *  - an address where a contract will be created
     *  - an address where a contract lived, but was destroyed
     * ====
     */
    function isContract(address account) internal view returns (bool) {
        // According to EIP-1052, 0x0 is the value returned for not-yet created accounts
        // and 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 is returned
        // for accounts without code, i.e. `keccak256('')`
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != accountHash && codehash != 0x0);
    }

    /**
     * @dev Replacement for Solidity's `transfer`: sends `amount` wei to
     * `recipient`, forwarding all available gas and reverting on errors.
     *
     * https://eips.ethereum.org/EIPS/eip-1884[EIP1884] increases the gas cost
     * of certain opcodes, possibly making contracts go over the 2300 gas limit
     * imposed by `transfer`, making them unable to receive funds via
     * `transfer`. {sendValue} removes this limitation.
     *
     * https://diligence.consensys.net/posts/2019/09/stop-using-soliditys-transfer-now/[Learn more].
     *
     * IMPORTANT: because control is transferred to `recipient`, care must be
     * taken to not create reentrancy vulnerabilities. Consider using
     * {ReentrancyGuard} or the
     * https://solidity.readthedocs.io/en/v0.5.11/security-considerations.html#use-the-checks-effects-interactions-pattern[checks-effects-interactions pattern].
     */
    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-low-level-calls, avoid-call-value
        (bool success, ) = recipient.call{ value: amount }("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }

    /**
     * @dev Performs a Solidity function call using a low level `call`. A
     * plain`call` is an unsafe replacement for a function call: use this
     * function instead.
     *
     * If `target` reverts with a revert reason, it is bubbled up by this
     * function (like regular Solidity function calls).
     *
     * Returns the raw returned data. To convert to the expected return value,
     * use https://solidity.readthedocs.io/en/latest/units-and-global-variables.html?highlight=abi.decode#abi-encoding-and-decoding-functions[`abi.decode`].
     *
     * Requirements:
     *
     * - `target` must be a contract.
     * - calling `target` with `data` must not revert.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data) internal returns (bytes memory) {
      return functionCall(target, data, "Address: low-level call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`], but with
     * `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data, string memory errorMessage) internal returns (bytes memory) {
        return _functionCallWithValue(target, data, 0, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but also transferring `value` wei to `target`.
     *
     * Requirements:
     *
     * - the calling contract must have an ETH balance of at least `value`.
     * - the called Solidity function must be `payable`.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(address target, bytes memory data, uint256 value) internal returns (bytes memory) {
        return functionCallWithValue(target, data, value, "Address: low-level call with value failed");
    }

    /**
     * @dev Same as {xref-Address-functionCallWithValue-address-bytes-uint256-}[`functionCallWithValue`], but
     * with `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(address target, bytes memory data, uint256 value, string memory errorMessage) internal returns (bytes memory) {
        require(address(this).balance >= value, "Address: insufficient balance for call");
        return _functionCallWithValue(target, data, value, errorMessage);
    }

    function _functionCallWithValue(address target, bytes memory data, uint256 weiValue, string memory errorMessage) private returns (bytes memory) {
        require(isContract(target), "Address: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.call{ value: weiValue }(data);
        if (success) {
            return returndata;
        } else {
            // Look for revert reason and bubble it up if present
            if (returndata.length > 0) {
                // The easiest way to bubble the revert reason is using memory via assembly

                // solhint-disable-next-line no-inline-assembly
                assembly {
                    let returndata_size := mload(returndata)
                    revert(add(32, returndata), returndata_size)
                }
            } else {
                revert(errorMessage);
            }
        }
    }
}

// File: @openzeppelin/contracts/token/ERC20/SafeERC20.sol

/**
 * @title SafeERC20
 * @dev Wrappers around ERC20 operations that throw on failure (when the token
 * contract returns false). Tokens that return no value (and instead revert or
 * throw on failure) are also supported, non-reverting calls are assumed to be
 * successful.
 * To use this library you can add a `using SafeERC20 for IERC20;` statement to your contract,
 * which allows you to call the safe operations as `token.safeTransfer(...)`, etc.
 */
library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function safeTransfer(IERC20 token, address to, uint256 value) internal {
        _callOptionalReturn(token, abi.encodeWithSelector(token.transfer.selector, to, value));
    }

    function safeTransferFrom(IERC20 token, address from, address to, uint256 value) internal {
        _callOptionalReturn(token, abi.encodeWithSelector(token.transferFrom.selector, from, to, value));
    }

    /**
     * @dev Deprecated. This function has issues similar to the ones found in
     * {IERC20-approve}, and its usage is discouraged.
     *
     * Whenever possible, use {safeIncreaseAllowance} and
     * {safeDecreaseAllowance} instead.
     */
    function safeApprove(IERC20 token, address spender, uint256 value) internal {
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        // solhint-disable-next-line max-line-length
        require((value == 0) || (token.allowance(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, value));
    }

    function safeIncreaseAllowance(IERC20 token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).add(value);
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    function safeDecreaseAllowance(IERC20 token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).sub(value, "SafeERC20: decreased allowance below zero");
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    /**
     * @dev Imitates a Solidity high-level call (i.e. a regular function call to a contract), relaxing the requirement
     * on the return value: the return value is optional (but if data is returned, it must not be false).
     * @param token The token targeted by the call.
     * @param data The call data (encoded using abi.encode or one of its variants).
     */
    function _callOptionalReturn(IERC20 token, bytes memory data) private {
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves. We use {Address.functionCall} to perform this call, which verifies that
        // the target address contains contract code and also asserts for success in the low-level call.

        bytes memory returndata = address(token).functionCall(data, "SafeERC20: low-level call failed");
        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

// File: @openzeppelin/contracts/GSN/Context.sol

/*
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with GSN meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
abstract contract Context {
    function _msgSender() internal view virtual returns (address payable) {
        return payable(msg.sender);
    }

    function _msgData() internal view virtual returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

// This is the permissionless payment escrow contract that anyone can use to make payments in specific ERC20 tokens from buyers to sellers.
// The benefit of using this contract versus just direct transfer is the use of an arbitrator in cases of disputes.
// After transferring, buyers have a time window in which they can raise a dispute that can be settled by an arbitrator. The specific arbitrator is agreed upon by the buyer and seller beforehand.
// If a dispute is raised but the arbitrator fails to resolve within 6 months, the payment can be clawed back by the buyer. In addition, sellers can refund at anytime.
// Platforms that use this contract can use this functionality to implement a "Buyer Protection" feature.
// There are no fees associated with the use of this contract.

contract PaymentEscrow_Version1 is Context {
    using SafeMath for uint256;
    using SafeERC20 for IERC20;
    using Address for address;

    // Seller Current Settings
    // Found in a mapping linked by seller address
    struct SellerSettings {
        uint256 currentMinPurchaseSize; // Minimum size allowable for the buyer's purchase (must be greater than 0)
        uint256 currentDisputeWindow; // Length in seconds that a buyer can dispute the purchase after purchasing
        address currentArbitrator; // Must be a non-zero address and not equal to the seller's or buyer's address
    }

    // Purchase Information
    // Found in a mapping linked by seller address and unique 1-time use byte32 code
    // purchaseStatus code meanings:
    // 0 - No purchase yet
    // 1 - Buyer has purchased
    // 2 - Seller has claimed the purchase after the dispute window has ended with no dispute raised
    // 3 - Seller has refunded the purchase without a dispute being raised
    // 4 - Buyer has initiated a dispute before the dispute window has ended
    // 5 - Arbitrator has refunded the buyer after the dispute is raised
    // 6 - Arbitrator has resolved the dispute in favor of the seller for it to claim
    // 7 - Seller has claimed the purchase after the dispute resolved in its favor
    // 8 - Seller has refunded the purchase after the dispute resolved in its favor
    // 9 - Seller has refunded the purchase after the dispute was raised but before it was resolved
    // 10 - Buyer has claimed a refund for itself after the arbitrator failed to act on the dispute after 6 months
    struct Purchase {
        uint256 purchaseSize; // The size of the purchase to the seller
        address purchaser; // The address of the buyer
        uint256 purchaseTime; // The UTC time in seconds of the purchase
        uint256 disputeWindow; // The dispute period which needs to match the seller's settings at the time of purchase
        uint256 disputeTime; // The UTC time in seconds when a dispute was initiated
        address arbitrator; // The abitrator address which needs to match the seller's settings at the time of purchase
        uint256 purchaseStatus; // Status code describing the purchase state
    }

    // Make it easier for APIs to grab data from RPC services
    event PurchaseEvent(address indexed seller, address indexed purchaser, bytes32 indexed purchaseCode, uint256 purchaseSize, uint256 purchaseTime, uint256 disputeWindow, address arbitrator);
    
    // Private Mappings
    mapping(address => SellerSettings) private _sellerSettings;
    mapping(address => mapping(bytes32 => Purchase)) private _purchaseInformation;

    // Constants for the contract
    uint256 public constant PURCHASE_EXPIRATION_TIME = 180 days; // The time after which the buyer can refund a disputed stale purchase

    address public tradeCurrencyAddress; // Designed for USDC
    // 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48 - USDC on Ethereum Mainnet

    constructor(address _targetCurrency) {
        tradeCurrencyAddress = _targetCurrency;
    }
    
    // Read functions
    function getSellerSettings(address _seller) external view returns (uint256, uint256, address) {
        SellerSettings memory _settings = _sellerSettings[_seller];
        return (_settings.currentMinPurchaseSize, _settings.currentDisputeWindow, _settings.currentArbitrator);
    }

    function getPurchaseInformation(address _seller, bytes32 _purchaseCode) external view returns (uint256, address, uint256, uint256, uint256, address, uint256) {
        Purchase memory _purchase  = _purchaseInformation[_seller][_purchaseCode];
        return (_purchase.purchaseSize, _purchase.purchaser, _purchase.purchaseTime, _purchase.disputeWindow, _purchase.disputeTime, _purchase.arbitrator, _purchase.purchaseStatus);
    }
    
    // Write functions

    // Seller settings
    function setSellerSettings(uint256 _minSize, uint256 _disputeWindow, address _desiredArbitrator) external {
        require(_minSize > 0, "Cannot have a zero minimum trade size");
        require(_desiredArbitrator != address(0) && _desiredArbitrator != _msgSender(), "Arbitrator is invalid or disallowed");
        SellerSettings storage _settings = _sellerSettings[_msgSender()];
        _settings.currentMinPurchaseSize = _minSize;
        _settings.currentDisputeWindow = _disputeWindow;
        _settings.currentArbitrator = _desiredArbitrator;
    }

    // Buyer makes a purchase
    function makePurchase(address _seller, bytes32 _purchaseCode, uint256 _purchaseSize, uint256 _disputeWindow, address _arbitrator, uint256 _quoteExpiration) external {
        // Make sure we cancel the purchase attempt if the transaction is in the mempool for too long
        require(block.timestamp < _quoteExpiration, "Purchase attempt has expired");

        SellerSettings memory _settings = _sellerSettings[_seller];

        // Confirm that buyer's configurations match seller's settings
        require(_settings.currentArbitrator != address(0), "No arbitrator set yet for seller");
        require(_settings.currentArbitrator == _arbitrator, "Arbitrator not mutually agreed");
        require(_arbitrator != _msgSender(), "Arbitrator cannot also be a purchaser");
        require(_seller != _msgSender(), "Seller and purchaser cannot be the same");
        require(_settings.currentDisputeWindow == _disputeWindow, "Dispute window mismatch");
        require(_purchaseSize >= _settings.currentMinPurchaseSize && _settings.currentMinPurchaseSize > 0, "Purchase amount below minimum set by seller");

        // Check to make sure this is a newly used purchase code
        Purchase storage _purchase  = _purchaseInformation[_seller][_purchaseCode];
        require(_purchase.purchaseStatus == 0, "This purchase code has already been used");
        _purchase.purchaseStatus = 1; // New purchase
        _purchase.purchaseSize = _purchaseSize;
        _purchase.purchaser = _msgSender();
        _purchase.purchaseTime = block.timestamp;
        _purchase.disputeWindow = _disputeWindow;
        _purchase.arbitrator = _arbitrator;

        // Make the event
        emit PurchaseEvent(_seller, _msgSender(), _purchaseCode, _purchaseSize, _purchase.purchaseTime, _purchase.disputeWindow, _purchase.arbitrator);

        // Finally handle the transfer in
        uint256 _tradeBalance = IERC20(tradeCurrencyAddress).balanceOf(address(this));
        IERC20(tradeCurrencyAddress).safeTransferFrom(_msgSender(), address(this), _purchaseSize);
        _tradeBalance = IERC20(tradeCurrencyAddress).balanceOf(address(this)).sub(_tradeBalance);
        require(_tradeBalance == _purchaseSize, "Failed to transfer in exact amount. Check approvals.");
    }

    // Seller functions
    function sellerClaimPurchases(bytes32[] calldata _purchaseCodes) external {
        // The seller can claim multiple purchases at once
        uint256 _length = _purchaseCodes.length;
        uint256 _claimableBalance = 0;
        for(uint256 it = 0; it < _length; it++){
            Purchase storage _purchase  = _purchaseInformation[_msgSender()][_purchaseCodes[it]];

            // Perform the checks
            require(_purchase.purchaseStatus > 0, "Cannot claim non-existing purchase");
            require(_purchase.purchaseStatus == 1 || _purchase.purchaseStatus == 6, "Seller can no longer claim");
            if(_purchase.purchaseStatus == 1){
                // Normal order flow, buyer has bought but must wait until dispute window has expired
                require(_purchase.purchaseTime + _purchase.disputeWindow < block.timestamp, "Too soon to claim");
                _purchase.purchaseStatus = 2;
            }else{
                // Seller claimed after arbitrator resolved in its favor
                _purchase.purchaseStatus = 7;
            }

            _claimableBalance += _purchase.purchaseSize;
        }

        if(_claimableBalance > 0){
            // Now execute the transfer
            uint256 _targetBalance = IERC20(tradeCurrencyAddress).balanceOf(_msgSender());
            IERC20(tradeCurrencyAddress).safeTransfer(_msgSender(), _claimableBalance);
            _targetBalance = IERC20(tradeCurrencyAddress).balanceOf(_msgSender()).sub(_targetBalance);
            require(_targetBalance == _claimableBalance, "Unable to transfer claim");
        }
    }

    function sellerRefundPurchase(bytes32 _purchaseCode) external {
        // The seller can refund depending on the circumstance
        Purchase storage _purchase  = _purchaseInformation[_msgSender()][_purchaseCode];
        require(_purchase.purchaseStatus > 0, "Cannot refund a non-existing purchase");
        require(_purchase.purchaseStatus == 1 || _purchase.purchaseStatus == 4 || _purchase.purchaseStatus == 6, "Seller can no longer refund");
        if(_purchase.purchaseStatus == 1){
            // Seller refunded during normal order process (no dispute raised)
            _purchase.purchaseStatus = 3;
        }else if(_purchase.purchaseStatus == 4){
            // Seller refunded after buyer raised dispute to arbitrator (but before resolution)
            _purchase.purchaseStatus = 9;
        }else{
            // Seller refunded after arbitrator ruled in its favor
            _purchase.purchaseStatus = 8;
        }

        // Now execute the transfers
        uint256 _targetBalance = IERC20(tradeCurrencyAddress).balanceOf(_purchase.purchaser);
        IERC20(tradeCurrencyAddress).safeTransfer(_purchase.purchaser, _purchase.purchaseSize);
        _targetBalance = IERC20(tradeCurrencyAddress).balanceOf(_purchase.purchaser).sub(_targetBalance);
        require(_targetBalance == _purchase.purchaseSize, "Unable to transfer refund");
    }

    // Buyer functions
    function buyerInitiateDispute(address _seller, bytes32 _purchaseCode) external {
        // The purchaser can dispute a purchase if there is an issue
        Purchase storage _purchase  = _purchaseInformation[_seller][_purchaseCode];
        require(_purchase.purchaseStatus > 0, "Cannot dispute a non-existing purchase");
        require(_purchase.purchaser == _msgSender(), "Only the buyer can dispute");
        require(_purchase.purchaseStatus == 1, "Initiating a dispute is not available");
        require(_purchase.purchaseTime + _purchase.disputeWindow > block.timestamp, "Can no longer initiate a dispute");
        _purchase.disputeTime = block.timestamp; // Start the countdown for when the purchase can be clawed back
        _purchase.purchaseStatus = 4;
    }

    function buyerClawbackPurchase(address _seller, bytes32 _purchaseCode) external {
        // The purchaser can claim a stale purchase that was disputed but not resolved after the expiration time
        Purchase storage _purchase  = _purchaseInformation[_seller][_purchaseCode];
        require(_purchase.purchaseStatus > 0, "Cannot clawback a non-existing purchase");
        require(_purchase.purchaser == _msgSender(), "Only the buyer can initiate a clawback");
        require(_purchase.purchaseStatus == 4, "Purchase is not in dispute");
        require(_purchase.disputeTime + PURCHASE_EXPIRATION_TIME < block.timestamp, "Too soon to clawback");
        _purchase.purchaseStatus = 10;

        // Now execute the transfers
        uint256 _targetBalance = IERC20(tradeCurrencyAddress).balanceOf(_purchase.purchaser);
        IERC20(tradeCurrencyAddress).safeTransfer(_purchase.purchaser, _purchase.purchaseSize);
        _targetBalance = IERC20(tradeCurrencyAddress).balanceOf(_purchase.purchaser).sub(_targetBalance);
        require(_targetBalance == _purchase.purchaseSize, "Unable to transfer clawback");
    }

    // Arbitrator functions
    function arbitratorResolveForSeller(address _seller, bytes32 _purchaseCode) external {
        // The arbitrator has resolved in favor of the seller
        Purchase storage _purchase  = _purchaseInformation[_seller][_purchaseCode];
        require(_purchase.purchaseStatus > 0, "Cannot resolve a non-existing purchase");
        require(_purchase.arbitrator == _msgSender(), "Only the arbitrator can resolve");
        require(_purchase.purchaseStatus == 4, "Purchase is not in dispute");
        _purchase.purchaseStatus = 6;
    }

    function arbitratorRefundBuyer(address _seller, bytes32 _purchaseCode) external {
        // The arbitrator has resolved in favor of the purchaser
        Purchase storage _purchase  = _purchaseInformation[_seller][_purchaseCode];
        require(_purchase.purchaseStatus > 0, "Cannot resolve a non-existing purchase");
        require(_purchase.arbitrator == _msgSender(), "Only the arbitrator can resolve");
        require(_purchase.purchaseStatus == 4, "Purchase is not in dispute");
        _purchase.purchaseStatus = 5;

        // Now execute the transfers
        uint256 _targetBalance = IERC20(tradeCurrencyAddress).balanceOf(_purchase.purchaser);
        IERC20(tradeCurrencyAddress).safeTransfer(_purchase.purchaser, _purchase.purchaseSize);
        _targetBalance = IERC20(tradeCurrencyAddress).balanceOf(_purchase.purchaser).sub(_targetBalance);
        require(_targetBalance == _purchase.purchaseSize, "Unable to transfer refund");
    }

}