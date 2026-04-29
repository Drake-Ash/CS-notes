// Last updated: 29/04/2026, 23:12:44
class Solution {
public:
    int maxProfit(vector<int>& prices) {
        if (prices.size() < 2) {
            return 0;
        }
        int maxProfit = 0;

        for (int i = 0, j = 1; i < prices.size() && j < prices.size(); j++) {
            int currentProfit = prices[j] - prices[i];
            maxProfit = max(maxProfit, currentProfit);

            if (prices[i] > prices[j]) {
                i = j;
            }
        }

        return maxProfit;
    }
};