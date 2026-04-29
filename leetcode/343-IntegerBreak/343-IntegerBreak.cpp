// Last updated: 29/04/2026, 23:10:39
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