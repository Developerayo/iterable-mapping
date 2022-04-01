pragma solidity ^0.5.0;

contract Joining {
    mapping(address => bool) private voted;

    address private management;
    address public userAddress;
    bool public Passed;
    bool public Executed;
    bool public adding;
    uint8 private majorityMargin;
    uint16 public numberOfVotes;
    uint16 public numberOfPositiveVotes;
    uint256 private minimumNumberOfVotes;

    constructor(
        address _userAddress,
        bool _adding,
        uint256 _minimumNumberOfVotes,
        uint8 _majorityMargin,
        address _managementContract
    ) public {
        userAddress = _userAddress;
        adding = _adding;
        minimumNumberOfVotes = _minimumNumberOfVotes;
        majorityMargin = _majorityMargin;
        management = _managementContract;
    }
    function kill() external {
        require(msg.sender == management, "invalid caller");
        require(Executed, "!executed");
        selfdestruct(msg.sender);
    }

    function vote(bool _stance, address _origin) external returns (bool propPassed, bool propExecuted) {
        require(msg.sender == management, "invalid caller");
        require(!Executed, "executed");
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
        require(!Executed, "executed");
        require(
            numberOfVotes >= minimumNumberOfVotes,
            "cannot execute"
        );
        Executed = true;
        Passed = ((numberOfPositiveVotes * 100) / numberOfVotes) >= majorityMargin;
    }
}