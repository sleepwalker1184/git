//
//  main.cpp
//  demo2
//
//  Created by zhang Alex on 2017/10/20.
//  Copyright © 2017年 zhang Alex. All rights reserved.
//

#include "exp.hpp"
#include "Base.hpp"


int main(int argc, const char * argv[])
{
    class exp a;
//    class Base b;
//    b.inputAndSolve();
//    b.display();
    a.inputAndSolve();
    a.preexcute();
    a.MainControl();
    a.display();
    a.lr1list();
    a.listdisplay();
    cout<<"test2"<<"\n";
    string s;
    cin>>s;
    a.finalanaly(s);
    
    return 0;
}
