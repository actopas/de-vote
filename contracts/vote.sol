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
    uint[] public keys;
    function vote(uint _id) external {
        // 首先检查list中是否存在该id
        if (candidatesList[_id] == 0 && !containsKey(_id)) {
            keys.push(_id);
        }
        candidatesList[_id] += 1; // 为指定候选人增加一票
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
    // 检查数组中是否包含某个ID
    function containsKey(uint _id) internal view returns (bool) {
        for (uint i = 0; i < keys.length; i++) {
            if (keys[i] == _id) {
                return true;
            }
        }
        return false;
    }
}
