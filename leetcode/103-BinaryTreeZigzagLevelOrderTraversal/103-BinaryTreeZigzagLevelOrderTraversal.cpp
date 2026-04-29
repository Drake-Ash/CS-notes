// Last updated: 29/04/2026, 23:12:42
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
    vector<vector<int>> zigzagLevelOrder(TreeNode* root) {
        queue<TreeNode*> nodes;
        vector<vector<int>> result;
        if (root == nullptr)
            return result;
        nodes.push(root);
        bool l2r = true;
        int size = 0;
        TreeNode* temp = nullptr;
        
        while (!nodes.empty()) {
            size = nodes.size();
            vector<int> row(size);
            for (int i = 0; i < size; i++) {
                temp = nodes.front();
                nodes.pop();
                
                int index = (l2r)?i:size-i-1;
                row[index] = temp->val;
                if (temp->left != nullptr)
                    nodes.push(temp->left);
                if (temp->right != nullptr)
                    nodes.push(temp->right);
            }
            l2r = !l2r;
            result.push_back(row);
        }

        return result;
    }
};
