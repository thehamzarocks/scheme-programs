#include<iostream>
#include<cstring>
using namesapce std;
int main()
{
char a[100];
char b[100];
cin>>a;
cin>>b;
int l1=strlen(a);
int l2=strlen(b);
int flag=0;
int flag2=0;
for(i=0;i<l1;i++)
{
  for(j=i;j<l2;j++)
   {
     if(a[i+j]!=b[j]) 
      {
          
        
