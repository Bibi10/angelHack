pragma solidity ^0.4.22;

import "./ERC20.sol";
import "./SafeMath.sol";

contract producer is ERC20 {

    mapping(address => uint256) public balances;
    mapping(address=>mapping(address=>uint256)) internal allowed;

    constructor() public
    {
        balances[msg.sender];
        
    }
    
    event Approval(address _from, address _to, uint256 _value);
    
    function balanceOf(address _address) public view returns(uint256)
    {
        return balances[_address];
    }
    
    function approve(address _spender, uint256 _value) public returns(bool)
    {
      allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
       return true;
    }
    function increaseApproval(address _spender, uint _addedValue) public returns (bool) {
     allowed[msg.sender][_spender] = SafeMath.add(allowed[msg.sender][_spender], _addedValue);
     Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
       return true;
    }
  


}