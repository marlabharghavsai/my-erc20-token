// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyToken {

    // -------------------------
    // Token Metadata
    // -------------------------

    string public name = "MyToken";
    string public symbol = "MTK";
    uint8 public decimals = 18;
    uint256 public totalSupply;

    // -------------------------
    // Balance & Allowance Storage
    // -------------------------

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    // -------------------------
    // ERC-20 Events
    // -------------------------

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    // -------------------------
    // Constructor
    // -------------------------

    constructor(uint256 _totalSupply) {
        totalSupply = _totalSupply;
        balanceOf[msg.sender] = _totalSupply;

        // Emit mint event (tokens created and assigned to deployer)
        emit Transfer(address(0), msg.sender, _totalSupply);
    }

    // -------------------------
    // Step 4: Transfer Function
    // -------------------------

    /**
     * @notice Transfer tokens from the caller to another address
     * @param _to Recipient address
     * @param _value Amount of tokens to transfer
     */
    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(_to != address(0), "Cannot transfer to zero address");
        require(balanceOf[msg.sender] >= _value, "Insufficient balance");

        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    // -------------------------
    // Step 5: Approve Function
    // -------------------------

    /**
     * @notice Approve another address to spend tokens on your behalf
     * @param _spender Address allowed to spend
     * @param _value Amount allowed to spend
     */
    function approve(address _spender, uint256 _value) public returns (bool success) {
        require(_spender != address(0), "Cannot approve zero address");

        allowance[msg.sender][_spender] = _value;

        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    // -------------------------
    // ✅ Step 6: transferFrom Function
    // -------------------------

    /**
     * @notice Transfer tokens from one address to another using an existing allowance
     * @param _from Address to send tokens from (token owner)
     * @param _to Recipient address
     * @param _value Amount of tokens to transfer
     */
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_to != address(0), "Cannot transfer to zero address");
        require(balanceOf[_from] >= _value, "Insufficient balance");
        require(allowance[_from][msg.sender] >= _value, "Insufficient allowance");

        // Update balances
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;

        // Decrease allowance
        allowance[_from][msg.sender] -= _value;

        // Emit Transfer event
        emit Transfer(_from, _to, _value);

        return true;
    }
    // -------------------------
// ✅ Step 7: Helper Functions
// -------------------------

/**
 * @notice Returns the total token supply
 * @dev totalSupply is already public, but this makes intent clearer
 */
function getTotalSupply() public view returns (uint256) {
    return totalSupply;
}

/**
 * @notice Returns complete token information in one call
 * @return tokenName Name of the token
 * @return tokenSymbol Symbol of the token
 * @return tokenDecimals Number of decimals
 * @return supply Total token supply
 */
function getTokenInfo()
    public
    view
    returns (
        string memory tokenName,
        string memory tokenSymbol,
        uint8 tokenDecimals,
        uint256 supply
    )
{
    return (name, symbol, decimals, totalSupply);
}

}
