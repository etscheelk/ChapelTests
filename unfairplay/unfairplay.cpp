// https://open.kattis.com/problems/unfairplay

#include <iostream>
#include <vector>

using namespace std;

struct match
{
	enum status
	{
		draw,
		aWin,
		bWin,
		NONE
	};
	status s = draw;
	bool rigged = false;
	int teamA;
	int teamB;

	match(int teamA, int teamB)
	{
		this->teamA = teamA;
		this->teamB = teamB;
	}
};

/**
 * @brief Const references to the matches list and teams list
 *
 * @param matches
 * @param teams
 * @return vector<int>
 */
vector<int> evalScores(const vector<match> &matches, const vector<int> &teams)
{
	vector<int> ret(teams);

	for (const match &m : matches)
	{
		if (m.s == m.draw)
		{
			ret[m.teamA - 1] += 1;
			ret[m.teamB - 1] += 1;
		}
		else if (m.s == m.aWin)
		{
			ret[m.teamA - 1] += 2;
		}
		else if (m.s == m.bWin)
		{
			ret[m.teamB - 1] += 2;
		}
	}

	return ret;
}

void printFinalMatches(const vector<match> &matches)
{
	for (const match &m : matches)
	{
		if (m.s == m.aWin)
		{
			cout << "0 ";
		}
		if (m.s == m.draw)
		{
			cout << "1 ";
		} 
		if (m.s == m.bWin)
		{
			cout << "2 ";
		}
	}
	cout << endl;
}

int main(int argc, char *argv[])
{
	while (1)
	{
		int numTeams;
		int numMatches;
		cin >> numTeams;

		if (numTeams == -1)
			break;
		cin >> numMatches;

		cout << "numTeams: " << numTeams << "\nnumMatches: " << numMatches << endl;

		vector<int> teams(numTeams, 0);
		for (int i = 0; i < numTeams; ++i)
		{
			cin >> teams[i];
		}

		vector<match> matches;
		for (int i = 0; i < numMatches; ++i)
		{
			int teamA;
			int teamB;

			cin >> teamA >> teamB;
			matches.push_back(match(teamA, teamB));
		}

		// All input is done for this set of games

		// Strategy
		// 1. Any games where team N playing, get them to win
		//      (it'll be N-1 since I created 0-indexed arrays)
		//      Method: Iterate over all matches
		int teamN = numTeams - 1;
		for (match& m : matches)
		{
			cout << "teamA: " << m.teamA << " teamB: " << m.teamB << endl;
			if (m.teamA-1 == teamN)
			{
				m.s = match::status::aWin;
			}
			if (m.teamB-1 == teamN)
			{
				m.s = match::status::bWin;
			}
		}
		teams = evalScores(matches, teams);

		// Do a few generations trying to optimize the wins, losses, draws of the other teams
		// If we have a team where it's 5-4, there's currently no point to modifying it <--- you're wrong.
		//				3.4 vs 4.5 and then 3.5 vs 2.3 has eliminated a 5-scorer
		//
		// If we have a team where they're 5-3, give it to the lower team
		//
		// I think do this by doing a search for each generation for the largest gap between teams and even them out
		// Stop condition is if enough time has passed
		// Or if we do the check and team N is winning yay
		bool won = false;
		int it = 0;
		while (!won && it < numMatches)
		{
			
			// Iterate through the match list trying to find gaps to close
			for (match& m : matches) 
			{
				int teamA = m.teamA-1;
				int teamB = m.teamB-1;

				if (teamA == teamN || teamB == teamN) continue;

				int teamAscore = teams[teamA];
				int teamBscore = teams[teamB];
				int diff = abs(teamAscore - teamBscore);

				if (diff <= 1) continue;


			}

			it++;
		}

		for (auto x : teams)
		{
			cout << x << " ";
		}
		cout << endl;


		cout << "Final matches:\n";
		cout << matches.size() << endl;
		printFinalMatches(matches);
	}
}