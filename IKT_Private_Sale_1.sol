/**
 *Submitted for verification at BscScan.com on 2022-06-08
*/

// SPDX-License-Identifier: Unlicensed
// IKONOMY.io
// IKT Private Sale 1

pragma solidity ^0.8.7;

library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryAdd(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            uint256 c = a + b;
            if (c < a) return (false, 0);
            return (true, c);
        }
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function trySub(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b > a) return (false, 0);
            return (true, a - b);
        }
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryMul(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
            // benefit is lost if 'b' is also tested.
            // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
            if (a == 0) return (true, 0);
            uint256 c = a * b;
            if (c / a != b) return (false, 0);
            return (true, c);
        }
    }

    /**
     * @dev Returns the division of two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryDiv(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (false, 0);
            return (true, a / b);
        }
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryMod(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (false, 0);
            return (true, a % b);
        }
    }

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
        return a + b;
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
        return a - b;
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
        return a * b;
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator.
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return a / b;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting when dividing by zero.
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
        return a % b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {trySub}.
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b <= a, errorMessage);
            return a - b;
        }
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting with custom message on
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
    function div(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a / b;
        }
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting with custom message when dividing by zero.
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {tryMod}.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a % b;
        }
    }
}

abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

contract Ownable is Context {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor () {
        address msgSender = _msgSender();
        _owner = msgSender;
        emit OwnershipTransferred(address(0), msgSender);
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(_owner == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions anymore. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */
    function renounceOwnership() public virtual onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
}

