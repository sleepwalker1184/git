//
//  exp.hpp
//  demo2
//
//  Created by zhang Alex on 2017/10/23.
//  Copyright © 2017年 zhang Alex. All rights reserved.
//

#ifndef exp_hpp
#define exp_hpp
#include "Base.hpp"
struct lr1node
{
    char left;
    string right;
    int dot;
    string expect;
};

struct lr1set
{
    lr1node node[10];
    int n=0;
};

class exp:public Base
{
public:
    void preexcute();
    void display();
    void CLOSURE(lr1set &x);
    lr1set GOTO(lr1set origin,char turn);
    void MainControl();
    bool Judege(lr1set suspect,int currentsetnum);
    string CLOSUREexpect(char x1,string x2);
    bool judgehelp(bool a[],int n);
    
protected:
    lr1node analy_string[100];
    lr1set analy_set[20];
};

#endif /* exp_hpp */
