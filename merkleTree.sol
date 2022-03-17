//PSDX-License-Identifier: MIT
pragma solidity ^0.5.11;


contract MerkleTree{
    function verify(
        bytes32[] memory proof, bytes32  root, bytes32 leaf, uint index
    ) public pure returns(bool){
        bytes32 hash = leaf;
        for(uint i=0;i<proof.length;i++){
            if(index % 2 == 0)
                hash = keccak256(abi.encodePacked(hash, proof[i]));
            else
                hash = keccak256(abi.encodePacked(proof[i], hash));
            index /= 2;
        }
        return hash == root;
    }
}

contract TestMerkleProof is MerkleTree {
    bytes32[] public hashes;

    constructor() public {
        string[4] memory transactions = [
            "alice -> bob",
            "bob -> dave",
            "carol -> alice",
            "dave -> bob"
        ];

        for (uint i = 0; i < transactions.length; i++) {
            hashes.push(keccak256(abi.encodePacked(transactions[i])));
        }

        uint n = transactions.length;
        uint offset = 0;

        while (n > 0) {
            for (uint i = 0; i < n - 1; i += 2) {
                hashes.push(
                    keccak256(
                        abi.encodePacked(hashes[offset + i], hashes[offset + i + 1])
                    )
                );
            }
            offset += n;
            n = n / 2;
        }
    }

    function getRoot() public view returns (bytes32) {
        return hashes[hashes.length - 1];
    }

    function getHashes() public view returns(bytes32[] memory){
        return hashes;
    }

    function test() public view returns(bool){
        return verify(getHashes(), 0xcc086fcc038189b4641db2cc4f1de3bb132aefbd65d510d817591550937818c7, 0x1bbd78ae6188015c4a6772eb1526292b5985fc3272ead4c65002240fb9ae5d13, 2);
    }
}