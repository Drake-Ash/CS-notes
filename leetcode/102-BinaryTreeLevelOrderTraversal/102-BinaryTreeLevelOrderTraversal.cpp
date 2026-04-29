// Last updated: 29/04/2026, 23:12:51
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
    vector<vector<int>> levelOrder(TreeNode* root) {
        vector<vector<int>> result;
        queue<TreeNode*> q;
        int itemsInCurrLevel = 1;
        q.push(root);

        vector<int> subResult;

        while (!q.empty()) {
            TreeNode *curr = q.front();
            q.pop();
            itemsInCurrLevel--;
            if (curr == nullptr) continue;

            subResult.push_back(curr->val);
            if (curr->left) {
                q.push(curr->left);
            }
            if (curr->right) {
                q.push(curr->right);
            }

            if (itemsInCurrLevel == 0) {
                result.push_back(subResult);
                subResult = {};
                itemsInCurrLevel = q.size();
            }
        }

        return result;
    }
};