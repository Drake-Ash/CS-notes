// Last updated: 29/04/2026, 23:10:06
/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode() : val(0), left(nullptr), right(nullptr) {}
 *     TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
 *     TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
 * };
 */
class Solution {
public:

    int height(TreeNode* root, int& ans) {
        if (root == nullptr)
            return 0;
        int lh = height(root->left, ans);
        int rh = height(root->right, ans);

        ans = max(ans, lh + rh + 1);
        return max(lh+1, rh+1);
    }
    
    int diameterOfBinaryTree(TreeNode* root) {
        int ans = INT_MIN;
        height(root, ans);
        return ans-1;
    }
};