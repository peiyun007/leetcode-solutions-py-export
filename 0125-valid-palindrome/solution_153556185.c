bool isAlpha(char ch) {
    return ch>='A' && ch<='Z' || ch>='a' && ch<='z' || ch>='0' && ch<='9';
}

bool isPalindrome(char* s) {
    int len = strlen(s);
    int left = 0, right = len - 1;
    while(left < right) {
        if (!isAlpha(s[left])) {
            left ++;
            continue;
        }
        if (!isAlpha(s[right])) {
            right --;
            continue;
        }
        if (s[left] >= 'A' && s[left] <= 'Z') {
            s[left] = s[left] - 'A' + 'a';
        }
        if (s[right] >= 'A' && s[right] <= 'Z') {
            s[right] = s[right] - 'A' + 'a';
        }
        if (s[left] == s[right]) {
            left ++;
            right --;
            continue;
        }
        return false;
    }
    return true;
}