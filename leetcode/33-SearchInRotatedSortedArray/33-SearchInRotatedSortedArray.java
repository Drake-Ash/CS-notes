// Last updated: 29/04/2026, 23:13:57
class Solution {
    int binarySearch(int[] nums, int start, int end, int target) {
        if(start>end || start<0 || end>nums.length-1) {
            return -1;
        }
        while(start<=end) {
            int mid = start + (end-start)/2;
            if(nums[mid]==target) {
                return mid;
            } else if(nums[mid]<target) {
                start = mid + 1;
            } else {
                end = mid - 1;
            }
        }
        return -1;
    }

    int getPivot(int[] nums) {
        if(nums[0]<=nums[nums.length-1]) {
            return -1;
        }
        int l=0;
        int r = nums.length-1;
        int pivot = -1;
        while(l<=r) {
            int mid = l+(r-l)/2;
            if(mid-1>0 && nums[mid-1]>nums[mid]) {
                pivot = mid;
                break;
            }
            if(mid+1<nums.length && nums[mid+1]<nums[mid]) {
                pivot = mid+1;
                break;
            }
            if(nums[l]<=nums[mid]) {
                l = mid;
            } else {
                r = mid - 1;
            }
        }
        return pivot;
    }

    public int search(int[] nums, int target) {
        int pivot = getPivot(nums);
        if(pivot==-1) {
            return binarySearch(nums, 0, nums.length-1, target);
        }
        int response = -1;
        response = binarySearch(nums, 0, pivot-1, target);
        if(response==-1) {
            response = binarySearch(nums, pivot, nums.length-1, target);
        }
        return response;
    }
}