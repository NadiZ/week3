pragma solidity ^0.4.18;

contract SimpleVoting {

    mapping (bytes32 => uint8) public votesReceived;

    bytes32[] public candidateList;

    constructor(bytes32[] candidateNames) public {
        candidateList = candidateNames;
    }

    modifier validated (bytes32 candidate){
        require(validCandidate(candidate));
        _;
    }

    function totalVotesFor(bytes32 candidate) view public validated(candidate) returns (uint8) {
        return votesReceived[candidate];
    }

    function voteForCandidate(bytes32 candidate) public validated(candidate) {
        votesReceived[candidate] +=1;
    }

    function validCandidate(bytes32 candidate) view public returns (bool){
        for(uint i = 0; i < candidateList.length; i++){
            if(candidateList[i] == candidate){
                return true;
            }
        }
        return false;
    }
}

