// Forward declaration of isBadVersion API.
bool isBadVersion(int version);

int firstBadVersion(int n) {
    int low = 1;
    int high = n;
    int middle = 0;
    while(low < high) {
        middle = low + (high - low) / 2;
        if(!isBadVersion(middle)) {
            low = middle + 1;
        } else {
            high = middle;
        }
    }
    return low;
}