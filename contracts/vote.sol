// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Vote {
    // struct Candidate{
    //     string names;
    //     uint id;
    //     uint votes;
    // }
    // Candidate[] public candidatesList;
    mapping(uint => uint) public candidatesList;
    mapping(address => bool) private hasVoted;
    uint[] public keys;
    string public constant VOTE_ALREADY_VOTED = "1";
    function vote(uint _id) external {
        require(!hasVoted[msg.sender], VOTE_ALREADY_VOTED);
        if (candidatesList[_id] == 0 && !containsKey(_id)) {
            keys.push(_id);
        }
        candidatesList[_id] += 1;
        hasVoted[msg.sender] = true;
    }
    function getVoteList()
        external
        view
        returns (uint[] memory, uint[] memory)
    {
        uint[] memory values = new uint[](keys.length);
        for (uint i = 0; i < keys.length; i++) {
            values[i] = candidatesList[keys[i]];
        }
        return (keys, values);
    }
    function containsKey(uint _id) internal view returns (bool) {
        for (uint i = 0; i < keys.length; i++) {
            if (keys[i] == _id) {
                return true;
            }
        }
        return false;
    }
}
