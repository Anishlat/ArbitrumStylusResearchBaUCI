// SPDX-License-Identifier: MIT

/** This ERC721 contract has the below features and therefore is considered a "Complex ERC20 Contract"
Burnable - Token holders will be able to destroy their tokens.
Pasuable - Privileged accounts will be able to pause the functionality marked as whenNotPaused. Useful for emergency response.

Transparent Upgradeability - Uses more complex proxy with higher overhead, requires less changes in your contract. Can also be used with beacons.
*/

pragma solidity ^0.8.20;

import "@openzeppelin/contracts-upgradeable/token/ERC721/ERC721Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721PausableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721BurnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

contract TESTBaUCI is Initializable, ERC721Upgradeable, ERC721PausableUpgradeable, OwnableUpgradeable, ERC721BurnableUpgradeable {
    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function initialize(address initialOwner) initializer public {
        __ERC721_init("TESTBaUCI", "TUCI");
        __ERC721Pausable_init();
        __Ownable_init(initialOwner);
        __ERC721Burnable_init();
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    // The following functions are overrides required by Solidity.

    function _update(address to, uint256 tokenId, address auth)
        internal
        override(ERC721Upgradeable, ERC721PausableUpgradeable)
        returns (address)
    {
        return super._update(to, tokenId, auth);
    }
}