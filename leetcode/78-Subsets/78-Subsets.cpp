// Last updated: 29/04/2026, 23:13:04
class Solution {
public:
  vector<vector<int>> subsets(vector<int>& nums) {
    vector<int> subset;
    subsets(nums, subset, 0);
    // vector<vector<int>> sets_v;
    // sets_v.insert(sets_v.end(), sets.begin(), sets.end());
    // // for (auto i: sets)
    // //   sets_v.push_back(i);
    return sets; 
  }

private:
  vector<vector<int>> sets;
  void subsets(vector<int>& nums, vector<int>& subset, int pos) {
    if (pos == nums.size()) {
      sets.push_back(subset);
      return;
    }
    subsets(nums, subset, pos+1);
    subset.push_back(nums[pos]);
    subsets(nums, subset, pos+1);
    subset.pop_back();
  } 
};