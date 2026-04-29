// Last updated: 29/04/2026, 23:14:11
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
    ListNode* removeNthFromEnd(ListNode* head, int n) {
        ListNode *ahead_ptr = head, *n_ptr = head, *prev = nullptr;
        while (n != 0) {
            ahead_ptr = ahead_ptr->next;
            n--;
        }

        while (ahead_ptr != nullptr) {
            ahead_ptr = ahead_ptr->next;
            prev = n_ptr;
            n_ptr = n_ptr->next;
        }

        if (prev == nullptr) {
            return head->next;
        };

        prev->next = n_ptr->next;
        return head;
    }
};