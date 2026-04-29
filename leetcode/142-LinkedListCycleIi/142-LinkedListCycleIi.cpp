// Last updated: 29/04/2026, 23:12:20
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode(int x) : val(x), next(NULL) {}
 * };
 */
class Solution {
public:
        ListNode *detectCycle(ListNode *head)
    {
        ListNode *fastptr = head;
        ListNode *slowptr = head;

        while (fastptr != nullptr && slowptr != nullptr)
        {
            slowptr = slowptr->next;
            fastptr = fastptr->next;
            if (fastptr == nullptr)
                break;
            fastptr = fastptr->next;
            if (slowptr == fastptr)
            {
                slowptr = head;
                while (fastptr != slowptr)
                {
                    slowptr = slowptr->next;
                    fastptr = fastptr->next;
                }
                return slowptr;
            }
        }
        return nullptr;
    }

};