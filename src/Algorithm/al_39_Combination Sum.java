package Algorithm;

import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;

/**
 * Given an array of distinct integers candidates and a target integer target, return a list of all unique combinations of candidates where the chosen numbers sum to target. You may return the combinations in any order.

The same number may be chosen from candidates an unlimited number of times. Two combinations are unique if the frequency of at least one of the chosen numbers is different.

The test cases are generated such that the number of unique combinations that sum up to target is less than 150 combinations for the given input.

 

Example 1:

Input: candidates = [2,3,6,7], target = 7
Output: [[2,2,3],[7]]
Explanation:
2 and 3 are candidates, and 2 + 2 + 3 = 7. Note that 2 can be used multiple times.
7 is a candidate, and 7 = 7.
These are the only two combinations.
Example 2:

Input: candidates = [2,3,5], target = 8
Output: [[2,2,2,2],[2,3,3],[3,5]]
Example 3:

Input: candidates = [2], target = 1
Output: []
 

Constraints:

1 <= candidates.length <= 30
2 <= candidates[i] <= 40
All elements of candidates are distinct.
1 <= target <= 40
 */

class solution39 {
    public static void main(String[] args) {
        
    }

    public static List<List<Integer>> combinationSum(int[] candidates, int target) {
        Arrays.sort(candidates);
        List<List<Integer>> resultList = new ArrayList<>();
        recurse(resultList, candidates, new ArrayList<>(), target, 0);
        return resultList;
    }

    public static void recurse(List<List<Integer>> resultList, 
        int[] sourceArray, List<Integer> tempList, int remain, int start) {
        if (remain < 0) return;
        else if (remain == 0) resultList.add(new ArrayList<Integer>(tempList));
        else {
            for (int i = start; i < sourceArray.length; i ++) {
                tempList.add(sourceArray[i]);
                recurse(resultList, sourceArray, tempList, remain-sourceArray[i], i);
                tempList.remove(tempList.size() - 1);
            }
        }
    }
}
