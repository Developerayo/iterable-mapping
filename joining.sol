pragma solidity ^0.5.0;

contract Joining {
    mapping(address => bool) private voted;

    address private management;
    address public userAddress;
    bool public Passed;
    bool public Executed;
    bool public adding;
    uint16 public numberOfPositiveVotes;
    uint256 private minimumNumberOfVotes;

    constructor(
        address _userAddress,
        bool _adding,
        uint256 _minimumNumberOfVotes,
        address _managementContract
    ) public {
        userAddress = _userAddress;
        adding = _adding;
        minimumNumberOfVotes = _minimumNumberOfVotes;
        management = _managementContract;
    }
    function vote(bool _stance, address _origin) external returns (bool propPassed, bool propExecuted) {
        require(msg.sender == management, "invalid caller");
        require(!Executed);
        require(!voted[_origin], "second vote");

        voted[_origin] = true;
        numberOfVotes += 1;
        if (_stance) numberOfPositiveVotes++;

        if ((numberOfVotes >= minimumNumberOfVotes)) {
            execute();
            propExecuted = true;
            propPassed = Passed;
        }
    }
    function execute() private {
        require(!Executed);
        require(
            numberOfVotes >= minimumNumberOfVotes,
            "cannot execute"
        );
    }
}