// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Vault is Ownable {

    function withdrawTokens(address _tokenAddress, uint256 _amount) public onlyOwner {
        require(_amount > 0, "Amount must be greater than zero");
        require(IERC20(_tokenAddress).balanceOf(address(this)) >= _amount, "Insufficient balance");

        IERC20(_tokenAddress).transfer(owner(), _amount);
    }

    function getBalance(address _tokenAddress) public view returns (uint256) {
        return IERC20(_tokenAddress).balanceOf(address(this));
    }
}
