/*
    Copyright 2022 JOJO Exchange
    SPDX-License-Identifier: BUSL-1.1
*/

pragma solidity ^0.8.19;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeCast.sol";

/// @notice emergency fallback oracle.
/// Using when the third party oracle is not available.
contract EmergencyOracle is Ownable {
    uint256 public price;
    uint256 public roundId;
    string public description;

    // Align with chainlink
    event AnswerUpdated(int256 indexed current, uint256 indexed roundId, uint256 updatedAt);

    constructor(string memory _description) Ownable() {
        description = _description;
    }

    function getMarkPrice() external view returns (uint256) {
        return price;
    }

    function getAssetPrice() external view returns (uint256) {
        return price;
    }

    function setMarkPrice(uint256 newPrice) external onlyOwner {
        price = newPrice;
        emit AnswerUpdated(SafeCast.toInt256(price), roundId, block.timestamp);
        roundId += 1;
    }
}
