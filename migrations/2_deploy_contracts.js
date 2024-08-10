/*
 * @Describle:
 * @Author: sunmingyuan <fishmooger@gmail.com>
 * @Date: 2024-08-08 23:54:51
 * @LastEditors: sunmingyuan
 * @LastEditTime: 2024-08-11 02:08:49
 */
const Vote = artifacts.require("Vote");

module.exports = function (deployer) {
  deployer.deploy(Vote);
};
