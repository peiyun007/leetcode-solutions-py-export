class Solution {
public:
    int mod = 1e9+7;
    
    int solve(int m , int n , int mx, int sx, int sy, vector<vector<vector<int>>> &cache)
    {
        if(sx<0 || sx>=n || sy<0 || sy>=m)
            return 1;
        if(mx == 0)
            return 0;
        if(cache[mx][sx][sy]!=-1)
            return cache[mx][sx][sy];
        vector<vector<int>> dirs={{-1,0},{1,0},{0,-1},{0,1}};
        
        int res=0;
        for(auto i: dirs)
        {
            res+=(solve(m,n,mx-1,sx+i[0],sy+i[1],cache));
            res%=mod;
        }
        
        return cache[mx][sx][sy] = res%mod;
    }
    int findPaths(int n, int m, int mx, int sx, int sy) {
        
        vector<vector<vector<int>>> cache(mx+1,vector<vector<int>>(n+1,vector<int>(m+1,-1)));
        int ans = solve(m,n,mx,sx,sy,cache);
        return ans%mod;
    }
    
};