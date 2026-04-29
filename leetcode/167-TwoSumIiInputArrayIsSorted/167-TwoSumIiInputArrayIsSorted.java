// Last updated: 29/04/2026, 23:12:12
class Solution {
    public int[] twoSum(int[] numbers, int target) {
        int[] response = new int[2];
        int start=0;
        int len = numbers.length;
        int end = len-1;
        while(start<end) {
            int sum = numbers[start]+numbers[end];
            if(sum==target) {
                response[0] = start+1;
                response[1] = end+1;
                break;
            } else if(sum < target) {
                start+=1;
            } else {
                end-=1;
            }
        }
        return response;
    }
}