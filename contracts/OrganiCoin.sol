pragma solidity ^0.4.22;

import "./ERC20.sol";
import "./SafeMath.sol";

contract OrganiCoin is ERC20
{
    mapping(address => uint256) public balances;
    
    constructor() public
    {
        balances[msg.sender] = 1000;
    }
    
    event Transfer(address _from, address _to, uint256 _value);
    
    function balanceOf(address _address) public view returns(uint256)
    {
        return balances[_address];
    }
    function transfer(address _to, uint256 _value) public returns(bool)
    {
        require(balances[msg.sender] >= _value);
        require(balances[_to] + _value >= balances[_to]); 
        balances[_to] += _value;
        balances[msg.sender] -= _value;
        emit Transfer(msg.sender, _to, _value);
        
        return true;
    }
}
