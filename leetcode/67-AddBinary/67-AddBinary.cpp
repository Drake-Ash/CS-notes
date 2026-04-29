// Last updated: 29/04/2026, 23:13:19
#include <iostream>
using namespace std;

class Solution
{
public:
    string addBinary(string a, string b)
    {
        string result = "";
        int len_a = a.size() - 1;
        int len_b = b.size() - 1;
        int digit_sum = 0;
        while (len_a >= 0 || len_b >= 0 || digit_sum==1)
        {
            digit_sum += len_a >= 0 ? a[len_a] - '0' : 0;
            digit_sum += len_b >= 0 ? b[len_b] - '0' : 0;

            result = char(digit_sum % 2 + '0') + result;
            digit_sum /= 2;
            len_a--;
            len_b--;
        }
        return result;
    }
};
