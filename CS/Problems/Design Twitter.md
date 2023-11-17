---
tags:
  - dsa
  - priority-queue
To_review: true
Status: Complete | Pending review
Link: "[leetcode](https://leetcode.com/problems/design-twitter/description/)"
Time_in_minutes: 27
Difficulty: medium
---
# Problem
## Description
Design a simplified version of Twitter where users can post tweets, follow/unfollow another user, and is able to see the `10` most recent tweets in the user's news feed.

Implement the `Twitter` class:

- `Twitter()` Initializes your twitter object.
- `void postTweet(int userId, int tweetId)` Composes a new tweet with ID `tweetId` by the user `userId`. Each call to this function will be made with a unique `tweetId`.
- `List<Integer> getNewsFeed(int userId)` Retrieves the `10` most recent tweet IDs in the user's news feed. Each item in the news feed must be posted by users who the user followed or by the user themself. Tweets must be **ordered from most recent to least recent**.
- `void follow(int followerId, int followeeId)` The user with ID `followerId` started following the user with ID `followeeId`.
- `void unfollow(int followerId, int followeeId)` The user with ID `followerId` started unfollowing the user with ID `followeeId`.

**Example 1:**

**Input**
["Twitter", "postTweet", "getNewsFeed", "follow", "postTweet", "getNewsFeed", "unfollow", "getNewsFeed"]
[[], [1, 5], [1], [1, 2], [2, 6], [1], [1, 2], [1]]
**Output**
[null, null, [5], null, null, [6, 5], null, [5]]

**Explanation**
Twitter twitter = new Twitter();
twitter.postTweet(1, 5); // User 1 posts a new tweet (id = 5).
twitter.getNewsFeed(1);  // User 1's news feed should return a list with 1 tweet id -> [5]. return [5]
twitter.follow(1, 2);    // User 1 follows user 2.
twitter.postTweet(2, 6); // User 2 posts a new tweet (id = 6).
twitter.getNewsFeed(1);  // User 1's news feed should return a list with 2 tweet ids -> [6, 5]. Tweet id 6 should precede tweet id 5 because it is posted after tweet id 5.
twitter.unfollow(1, 2);  // User 1 unfollows user 2.
twitter.getNewsFeed(1);  // User 1's news feed should return a list with 1 tweet id -> [5], since user 1 is no longer following user 2.

**Constraints:**

- `1 <= userId, followerId, followeeId <= 500`
- `0 <= tweetId <= 104`
- All the tweets have **unique** IDs.
- At most `3 * 104` calls will be made to `postTweet`, `getNewsFeed`, `follow`, and `unfollow`.
## My solution
```cpp
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
```
## Optimal solution
```cpp
same as above
```
## Notes
#dsa
- [ ] Get this under 10 minutes