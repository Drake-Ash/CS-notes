// Last updated: 29/04/2026, 23:10:31
class Twitter {
    unordered_map<int, unordered_set<int>> followerMap;
    unordered_map<int, vector<vector<int>>> tweetMap;
    int tweetSeq;
public:
    Twitter() {
        tweetSeq = 0;
    }
    
    void postTweet(int userId, int tweetId) {
        tweetSeq = tweetSeq + 1;
        tweetMap[userId].push_back({tweetSeq, tweetId});
    }
    
    vector<int> getNewsFeed(int userId) {
        priority_queue<vector<int>> maxHeap;

        vector<vector<int>> tweets;
        if (tweetMap.count(userId) != 0) {
            tweets = tweetMap[userId];
            for (int i = 0; i < tweets.size(); i++) {
                maxHeap.push(tweets[i]);
            }
        }

        if (followerMap.count(userId) != 0) {
            unordered_set<int> followers = followerMap[userId];
            for (auto follower: followers) {
                if (tweetMap.count(follower) != 0) {
                    tweets = tweetMap[follower];
                    for (int i = 0; i < tweets.size(); i++) {
                        maxHeap.push(tweets[i]);
                    }
                }
            }
        }

        vector<int> result;
        int k = 10;
        while (k > 0) {
            if (maxHeap.size() != 0) {
                result.push_back(maxHeap.top()[1]);
                maxHeap.pop();
            } else break;
            k--;
        }
        return result;
    }
    
    void follow(int followerId, int followeeId) {
        followerMap[followerId].insert(followeeId);
    }
    
    void unfollow(int followerId, int followeeId) {
        followerMap[followerId].erase(followeeId);
    }
};

/**
 * Your Twitter object will be instantiated and called as such:
 * Twitter* obj = new Twitter();
 * obj->postTweet(userId,tweetId);
 * vector<int> param_2 = obj->getNewsFeed(userId);
 * obj->follow(followerId,followeeId);
 * obj->unfollow(followerId,followeeId);
 */