// SPDX-License-Identifier: MIT

/** This ERC721 contract has the below features and therefore is considered a "Complex ERC20 Contract"
Burnable - Token holders will be able to destroy their tokens.
Pasuable - Privileged accounts will be able to pause the functionality marked as whenNotPaused. Useful for emergency response.

*/

pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";

contract TESTBaUCI is ERC721, ERC721Pausable, Ownable, ERC721Burnable {
    constructor(address initialOwner)
        ERC721("TESTBaUCI", "TUCI")
        Ownable(initialOwner)
    {}

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    // The following functions are overrides required by Solidity.

    function _update(address to, uint256 tokenId, address auth)
        internal
        override(ERC721, ERC721Pausable)
        returns (address)
    {
        return super._update(to, tokenId, auth);
    }
}