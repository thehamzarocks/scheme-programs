#include<iostream>
using namespace std;
int main()
{
   long x,y,n;
   int a[100000],b[100000];
   long i;
   long int sum=0;
   cin>>n>>x>>y;
for(i=0;i<n;i++)
{
if(x!=0)
 {
   if(y!=0)
   {
     if(a[i]>=b[i])
      {
   	sum+=a[i];
   	x--;
      }
     else 
      {   
   	sum+=b[i];
   	y--;
      }
   }
   else 
   {
   sum+=a[i];
   x--;
   }
 }
 else if(y!=0)
 {
   sum+=b[i];
   y--;
 }
 if(y==0&&x==0)
 {
 cout<<sum;
 return 0;
 }
}
   cout<<sum;
   return 0;
   }
     
   
      
