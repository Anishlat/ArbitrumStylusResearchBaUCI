// SPDX-License-Identifier: MIT

/** This ERC1155 contract has the below features and therefore is considered a "Complex ERC20 Contract"
Burnable - Token holders will be able to destroy their tokens.
Supply Tracking - Keeps track of total supply of tokens.

Transparent Upgradeability - Uses more complex proxy with higher overhead, requires less changes in your contract. Can also be used with beacons.
*/

pragma solidity ^0.8.20;

import "@openzeppelin/contracts-upgradeable/token/ERC1155/ERC1155Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC1155/extensions/ERC1155BurnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC1155/extensions/ERC1155SupplyUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

contract TESTBaUCI is Initializable, ERC1155Upgradeable, ERC1155BurnableUpgradeable, ERC1155SupplyUpgradeable, OwnableUpgradeable {
    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function initialize(address initialOwner) initializer public {
        __ERC1155_init("");
        __ERC1155Burnable_init();
        __ERC1155Supply_init();
        __Ownable_init(initialOwner);
    }

    // The following functions are overrides required by Solidity.

    function _update(address from, address to, uint256[] memory ids, uint256[] memory values)
        internal
        override(ERC1155Upgradeable, ERC1155SupplyUpgradeable)
    {
        super._update(from, to, ids, values);
    }
}