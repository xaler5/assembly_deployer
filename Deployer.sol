pragma solidity <0.4.9;

contract Deployer {

  function deployCode(bytes memory _code) public returns (address deployedAddress) {
    assembly {
      deployedAddress := create(0, add(_code, 0x20), mload(_code))
      jumpi(invalidJumpLabel, iszero(extcodesize(deployedAddress)))
    }
  }
}
