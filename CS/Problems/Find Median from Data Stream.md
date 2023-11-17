---
tags:
  - dsa
  - priority-queue
To_review: true
Status: Complete | Pending review
Link: "[leetcode](https://leetcode.com/problems/find-median-from-data-stream/description/)"
Time_in_minutes: 16
Difficulty: hard
---
# Problem
## Description
The **median** is the middle value in an ordered integer list. If the size of the list is even, there is no middle value, and the median is the mean of the two middle values.

- For example, for `arr = [2,3,4]`, the median is `3`.
- For example, for `arr = [2,3]`, the median is `(2 + 3) / 2 = 2.5`.

Implement the MedianFinder class:

- `MedianFinder()` initializes the `MedianFinder` object.
- `void addNum(int num)` adds the integer `num` from the data stream to the data structure.
- `double findMedian()` returns the median of all elements so far. Answers within `10-5` of the actual answer will be accepted.

**Example 1:**

**Input**
["MedianFinder", "addNum", "addNum", "findMedian", "addNum", "findMedian"]
[[], [1], [2], [], [3], []]
**Output**
[null, null, null, 1.5, null, 2.0]

**Explanation**
MedianFinder medianFinder = new MedianFinder();
medianFinder.addNum(1);    // arr = [1]
medianFinder.addNum(2);    // arr = [1, 2]
medianFinder.findMedian(); // return 1.5 (i.e., (1 + 2) / 2)
medianFinder.addNum(3);    // arr[1, 2, 3]
medianFinder.findMedian(); // return 2.0

**Constraints:**

- `-105 <= num <= 105`
- There will be at least one element in the data structure before calling `findMedian`.
- At most `5 * 104` calls will be made to `addNum` and `findMedian`.

**Follow up:**

- If all integer numbers from the stream are in the range `[0, 100]`, how would you optimize your solution?
- If `99%` of all integer numbers from the stream are in the range `[0, 100]`, how would you optimize your solution?
## My solution
```cpp
class MedianFinder {
    priority_queue<int, vector<int>, greater<int>> rightHalf;
    priority_queue<int> leftHalf;
public:
    MedianFinder() {
    }
    
    void addNum(int num) {
        leftHalf.push(num);

        if (rightHalf.size() != 0) {
            if (leftHalf.top() > rightHalf.top()) {
                rightHalf.push(leftHalf.top());
                leftHalf.pop();
                leftHalf.push(rightHalf.top());
                rightHalf.pop();
            }
        }
        if (leftHalf.size() == rightHalf.size() + 2) {
            rightHalf.push(leftHalf.top());
            leftHalf.pop();
        }
    }
    
    double findMedian() {
        double median = 0;
        if (leftHalf.size() == rightHalf.size())
            median = double(leftHalf.top() + rightHalf.top()) / 2;
        else
            median = leftHalf.top();
        return median;
    }
};

/**
 * Your MedianFinder object will be instantiated and called as such:
 * MedianFinder* obj = new MedianFinder();
 * obj->addNum(num);
 * double param_2 = obj->findMedian();
 */
```
## Optimal solution
```cpp
same as above
```
## Notes
#dsa
1. think of other solutions apart from priority queue here, call it out as well
- [ ] Get this under 15 minutes