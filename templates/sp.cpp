#include <bits/stdc++.h>
using namespace std;

typedef long long int ll;
typedef unsigned long long int ull;
typedef long double ld;

#define RANDOM srand(94385)
#define p_b push_back
#define p_f push_front
#define pop_b pop_back
#define pop_f pop_front
#define F first
#define S second
#define hashmap unordered_map
#define hashset unordered_set
#define sz(a) signed(a.size())
#define all(a) a.begin(), a.end()
#define rall(a) a.rbegin(), a.rend()

const int N = 100 * 1000 + 256;
const int XN = 1000 * 1000 + 1;
const int MAXN = 1000 * 1000 * 1000 + 7;
const ll LMAXN = 1e18 + 7;

template<class T, class U, class I> inline T MIN (T x, U y, I z){ 
	if(x>=y&&x>=z)return x; 
	if(y>=z&&y>=x)return y; 
	if(z>=y&&z>=x)return z;
}
template<class T, class U> inline bool ifmax(T &x, U y) { if (y > x) return x = y, true; return false; }
template<class T, class U> inline bool ifmin(T &x, U y) { if (y < x) return x = y, true; return false; }
template<class T> inline void sort(T &a) { sort(all(a)); }
template<class T> inline void rsort(T &a) { sort(rall(a)); }
template<class T> inline void reverse(T &a) { reverse(all(a)); }
template<class T> inline T sorted(T a) { sort(a); return a; }


int main (){
	ios_base::sync_with_stdio(0);
	cin.tie(0);
	cout.tie(0);

}

