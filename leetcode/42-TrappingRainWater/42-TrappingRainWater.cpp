// Last updated: 29/04/2026, 23:13:50
class Solution {
public:
    vector<int> prefix_max_array(vector<int>&v){
        int n = v.size();
        vector<int>prefixMaxArray(n);
        prefixMaxArray[0] = v[0];
        for(int i=1;i<n;i++){
            prefixMaxArray[i] = max(prefixMaxArray[i-1],v[i]);
        }

        return prefixMaxArray;
    }
    
    vector<int> suffix_max_array(vector<int>&v){
        int n = v.size();
        vector<int>suffixMaxArray(n);
        suffixMaxArray[n-1] = v[n-1];
        for(int i=n-2;i>=0;i--){
            suffixMaxArray[i] = max(suffixMaxArray[i+1],v[i]);
        }

        return suffixMaxArray;
    }
    
    int trap(vector<int>& height) {
        int n = height.size();
        if(n==1 || n==2) return 0;

        vector<int>prefixMaxHeight = prefix_max_array(height);
        vector<int>suffixMaxHeight = suffix_max_array(height);

        int water_stored = 0;

        for(int i=0;i<n;i++){
            int lf_mx = prefixMaxHeight[i];
            int rg_mx = suffixMaxHeight[i];

            water_stored+=(min(lf_mx,rg_mx)-height[i]);
        }

        return water_stored;
    }
};