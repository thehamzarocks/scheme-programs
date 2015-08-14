#include<iostream>
using namespace std;
int a[100000000];
int binary(int num,int first,int last)
{
  cout<<first<<' '<<last<<"\n"; 
  if(first>last)
    return 0;
    else
    {
  int mid=(first+last)/2;
  if(a[mid]==num)
    return num;
    else if(a[mid]>num)
       return binary(num,mid+1,last);
      else
      return binary(num,first,mid-1);
      }
      }
      int main()
      {
      int n,num,i;
      cin>>n;
      for(i=0;i<n;i++)
      cin>>a[i];
      cin>>num;
      cout<<binary(num,0,n-1);
      return 0;
      }
