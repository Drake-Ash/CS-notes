// Last updated: 29/04/2026, 23:14:09
class Solution {
    public boolean isValid(String s) {
        boolean isValid = true;
        Stack<Character> stack = new Stack<>();
        for(int i=0; i<s.length(); i++) {
            if(s.charAt(i)=='[' || s.charAt(i)=='{' || s.charAt(i)=='(') {
                stack.push(s.charAt(i));
            } else {
                if (stack.empty()) {
                    return false;
                } else {
                    Character top = stack.pop();
                    if(top=='[') {
                        if(s.charAt(i)==']') {
                            continue;
                        }
                        return false;
                    } else if (top =='{') {
                        if(s.charAt(i)=='}') {
                            continue;
                        }
                        return false;
                    } else {
                        if(s.charAt(i)==')') {
                            continue;
                        }
                        return false;
                    }
                }
            }
        } 

        if(stack.empty()) {
            return true;
        } else {
            return false;
        }
    }
}