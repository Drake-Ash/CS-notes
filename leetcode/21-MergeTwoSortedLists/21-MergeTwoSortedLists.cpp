// Last updated: 29/04/2026, 23:14:12
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
    ListNode* mergeTwoLists(ListNode* list1, ListNode* list2) {
        ListNode *result = new ListNode();
        ListNode *result_ptr = result, *list1_ptr = list1, *list2_ptr = list2;

        while (list1_ptr != nullptr && list2_ptr != nullptr) {
            if (list1_ptr->val < list2_ptr -> val) {
                result_ptr->next = list1_ptr;
                list1_ptr = list1_ptr->next;
            } else {
                result_ptr->next = list2_ptr;
                list2_ptr = list2_ptr->next;
            }
            result_ptr = result_ptr->next;
        }

        if (list1_ptr) {
            result_ptr->next = list1_ptr;
        }
        if (list2_ptr) {
            result_ptr->next = list2_ptr;
        }

        return result->next;
    }
};