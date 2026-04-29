// Last updated: 29/04/2026, 23:14:29
class Solution {
    public int maxArea(int[] height) {
        int start=0;
        int end=height.length-1;
        int maxWater = 0;
        while(start<end) {
            int waterHere = Math.min(height[start], height[end]) * (end-start);
            maxWater = Math.max(waterHere, maxWater);
            if(height[start]<height[end]) {
                start+=1;
            } else {
                end-=1;
            }
        }
        return maxWater;
    }
}