// Last updated: 29/04/2026, 23:13:25
class Solution {
public:    
    vector<vector<int>> merge(vector<vector<int>>& intervals) {
        vector<vector<int>> merged;
        sort(intervals.begin(), intervals.end());

//         for (int i = 0; i < intervals.size(); i++) {
//             int start = intervals[i][0];
//             int end = intervals[i][1];
//             int j =  i + 1;
//             while (j < intervals.size()) {
//                 if (end >= intervals[j][0]) {
//                     if (end < intervals[j][1])
//                         end = intervals[j][1];
//                 }
//                 else
//                     break;
//                 i = j;
//                 j++;
//             }
//             vector<int> result = {start, end};
//             merged.push_back(result);
//         }
        int start = intervals[0][0];
        int end = intervals[0][1];

        int i = 1;
        while (i < intervals.size()) {
            if (end >= intervals[i][0]){
                end = max(end, intervals[i][1]);
            }
            else {
                vector<int> result = {start, end};
                merged.push_back(result);
                start = intervals[i][0];
                end = intervals[i][1];
                continue;
            }
            i++;
        }
        vector<int> result = {start, end};
        merged.push_back(result);
        
        return merged;
    }
};
