//
//  main.cpp
//  OS_Project
//  
//  Created by zhang Alex on 2017/12/7.
//  Copyright © 2017年 zhang Alex. All rights reserved.
//

#include <iostream>
#include <string>
using namespace std;


static string command[]={"cls","date","time","doskey","find","findstr","comp","fc","exit","help","more","print","prompt","sort","type","copy"};

int main(int argc, const char * argv[])
{
    
    string input;
    cin>>input;
    int i;
    for(i=0;i<16;i++)
    {
        if(input==command[i])
            return i;
    }
    switch (i)
    {
        case 0:
        {
            break;
        }
        case 1:
        {
            break;
        }
        case 2:
        {
            break;
        }
        case 3:
        {
            break;
        }
        case 4:
        {
            break;
        }
        case 5:
        {
            break;
        }
        case 6:
        {
            break;
        }
        case 7:
        {
            break;
        }
        case 8:
        {
            break;
        }
        case 9:
        {
            break;
        }
        case 10:
        {
            break;
        }
        case 11:
        {
            break;
        }
        case 12:
        {
            break;
        }
        case 13:
        {
            break;
        }
        case 14:
        {
            break;
        }
        case 15:
        {
            break;
        }
        default:
            break;
    }
    return 0;
}
