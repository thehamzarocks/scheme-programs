#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
#include<cstring>
using namespace std;


int main() {
    /* Enter your code here. Read input from STDIN. Print output to STDOUT */   
    int len,t,i;
    char a[100];
    cin>>t;
    while(t--)
        {
        cin>>a;
        int b[26]={0};
        int c[26]={0};
        int count=0;
        len=strlen(a);
        if(len%2!=0)
            {
            cout<<"-1"<<"\n";
            continue;
            }
        else {
            for(i=0;i<len/2;i++)
                b[(int)a[i]-97]++;
            for(i=len/2;i<len;i++)
                c[(int)a[i]-97]++;
            for(i=0;i<26;i++)
            { if(b[i]!=c[i])
                   count++;
            }
            cout<<count<<"\n";
        }
    }
    return 0;
}

