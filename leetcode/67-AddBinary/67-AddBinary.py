# Last updated: 29/04/2026, 23:13:12
class Solution:
    def addBinary(self, a: str, b: str) -> str:    
        return str(bin(int(a,2)+int(b,2)))[2:]