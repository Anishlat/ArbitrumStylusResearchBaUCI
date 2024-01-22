// SPDX-License-Identifier: MIT

/** This ERC1155 contract has the below features and therefore is considered a "Complex ERC20 Contract"
Burnable - Token holders will be able to destroy their tokens.
Supply Tracking - Keeps track of total supply of tokens.

*/

pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Burnable.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Supply.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TESTBaUCI is ERC1155, ERC1155Burnable, ERC1155Supply, Ownable {
    constructor(address initialOwner) ERC1155("") Ownable(initialOwner) {}

    // The following functions are overrides required by Solidity.

    function _update(address from, address to, uint256[] memory ids, uint256[] memory values)
        internal
        override(ERC1155, ERC1155Supply)
    {
        super._update(from, to, ids, values);
    }
}