// Last updated: 29/04/2026, 23:14:26
#include <iostream>
#include <bits/stdc++.h>
using namespace std;

class Solution
{
public:
    int reverse(int x) {
        int result = 0;
        while(x!=0){
            int digit = x%10;
            x = x/10;

            result = check_overflow(result, digit);
        }
        return result;
    }
    int check_overflow(int result, int digit){
        if ((result > INT_MAX/10) || (result < INT_MIN/10))
            return 0;
        return result*10 + digit;
    }
};