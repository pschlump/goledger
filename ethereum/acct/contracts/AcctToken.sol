pragma solidity >=0.4.21 <0.6.0;

/*
ERC20.sol  ERC20Burnable.sol  ERC20Capped.sol  ERC20Detailed.sol  ERC20Mintable.sol  ERC20Pausable.sol  IERC20.sol  SafeERC20.sol  TokenTimelock.sol
// import "openzeppelin-solidity/contracts/token/ERC20/ERC20Burnable.sol";
*/

import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
import "openzeppelin-solidity/contracts/ownership/Ownable.sol";

/**
 * @title AcctToken
 * @dev Very simple ERC20 Token example, where all tokens are pre-assigned to the creator.
 * Note they can later distribute these tokens as they wish using `transfer` and other
 * `StandardToken` functions.
 */
contract AcctToken is ERC20, Ownable {

	string public constant name = "AcctToken"; 
	string public constant symbol = "AT0000"; 
	uint8 public constant decimals = 2; 

	uint256 public constant INITIAL_SUPPLY = 10000000000;

    event AcctMove(address indexed from, address indexed to, uint256 value);

	/**
	 * @dev Constructor that gives msg.sender all of existing tokens.
	 */
	constructor() public {
    	_mint(msg.sender, INITIAL_SUPPLY); // This Implies: balances[msg.sender] = INITIAL_SUPPLY;
		emit Transfer(address(0x0), msg.sender, INITIAL_SUPPLY);
	}

    /**
     * @dev Transfer token from an account to another account.
     * @param from The address to transfer from.
     * @param to The address to transfer to.
     * @param value The amount to be transferred.
     */
    function transferFromTo(address from, address to, uint256 value) public onlyOwner returns (bool) {
        _transfer(from, to, value);
    	emit AcctMove(from, to, value);
        return true;
    }

    /**
     * @dev Function to mint tokens
     * @param to The address that will receive the minted tokens.
     * @param value The amount of tokens to mint.
     * @return A boolean that indicates if the operation was successful.
     */
    function mint(address to, uint256 value) public onlyOwner returns (bool) {
        _mint(to, value);
        return true;
    }

    /**
     * @dev Burns a specific amount of tokens.
     * @param value The amount of token to be burned.
     */
    function burn(uint256 value) public onlyOwner {
        _burn(msg.sender, value);
    }

    /**
     * @dev Burns a specific amount of tokens from the target address and decrements allowance
     * @param from address The account whose tokens will be burned.
     * @param value uint256 The amount of token to be burned.
     */
    function burnFrom(address from, uint256 value) public onlyOwner {
        _burnFrom(from, value);
    }

}
