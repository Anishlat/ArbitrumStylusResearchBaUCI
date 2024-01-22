// SPDX-License-Identifier: MIT

/** This ERC20 contract has the below features as well as a Transparent Upgradeability and therefore is considered a "Complex Upgradeability-T ERC20 Contract"

Mintable - Privileged accounts will be able to create more supply.
Burnable - Privileged accounts will be able to pause the functionality marked as whenNotPaused. Useful for emergency response.
Pasuable - Without paying gas, token holders will be able to allow third parties to transfer from their account.
Permit - Without paying gas, token holders will be able to allow third parties to transfer from their account.
Votes - Keeps track of historical balances for voting in on-chain governance, with a way to delegate one's voting power to a trusted account.
Flash Minting - Built-in flash loans. Lend tokens without requiring collateral as long as they're returned in the same transaction.

Transparent Upgradeability - Uses more complex proxy with higher overhead, requires less changes in your contract. Can also be used with beacons.
*/
pragma solidity ^0.8.20;

import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20BurnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20PausableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20PermitUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20VotesUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20FlashMintUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

contract TESTTOKEN is Initializable, ERC20Upgradeable, ERC20BurnableUpgradeable, ERC20PausableUpgradeable, OwnableUpgradeable, ERC20PermitUpgradeable, ERC20VotesUpgradeable, ERC20FlashMintUpgradeable {
    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function initialize(address initialOwner) initializer public {
        __ERC20_init("TESTTOKEN", "TT");
        __ERC20Burnable_init();
        __ERC20Pausable_init();
        __Ownable_init(initialOwner);
        __ERC20Permit_init("TESTTOKEN");
        __ERC20Votes_init();
        __ERC20FlashMint_init();

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
        override(ERC20Upgradeable, ERC20PausableUpgradeable, ERC20VotesUpgradeable)
    {
        super._update(from, to, value);
    }

    function nonces(address owner)
        public
        view
        override(ERC20PermitUpgradeable, NoncesUpgradeable)
        returns (uint256)
    {
        return super.nonces(owner);
    }
}