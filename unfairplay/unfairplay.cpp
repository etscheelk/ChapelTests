// https://open.kattis.com/problems/unfairplay

#include <iostream>
#include <vector>

using namespace std;

struct match {
    enum status {
        draw,
        aWin,
        bWin,
        NONE
    };
    status s = draw;
    bool rigged = false;
    int teamA;
    int teamB;

    match(int teamA, int teamB) {
        this->teamA;
        this->teamB;
    }
};

vector<int> evalScores(const vector<match>& matches, const vector<int>& teams) {
    vector<int> ret(teams);

    for (auto m : matches) {
        if (m.draw) {
            ret[m.teamA] += 1;
            ret[m.teamB] += 1;
        }
        else if (m.aWin) {
            ret[m.teamA] += 2;
        }
        else if (m.bWin) {
            ret[m.teamB] += 2;
        }
    }

    return ret;
}

int main(int argc, char* argv[]) {
    while (1) {
        int numTeams;
        int numMatches;
        cin >> numTeams;
        
        if (numTeams == -1) break;
        cin >> numMatches;
        
        cout << "numTeams: " << numTeams << "\nnumMatches: " << numMatches << endl;

        vector<int> teams(numTeams, 0);
        for (int i = 0; i < numTeams; ++i) {
            cin >> teams[i];
        }

        vector<match> matches;
        for (int i = 0; i < numMatches; ++i) {
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
        for (auto m : matches) {
            if (m.teamA == teamN) {
                m.s = match::status::aWin;
            }
            if (m.teamB == teamN) {
                m.s = match::status::bWin;
            }
        }
        teams = evalScores(matches, teams);

        for (auto x : teams) {
            cout << x << " ";
        }
        cout << endl;

    }
}