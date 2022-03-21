//PSDX-License-Identifier: MIT

pragma solidity ^0.5.12;

contract Hash{
    function hash(string memory _text, uint _num, address _addr)public returns(bytes32){
        return keccak256(
            abi.encodePacked(_text, _num, _addr)
            );
    }
    //encodePacked('AA', 'ABBB') = encodePacked('AAA','BBB') = encodedPacked('AAABBB');
    function collision(string memory _text1, string memory _text2)public returns(bytes32){
        return keccak256(
            abi.encodePacked(_text1, _text2)
            );
    }

    function nOcollision(string memory _text1, string memory _text2)public returns(bytes32){
        return keccak256(
            abi.encode(_text1, _text2)
            );
    }

    function guessingGame(string memory _word) public returns(bool){
        bytes32 word= 0x421bef64e4915b862cfa3530198c3056e10b52947c5462c723ed425f8fb9df8d;

        return keccak256(abi.encode(_word)) == word;
    }
}
