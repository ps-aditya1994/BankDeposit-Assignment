pragma solidity >=0.5.0 <0.6.0;

contract BankDeposit {

    uint account = 500 ether;
    address father;
    address son;
    address daughter;
    

    constructor (address _father, address _son, address _daughter) public {
        father = _father;
        son = _son;
        daughter = _daughter;
    }
    
    function Deposit(uint _amt) public returns (string memory) {
        require(father == msg.sender, "Only Father deposits the money");
        account += _amt;
        return "Deposit was successful";
    }

    modifier onlyChild() {
        require(son == msg.sender || daughter == msg.sender,
        "Only Son/Daughter can withdraw the money");
        _;
    }

    function virtualWithdraw(uint _amt) public onlyChild() returns (string memory) {
        require(account >= _amt+50 ether, "Insufficient Balance/Minimum balance 50 ether required");
        account -= _amt;
        return "Withdrawal Successful";
    }

    function AccountBalance() public view returns (uint) {
        return account;
    }
}
