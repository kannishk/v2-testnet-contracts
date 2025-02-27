// SPDX-License-Identifier: MIT OR Apache-2.0

pragma solidity ^0.8.0;

interface IContractDeployer {
    event ContractDeployed(address indexed deployerAddress, bytes32 indexed bytecodeHash, address indexed contractAddress);

    function getNewAddressCreate2(
        address _sender,
        bytes32 _bytecodeHash,
        bytes32 _salt,
        bytes calldata _input
    ) external pure returns (address newAddress);

    function getNewAddressCreate(
        address _sender,
        uint256 _senderNonce
    ) external pure returns (address newAddress);

    function create2 (
        bytes32 _salt,
        bytes32 _bytecodeHash,
        uint256 _value,
        bytes calldata _input
    ) external returns (address newAddress, bytes memory constructorRevertData);

    function create2Account (
        bytes32 _salt,
        bytes32 _bytecodeHash,
        uint256 _value,
        bytes calldata _input
    ) external returns (address newAddress, bytes memory constructorRevertData);

    /// @dev While the `_salt` parameter is not used anywhere here, 
    /// it is still needed for consistency between `create` and
    /// `create2` functions (required by the compiler).
    function create (
        bytes32 _salt,
        bytes32 _bytecodeHash,
        uint256 _value,
        bytes calldata _input
    ) external returns (address newAddress, bytes memory constructorRevertData);

    /// @dev While `_salt` is never used here, we leave it here as a parameter
    /// for the consistency with the `create` function.
    function createAccount (
        bytes32 _salt,
        bytes32 _bytecodeHash,
        uint256 _value,
        bytes calldata _input
    ) external returns (address newAddress, bytes memory constructorRevertData);
}
