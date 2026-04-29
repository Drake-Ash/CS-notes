// Last updated: 29/04/2026, 23:13:36
class Solution {
public:
    double myPow(double x, int n) {
        long long nn = n;
        double ans = 1.0;
        if (n < 0) nn = -1*nn;

        while(nn) {
            if(nn%2==1) {
                ans *= x;
                nn--;
            } else {
                x *= x;
                nn /= 2;
            }
        }

        if (n < 0) ans = (double)(1.0) / ans;
        return ans;
    }
};