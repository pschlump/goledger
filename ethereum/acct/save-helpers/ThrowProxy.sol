pragma solidity ^0.4.24;

// From: copied with update to contstructor - http://truffleframework.com/tutorials/testing-for-throws-in-solidity-tests
// Test of "Throw"

contract ThrowProxy {
	address public target;
	bytes data;

	constructor(address _target) public {
		target = _target;
	}

	//prime the data using the fallback function.
	function() public {
		data = msg.data;
	}

	function execute() public returns (bool) {
		return target.call(data);
	}
}
