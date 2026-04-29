// Last updated: 29/04/2026, 23:14:32
#include <iostream>
#include <cmath>
#include <bits/stdc++.h>

using namespace std;

class Solution
{
public:
    bool isPalindrome(int x)
    {
        int value = abs(x);
        int palindrone = 0;
        while (value > 0)
        {
            int digit = value % 10;
            if (!check_overflow(palindrone, digit))
            {
                palindrone = palindrone * 10 + value % 10;
                value = value / 10;
            }
            else 
                return false;
        }
        return (x == palindrone) ? true : false;
    }
    int check_overflow(int result, int digit)
    {
        if ((result > INT_MAX / 10) || (result < INT_MIN / 10))
            return true;
        return false;
    }
};
