// Last updated: 29/04/2026, 23:10:47
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