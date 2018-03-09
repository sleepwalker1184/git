//
//  main.cpp
//  Num of number 1
//
//  Created by zhang Alex on 09/03/2018.
//  Copyright © 2018 zhang Alex. All rights reserved.
//


#include <iostream>
using namespace std;

int main(int argc, const char * argv[])
{
    long input_num;
    long count=0;
    cin>>input_num;
    long lownum=0,highnum=0,currentnum=0;
    int num_postion=1;
    while(input_num/num_postion!=0)
    {
        lownum = input_num - (input_num/num_postion)*num_postion;
        highnum = input_num/(num_postion * 10);
        currentnum = (input_num/num_postion) % 10;
        switch (currentnum)
        {
            case 0:
            {
                count += highnum * num_postion;
                break;
            }
            case 1:
            {
                count += highnum * num_postion + lownum + 1;
                break;
            }
            default:
            {
                count += (highnum + 1)*num_postion;
                break;
            }
        }
        num_postion *=10;
    }
    cout<<count;
}
