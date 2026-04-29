// Last updated: 29/04/2026, 23:11:15
class Solution {
    public boolean isAnagram(String s, String t) {
        int[] charArray = new int[26];
        for(int i=0; i<s.length(); i++) {
            int currChar = s.charAt(i) - 'a';
            charArray[currChar] += 1;
        }

        for(int i=0; i<t.length(); i++) {
            int currChar = t.charAt(i) - 'a';
            charArray[currChar] -= 1;
        }
        
        for(int i=0; i<26; i++) {
            if(charArray[i]!=0) {
                return false;
            }
        }
        return true;
     
    }
}