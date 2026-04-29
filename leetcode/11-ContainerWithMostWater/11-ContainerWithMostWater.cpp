// Last updated: 29/04/2026, 23:14:33
class Solution {
public:
    int maxArea(vector<int>& height) {
        int area = 0;
        for (int i = 0, j = height.size() - 1; i < j;) {
            int currentArea = min(height[i], height[j]) * (j-i);
            if (currentArea > area) {
                area = currentArea;
            }

            if (height[j] > height[i]) {
                i++;
            } else if (height[j] < height[i]) {
                j--;
            } else {
                i++;
                j--;
            }
        }

        return area;
    }
};