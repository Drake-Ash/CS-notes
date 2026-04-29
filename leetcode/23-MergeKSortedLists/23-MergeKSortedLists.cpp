// Last updated: 29/04/2026, 23:14:04
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
    ListNode* merge_2_lists(ListNode *a, ListNode *b) {
        ListNode* result =new ListNode();
        ListNode *a_ptr = a, *b_ptr = b, *result_ptr = result;

        while (a && b) {
            if (a->val < b->val) {
                result_ptr->next = a;
                a = a->next;
            } else {
                result_ptr->next = b;
                b = b->next;
            }
            result_ptr = result_ptr->next;
        }

        if (a) result_ptr->next = a;
        if (b) result_ptr->next = b;

        return result->next;
    }

    ListNode* mergeKLists(vector<ListNode*>& lists) {
        if (lists.size() == 0) return nullptr;
        ListNode *result;

        vector<ListNode*> combined_list(lists);

        while (combined_list.size() > 1) {
            vector<ListNode*> temp;
            for (int i = 0; i < combined_list.size() - 1; i += 2) {
                temp.push_back(merge_2_lists(combined_list[i], combined_list[i + 1]));
            }
            if (combined_list.size() % 2 == 1) temp.push_back(combined_list[combined_list.size() - 1]);
            combined_list = temp;
        }

        return combined_list[0];
    }
};