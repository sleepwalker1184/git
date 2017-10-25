//
//  exp.cpp
//  demo2
//
//  Created by zhang Alex on 2017/10/23.
//  Copyright © 2017年 zhang Alex. All rights reserved.
//

#include "exp.hpp"


void exp::preexcute()
{
    int i=0;
    int k=0;
    while(isalpha(analy_str[i].left))
    {
        for (int j=0; j<analy_str[i].right.length(); j++)
        {
            analy_string[k].left=analy_str[i].left;
            analy_string[k].right[j]='.';
            int n=0;
            for (int l=0; l!=j&&l<=analy_str[j].right.length(); l++)
            {
                analy_string[k].right[l]=analy_string[j].right[n];
                n++;
            }
            k++;
        }
        i++;
    }
}
