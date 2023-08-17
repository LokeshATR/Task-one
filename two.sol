pragma solidity ^0.8.20;

// SPDX-License-Identifier: MIT

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

interface Defns {
    function Transfer_fromA(
        address from,
        address to,
        uint256 amount
    ) external;

    function return_mint_amount() external  view returns  (uint);
}

contract B is ERC20 {
    uint256 public initialamount;
    Defns public Aobject;

    constructor() ERC20("Contract B", "BCT") {
    }

    function InitializeContractAddress(address ads) public {
        Aobject = Defns(ads);
        _mint(msg.sender, Aobject.return_mint_amount());
    }

    function transferto_amount(address to, uint256 amount) external {
        transfer(to, amount);
        Aobject.Transfer_fromA(msg.sender, to, amount);
    }

    function Transfer_fromB(
        address from,
        address to,
        uint256 amount
    ) external {
        _transfer(from, to, amount);
    }

    function mint_contract(uint256 amount) public {
        _mint(msg.sender, amount);
        initialamount = amount;
    }

    function return_mint_amount() external  view returns  (uint){
       return initialamount;
    }
}
