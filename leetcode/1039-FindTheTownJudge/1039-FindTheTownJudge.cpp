// Last updated: 29/04/2026, 23:08:31
class Solution {
public:
    int findJudge(int n, vector<vector<int>>& trust) {
        vector<int> degree;
        degree.assign(n+1, 0);
        for (int i=0; i < trust.size(); i++) {
            degree[trust[i][0]]--;
            degree[trust[i][1]]++;
        }
        for (int i = 1; i < n+1 ; i ++) {
            if (degree[i] == n-1)
                return i;
        }
        return -1;
    }
};