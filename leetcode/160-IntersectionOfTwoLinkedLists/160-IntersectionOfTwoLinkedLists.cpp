// Last updated: 29/04/2026, 23:12:07
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
    ListNode *getIntersectionNode(ListNode *headA, ListNode *headB)
    {
        ListNode *ptr = headB;
        while(ptr->next != nullptr) ptr = ptr->next;
        ptr->next = headA;
        
        ListNode* slow = headB;
        ListNode* fast = headB;
        while (slow != nullptr && fast != nullptr) {
            slow = slow->next;
            fast = fast->next;
            if (fast == nullptr) break;
            fast = fast->next;
            
            if (fast == slow) {
                fast = headB;
                while (fast != slow) {
                    fast = fast->next;
                    slow = slow->next;
                }
                ptr->next = nullptr;
                return slow;
            }
        }
        ptr->next = nullptr;
        return nullptr;
    }
};