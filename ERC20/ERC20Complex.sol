// SPDX-License-Identifier: MIT

/** This ERC20 contract has the below features and therefore is considered a "Complex ERC20 Contract"

Mintable - Privileged accounts will be able to create more supply.
Burnable - Privileged accounts will be able to pause the functionality marked as whenNotPaused. Useful for emergency response.
Pasuable - Without paying gas, token holders will be able to allow third parties to transfer from their account.
Permit - Without paying gas, token holders will be able to allow third parties to transfer from their account.
Votes - Keeps track of historical balances for voting in on-chain governance, with a way to delegate one's voting power to a trusted account.
Flash Minting - Built-in flash loans. Lend tokens without requiring collateral as long as they're returned in the same transaction.

*/
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20FlashMint.sol";

contract TESTTOKEN is ERC20, ERC20Burnable, ERC20Pausable, Ownable, ERC20Permit, ERC20Votes, ERC20FlashMint {
    constructor(address initialOwner)
        ERC20("TESTTOKEN", "TT")
        Ownable(initialOwner)
        ERC20Permit("TESTTOKEN")
    {
        _mint(msg.sender, 100 * 10 ** decimals());
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // The following functions are overrides required by Solidity.

    function _update(address from, address to, uint256 value)
        internal
        override(ERC20, ERC20Pausable, ERC20Votes)
    {
        super._update(from, to, value);
    }

    function nonces(address owner)
        public
        view
        override(ERC20Permit, Nonces)
        returns (uint256)
    {
        return super.nonces(owner);
    }
}