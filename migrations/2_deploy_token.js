'use strict';

const SimpleVoting = artifacts.require('SimpleVoting.sol');


module.exports = function(deployer, network) {
    deployer.deploy(SimpleVoting,['Alice', 'Bob', 'Other'], {gas: 6700000});

};
