---
tags:
  - dsa
  - DP
To_review: true
Status: Review again
Link: "[leetcode](https://leetcode.com/problems/integer-break/description/)"
Time_in_minutes: 15
Difficulty: medium
---
# Problem
## Description

## My solution
```cpp
class Solution {
public:
    int integerBreak(int n) {
         if (n <= 3) return n - 1;

         auto [k, r] = div(n, 3);

        if (r == 0) return pow(3, n/3);
        if (r == 1) return pow(3, n/3 - 1) * 4;
        return pow(3, n/3) * 2;
    }
};
```
## Optimal solution
```cpp
class Solution {
public:
    int integerBreak(int n) {
        if (n <= 3) {
            return n - 1;
        }
        
        vector<int> dp(n + 1, 0);

        // Set base cases
        for (int i = 1; i <= 3; i++) {
            dp[i] = i;
        }
        
        for (int num = 4; num <= n; num++) {
            int ans = num;
            for (int i = 2; i < num; i++) {
                ans = max(ans, i * dp[num - i]);
            }
            
            dp[num] = ans;
        }
        
        return dp[n];
    }
};

class Solution {
public:
    vector<int> memo;
    
    int integerBreak(int n) {
        if (n <= 3) {
            return n - 1;
        }
        
        memo = vector(n + 1, 0);
        return dp(n);
    }
    
    int dp(int num) {
        if (num <= 3) {
            return num;
        }
        
        if (memo[num] != 0) {
            return memo[num];
        }
        
        int ans = num;
        for (int i = 2; i < num; i++) {
            ans = max(ans, i * dp(num - i));
        }
        
        memo[num] = ans;
        return ans;
    }
};
```
## Notes
#dsa
1. There are multiple solutions for this
2. Check both DP and math solution
- [ ] Get this under 10 minutes