pragma solidity ^0.4.23;

import './Bet.sol';
import './zeppelin/Ownable.sol';

contract BetManager is Ownable {

	event BetAdded(address betAddress, uint256 matchStart, string p1, string p2);

	mapping(string => bool) players;
	address[] bets;

	constructor() public {
		initPlayers();
	}

	function createBet(
		string _gameId,
		string _p1,
		string _p2,
		bool _drawAllowed,
		uint256 _matchStart,
	    uint256 _durationBetting,
	    uint256 _durationSuggestConfirm)
		external onlyOwner returns (address)
	{
	    require(areValidPlayers(_p1, _p2));
      	require(_matchStart > now);

      	address betContract = new Bet(_gameId, _p1, _p2, _drawAllowed, _matchStart, _durationBetting, _durationSuggestConfirm);
      	bets.push(betContract);

      	emit BetAdded(betContract, _matchStart, _p1, _p2);

      	return betContract;
	}

	function areValidPlayers(string p1, string p2) internal view returns (bool) {
		return (players[p1] == true && players[p2] == true);
	}

	function test(string p1, string p2) external view returns (bool) {
		return areValidPlayers(p1, p2);
	}

	function initPlayers() internal {
		players["Argentina"] = true;
		players["Australia"] = true;
		players["Belgium"] = true;
		players["Brazil"] = true;
		players["Colombia"] = true;
		players["Costa Rica"] = true;
		players["Croatia"] = true;
		players["Denmark"] = true;
		players["Egypt"] = true;
		players["England"] = true;
		players["France"] = true;
		players["Germany"] = true;
		players["Iceland"] = true;
		players["Iran"] = true;
		players["Japan"] = true;
		players["Mexico"] = true;
		players["Morocco"] = true;
		players["Nigeria"] = true;
		players["Panama"] = true;
		players["Peru"] = true;
		players["Poland"] = true;
		players["Portugal"] = true;
		players["Russia"] = true;
		players["Saudi Arabia"] = true;
		players["Senegal"] = true;
		players["Servia"] = true;
		players["South Korea"] = true;
		players["Spain"] = true;
		players["Sweden"] = true;
		players["Switzerland"] = true;
		players["Tunisia"] = true;
		players["Uruguay"] = true;
	}
}