interface IBEP20 {
    function totalSupply() external view returns (uint256);
    function decimals() external view returns (uint8);
    function symbol() external view returns (string memory);
    function name() external view returns (string memory);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address _owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract IKTPresale is Ownable {
    using SafeMath for uint256;
    event BuySuccess(address buyer, uint256 amount);

    IBEP20 BUSD = IBEP20(0x026c5CEFf055cB04F10138dF96E3B4Ae19fB1167);

    bool onSale = true;

    // package silver: 100 - amount 1000$
    // package gold: 150 - amount 2000$
    // package titan: 180 - amount 5000$
    // package platinum: 60 - amount 10000$
    // package diamond: 20 - amount 15000$
    address[] public buyerIndex;
    mapping (address => uint256) public buyers;
    uint256 public totalDeposit = 0;

    uint256 public silverRemain = 100;
    uint256 public silverAmount = 1000 * 1e18;

    uint256 public goldRemain = 150;
    uint256 public goldAmount = 2000 * 1e18;

    uint256 public titanRemain = 180;
    uint256 public titanAmount = 5000 * 1e18;

    uint256 public platinumRemain = 60;
    uint256 public platinumAmount = 10000 * 1e18;

    uint256 public diamondRemain = 20;
    uint256 public diamondAmount = 15000 * 1e18;

    modifier open() {
        require(onSale, "Not Open");
        _;
    }

    function openSale() external onlyOwner {
        onSale = true;
    }

    function closeSale() external onlyOwner {
        onSale = false;
    }

    function getBuyers(uint256 from, uint256 to) external view returns(address[] memory){
        require(from < to);
        address[] memory results = new address[](to - from);
        for (uint i = from; i < to; i++) {
            results[i - from] = buyerIndex[i];
        }
        return results;
    }

    function getTotalBuyers() external view returns(uint256) {
        return buyerIndex.length;
    }

    function silverBuy() external open {
        // out of stock
        require(silverRemain > 0, "Out of stock");
        // require busd balance > silver amount
        require(BUSD.balanceOf(_msgSender()) >= silverAmount, "Not enough balance BUSD");
        // require approve balance > silver amount
        require(BUSD.allowance(_msgSender(), address(this)) >= silverAmount, "Not enough allownance");
        // transfer busd from sender to this
        require(BUSD.transferFrom(_msgSender(), owner(), silverAmount), "Transfer failed");

        // add to list index
        if (buyers[_msgSender()] == 0) {
            buyerIndex.push(_msgSender());
        }
        // record sender total deposit
        buyers[_msgSender()] = buyers[_msgSender()].add(silverAmount);
        // decrease remain package
        silverRemain = silverRemain.sub(1);
        // total deposit
        totalDeposit = totalDeposit.add(silverAmount);

        emit BuySuccess(_msgSender(), silverAmount);
    }

    function goldBuy() external open {
        // out of stock
        require(goldRemain > 0, "Out of stock");
        // require busd balance > gold amount
        require(BUSD.balanceOf(_msgSender()) >= goldAmount, "Not enough balance BUSD");
        // require approve balance > gold amount
        require(BUSD.allowance(_msgSender(), address(this)) >= goldAmount, "Not enough allownance");
        // transfer busd from sender to this
        require(BUSD.transferFrom(_msgSender(), owner(), goldAmount), "Transfer failed");
        
        // add to list index
        if (buyers[_msgSender()] == 0) {
            buyerIndex.push(_msgSender());
        }
        // record sender total deposit
        buyers[_msgSender()] = buyers[_msgSender()].add(goldAmount);
        // decrease remain package
        goldRemain = goldRemain.sub(1);
        // total deposit
        totalDeposit = totalDeposit.add(goldAmount);

        emit BuySuccess(_msgSender(), goldAmount);
    }

    function titanBuy() external open {
        // out of stock
        require(titanRemain > 0, "Out of stock");
        // require busd balance > titan amount
        require(BUSD.balanceOf(_msgSender()) >= titanAmount, "Not enough balance BUSD");
        // require approve balance > titan amount
        require(BUSD.allowance(_msgSender(), address(this)) >= titanAmount, "Not enough allownance");
        // transfer busd from sender to this
        require(BUSD.transferFrom(_msgSender(), owner(), titanAmount), "Transfer failed");
        
        // add to list index
        if (buyers[_msgSender()] == 0) {
            buyerIndex.push(_msgSender());
        }
        // record sender total deposit
        buyers[_msgSender()] = buyers[_msgSender()].add(titanAmount);
        // decrease remain package
        titanRemain = titanRemain.sub(1);
        // total deposit
        totalDeposit = totalDeposit.add(titanAmount);

        emit BuySuccess(_msgSender(), titanAmount);
    }

    function platinumBuy() external open {
        // out of stock
        require(platinumRemain > 0, "Out of stock");
        // require busd balance > platinum amount
        require(BUSD.balanceOf(_msgSender()) >= platinumAmount, "Not enough balance BUSD");
        // require approve balance > platinum amount
        require(BUSD.allowance(_msgSender(), address(this)) >= platinumAmount, "Not enough allownance");
        // transfer busd from sender to this
        require(BUSD.transferFrom(_msgSender(), owner(), platinumAmount), "Transfer failed");
        
        // add to list index
        if (buyers[_msgSender()] == 0) {
            buyerIndex.push(_msgSender());
        }
        // record sender total deposit
        buyers[_msgSender()] = buyers[_msgSender()].add(platinumAmount);
        // decrease remain package
        platinumRemain = platinumRemain.sub(1);
        // total deposit
        totalDeposit = totalDeposit.add(platinumAmount);

        emit BuySuccess(_msgSender(), platinumAmount);
    }

    function diamondBuy() external open {
        // out of stock
        require(diamondRemain > 0, "Out of stock");
        // require busd balance > diamond amount
        require(BUSD.balanceOf(_msgSender()) >= diamondAmount, "Not enough balance BUSD");
        // require approve balance > diamond amount
        require(BUSD.allowance(_msgSender(), address(this)) >= diamondAmount, "Not enough allownance");
        // transfer busd from sender to this
        require(BUSD.transferFrom(_msgSender(), owner(), diamondAmount), "Transfer failed");
        
        // add to list index
        if (buyers[_msgSender()] == 0) {
            buyerIndex.push(_msgSender());
        }
        // record sender total deposit
        buyers[_msgSender()] = buyers[_msgSender()].add(diamondAmount);
        // decrease remain package
        diamondRemain = diamondRemain.sub(1);
        // total deposit
        totalDeposit = totalDeposit.add(diamondAmount);

        emit BuySuccess(_msgSender(), diamondAmount);
    }
    

    function withdrawToken(address token, uint256 amount) external onlyOwner { 
        IBEP20(token).transfer(owner(), amount);
    }

    function withdraw(uint256 amount) external onlyOwner {
        payable(owner()).transfer(amount);
    }
}
