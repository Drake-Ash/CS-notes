// Last updated: 29/04/2026, 23:12:59
class Solution {
public:
  vector<vector<int>> subsetsWithDup(vector<int>& nums) {
    sort(nums.begin(), nums.end());
    string set_so_far = "";
    subsets(nums, set_so_far, 0);
    convert();
    return all_subsets;
  }

private:
  unordered_set<string> sets;
  vector<vector<int>> all_subsets;
  void subsets(vector<int>& nums, string& set_so_far, int pos) {
    if (pos == nums.size()) {
      sets.insert(set_so_far);
      return;
    }
    subsets(nums, set_so_far, pos+1);
    int size = set_so_far.size();
    set_so_far += to_string(nums[pos]) + '|'; 
    subsets(nums, set_so_far, pos+1);
    set_so_far = set_so_far.substr(0, size);
  }

  void convert() {
    for(auto i: sets) {
      cout << i << endl;
      all_subsets.push_back(convert(i));
    }
  }

  vector<int> convert(string s) {
    stringstream str(s);
    vector<int> v;
    string i;
    while(getline(str, i, '|')) 
      v.push_back(stoi(i));
    return v;
  }
};