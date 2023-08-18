
pragma solidity ^0.8.20;

// SPDX-License-Identifier: MIT

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract A is ERC20 {
    uint256 public Sincetime;

    constructor() ERC20("Contract Ae", "ACT") {}

    function MintContract(uint256 amount) external {
        _mint(msg.sender, amount);
    }

    function deposit() external {
        Sincetime = block.timestamp;
        transfer(address(this), balanceOf(msg.sender));
    }

    function Current_Time() external view returns (uint256) {
        return block.timestamp;
    }

    function withdraw() external {
        require((block.timestamp - Sincetime) > 5, "Lock at this moment");
        uint256 extramount = balanceOf(address(this));
        uint256 increment = uint256((extramount * 1) / 4);
        _mint(msg.sender, increment);
        _transfer(address(this), msg.sender, balanceOf(address(this)));
    }
}
