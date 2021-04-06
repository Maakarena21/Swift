func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for i in 0..<nums.count {
            for k in i+1..<nums.count {
                if nums[i] + nums[k] == target {
                    return [i, k]
                }
            }
        }
        return [0, 0]
    }
}
print(twoSum([6,2,3,4,5,6,7], 5))