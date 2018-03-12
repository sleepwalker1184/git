//
//  main.cpp
//  Biggest subarray
//
//  Created by zhang Alex on 12/03/2018.
//  Copyright © 2018 zhang Alex. All rights reserved.
//

#include <iostream>
using namespace std;

int  crossing_subarray(int a[],int,int,int);
int  findsubarray(int a[],int,int);
int  enumerate_solution(int a[],int,int);

int main(int argc, const char * argv[]) {
    int a[16]={13,-3,-25,20,-3,-16,-23,18,20,-7,12,-5,-22,15,-4,7};
    cout<<findsubarray(a, 0, sizeof(a)/sizeof(a[0])-1)<<endl;
    cout<<enumerate_solution(a,0,sizeof(a)/sizeof(a[0]))<<endl;
}

int  crossing_subarray(int a[],int low,int high,int mid)
{
    int left_sum=-1000;
    int right_sum=-1000;
    
    int sum=0;
    for(int i=mid;i>=low;i--)
    {
        sum+=a[i];
        if(sum>left_sum)
            left_sum=sum;
    }
    
    sum=0;
    for(int i=mid+1;i<=high;i++)
    {
        sum+=a[i];
        if(sum>right_sum)
            right_sum = sum;
    }
    
    return left_sum+right_sum;
}

int  findsubarray(int a[],int low,int high)
{
    if (high == low) {
        return a[low];
    }
    else
    {
        int mid=(low+high)/2;
        int left_sum,right_sum,cross_sum;
        
        left_sum = findsubarray(a, low, mid);
        right_sum = findsubarray(a, mid+1, high);
        cross_sum = crossing_subarray(a, low, high, mid);
        
        if(left_sum>=right_sum&&left_sum>=cross_sum)
            return left_sum;
        else if(right_sum>=left_sum&&right_sum>=cross_sum)
            return right_sum;
        else
            return cross_sum;
    }
}
int enumerate_solution(int a[],int low,int high)
{
    int max=-65535;
    int sum=0;
    for(int i=0;i<high;i++)
    {
        sum+=a[i];
        if(sum>max)
            max=sum;
        for(int j=i+1;j<high;j++)
        {
            sum+=a[j];
            if(sum>max)
                max=sum;
        }
        sum=0;
    }
    return max;
}





