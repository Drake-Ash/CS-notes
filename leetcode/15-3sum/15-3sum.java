// Last updated: 29/04/2026, 23:14:17
class Solution {
    public List<List<Integer>> twoSum(int[] nums, int start, int end, int expected) {
        List<List<Integer>> response = new ArrayList<>();
        while(start<end) {
            int sum = nums[start] + nums[end];
            if(expected==sum) {
                while(end>start && nums[start+1]==nums[start]) {
                    start+=1;
                }
                while(end>start && nums[end-1]==nums[end]) {
                    end-=1;
                }
                List<Integer> val = new ArrayList<>();
                val.add(nums[start]);
                val.add(nums[end]);
                response.add(val);
                start+=1;
                end-=1;
            } else if(sum<expected) {
                start+=1;
            } else {
                end-=1;
            }
        }
        return response;
    }
    public List<List<Integer>> threeSum(int[] nums) {
        Arrays.sort(nums);
        int len = nums.length;
        List<List<Integer>> response = new ArrayList<>();
        for(int i=0; i<len-2; i++) {
            int currIndex = i;
            int target = -nums[i];
            if(i>0 && nums[i]==nums[i-1]){
                continue;
            }
            List<List<Integer>> two = twoSum(nums, i+1, len-1, target);
            if(two.size()==0) {
                continue;
            }
            for(List<Integer> l: two) {
                List<Integer> currResponse = new ArrayList<>();
                currResponse.add(nums[i]);
                currResponse.add(l.get(0));
                currResponse.add(l.get(1));
                response.add(currResponse);
            }
        }
        return response;
    }
}