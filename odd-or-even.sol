// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract OddOrEven{
    uint8 public choice = 0;
    string public message = "Choose between 1 or 2";


    function choose(uint8 newChoice) public {
        require(newChoice == 1 || newChoice == 2, "Choose between 1 or 2");
        choice = newChoice;
    }

    function random() private view returns(uint256){
        return uint(keccak256(abi.encodePacked(block.timestamp, choice)));
    }

    function play(uint8 number) public view  returns(bool) {
        require(number >= 0 && number <=2, "Play 0, 1 or 2");
        require(choice!= 0, "First choose your option (1 = odd, 2 = even)");

        uint256 cpuNumber = random();
        bool isEven = (number + cpuNumber) % 2 == 0;

        if (isEven && choice == 1)
        return true;
        else if (!isEven && choice == 2)
        return true;
        else 
        return false;
    }

}
