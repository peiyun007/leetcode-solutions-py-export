
class TimeMap {
    private var map = [String: [(Int, String)]]()
    init() {
        
    }
    
    func set(_ key: String, _ value: String, _ timestamp: Int) {
        map[key, default: []].append((timestamp, value))
    }
    
    func get(_ key: String, _ timestamp: Int) -> String {
        let arr = map[key, default: []]
        var left = 0, right = arr.count
        while left < right {
            let mid = left + (right - left) / 2
            if arr[mid].0 <= timestamp {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return left-1 >= 0 ? arr[left-1].1 : ""
    }
}

/**
 * Your TimeMap object will be instantiated and called as such:
 * let obj = TimeMap()
 * obj.set(key, value, timestamp)
 * let ret_2: String = obj.get(key, timestamp)
 */