// Last updated: 29/04/2026, 23:08:41
class Solution {
public:
    void merge(vector<int>& nums, int l, int m, int r) {
        int i = l, j = m + 1;
        vector<int> result;

        while(i <= m && j <= r) {
            if (nums[i] < nums[j])
                result.push_back(nums[i++]);
            else
                result.push_back(nums[j++]);
        }

        while (i <= m) result.push_back(nums[i++]);
        while (j <= r) result.push_back(nums[j++]);

        for(i = l; i <= r; i++) {
            nums[i] = result[i-l];
        }
    }

    void mergeSort(vector<int>& nums, int l, int r) {
        if (l >= r) return;

        int m = l + (r - l) / 2;

        mergeSort(nums, l, m);
        mergeSort(nums, m + 1, r);

        merge(nums, l, m, r);
    }

    vector<int> sortArray(vector<int>& nums) {
        mergeSort(nums, 0, nums.size() - 1);
        return nums;
    }
};