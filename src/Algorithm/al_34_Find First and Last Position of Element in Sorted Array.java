/**
 * Given an array of integers nums sorted in non-decreasing order, find the starting and ending position of a given target value.

If target is not found in the array, return [-1, -1].

You must write an algorithm with O(log n) runtime complexity.

 

Example 1:

Input: nums = [5,7,7,8,8,10], target = 8
Output: [3,4]
Example 2:

Input: nums = [5,7,7,8,8,10], target = 6
Output: [-1,-1]
Example 3:

Input: nums = [], target = 0
Output: [-1,-1]
 

Constraints:

0 <= nums.length <= 105
-109 <= nums[i] <= 109
nums is a non-decreasing array.
-109 <= target <= 109
Seen this question in a real interview before?
1/5
Yes
No
Accepted
2.5M
Submissions
5.5M
Acceptance Rate
46.2%
 */

 package Algorithm;

 class solution34 {
    public static void main(String[] args) {
        int[] a = new int[] {5,7,7,8,8,10};
        int[] b = searchRange(a, 8);
        for (int i : b) {
            System.out.println(i);
        }
    }

    public static int[] searchRange(int[] nums, int target) {
        int low = 0;
        int high = nums.length-1;

        while (low <= high) {
            int middle = low + (high - low) / 2;

            if (target == nums[middle]) {
                int i = 0;
                int j = 0;
                while (middle + i > 0 && nums[middle + (i-1)] == target) i--;
                while (middle + j < nums.length-1 && nums[middle + (j+1)] == target ) j++;
                return new int[] {middle + i, middle + j};
            }

            if (target < nums[middle]) {
                high = middle - 1;
            }

            if (target > nums[middle]) {
                low = middle + 1;
            }
        }

        return new int[] {-1, -1};
    }
 }

