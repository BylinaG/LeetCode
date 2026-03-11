class Solution:
    def reverse(self, x):
        text_x = str(x)
        text_x = text_x[::-1]
        if x<0:
            text_x = -1*int(text_x[:-1])
        else:
            text_x = int(text_x)
        if text_x < -2**31 or text_x > 2**31 - 1:
            return 0
        return text_x