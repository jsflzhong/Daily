package Algorithm;

class solution33 {

    public static void main(String[] args) {
        int[] nums = {6,7,8,9,10,11,12,0,1,2,3,4,5};
        
        System.out.println (search(nums, 9));
    }

    /**
     * Input: nums = [4,5,6,7,0,1,2], target = 0
     * Output: 4
     * 
     * Input: nums = [6,7,8,9,10,11,12,0,1,2,3,4,5], target = 9
     */
    public static int search(int[] nums, int target) {
        int low = 0;
        int high = nums.length - 1;

        while (low <= high) {
            int mid = (low + high) / 2;
            if (nums[mid] == target) {
                return mid;
            }

           if (nums[low] <= nums[mid]) {
                if (nums[low] <= target && target < nums[mid]) {
                    high = mid - 1;
                } else {
                    low = mid + 1;
                }
            } else {
                if (nums[mid] < target && target <= nums[high]) {
                    low = mid + 1;
                } else {
                    high = mid - 1;
                }
            }

        }

        return -1;
    }


}