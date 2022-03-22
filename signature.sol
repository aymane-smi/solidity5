//SDX-License-Identifier: MIT
pragma solidity ^0.5.12;

contract Signature{
    function getMessageHash(
        address _to, string memory _text, uint _amount, uint _nonce
    ) public returns(bytes32){
        return keccak256(abi.encodePacked(_to, _amount, _text, _nonce));
    }

    function getEthMessageHash(bytes32 messageHash) public returns(bytes32){
        return keccak256(abi.encodePacked(
            "\x19Ethereum Signed Message\n:32",
            messageHash
        ));
    }

    function verify(address signer,
                    address _to, string memory _text, uint _amount, uint nonce,
                    bytes memory _signature
    ) public returns(bool){
        bytes32 HashedMessage = getMessageHash(_to, _text, _amount, nonce);
        bytes32 HashedEthMessage = getEthMessageHash(HashedMessage);

        return recoverSigner(HashedEthMessage, _signature) == signer;
    }

    function recoverSigner(bytes32 HashEthMessage, bytes memory _signature)public returns(address){
        (bytes32 r, bytes32 s, uint8 v) = splitSignature(_signature);
        return ecrecover(HashEthMessage, v, r, s);
    }

    function splitSignature(bytes memory _signature)public returns(bytes32 r, bytes32 s, uint8 v){
        require(_signature.length == 65 , 'invalid length for the signature');
        assembly{
            r := mload(add(_signature, 32))
            v := mload(add(_signature, 64))
            s := byte(0, mload(add(_signature, 96)))
        }
        }
    }