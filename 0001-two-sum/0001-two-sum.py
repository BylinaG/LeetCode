class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        for i in nums:
            nums_shdw = nums.copy()
            nums_shdw.pop(nums.index(i))
            delta = target - i
            if delta in nums_shdw:
                if delta == i:
                   index_1 = nums.index(i)
                   index_2 = nums_shdw.index(i) + 1
                   return(index_1, index_2)
                else:
                    index_1 = nums.index(i)
                    index_2 = nums.index(delta)
                    return(index_1, index_2)