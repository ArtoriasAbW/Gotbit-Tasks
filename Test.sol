pragma solidity >=0.7.0 <0.9.0;
contract Test {
    bytes32 private hash_of_secret;
    constructor (bytes32 _hash_of_secret) {
        hash_of_secret = _hash_of_secret;
    }
    receive() external payable {
        // эта функция принимает ETH
        // на баланс контракта
    }

    function claim_eth_by_secret(bytes memory secret) public {
        // При условии если прислан
        // прообраз ранее сохраненного хеша
        // отправляет весь баланс отправителю
        // транзакции и уничтожает контракт.
        require (keccak256(secret) == hash_of_secret);
        selfdestruct(payable(address(msg.sender)));
    }
}