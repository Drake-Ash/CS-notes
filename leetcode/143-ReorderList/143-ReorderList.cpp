// Last updated: 29/04/2026, 23:12:18
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode() : val(0), next(nullptr) {}
 *     ListNode(int x) : val(x), next(nullptr) {}
 *     ListNode(int x, ListNode *next) : val(x), next(next) {}
 * };
 */
class Solution {
public:
    void reorderList(ListNode* head) {
        ListNode *head_ptr = head;
        vector<ListNode*> nodes;

        while (head_ptr != nullptr) {
            nodes.push_back(head_ptr);
            head_ptr = head_ptr->next;
        }

        ListNode *l_ptr, *r_ptr;
        for (int l = 0, r = nodes.size() - 1; l <= r; l++, r--) {
            l_ptr = nodes[l];
            r_ptr = nodes[r];
            l_ptr->next = r_ptr;
            r_ptr->next = l+1 == r || l == r ? nullptr : nodes[l+1];
        }
    }
};