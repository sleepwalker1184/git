//
//  TableStack.hpp
//  demo1
//
//  Created by zhang Alex on 2017/10/17.
//  Copyright © 2017年 zhang Alex. All rights reserved.
//

#ifndef TableStack_hpp
#define TableStack_hpp

#include"Base.hpp"


class TableStack :public Base
{
protected:
    vector<char> to_any; 
    vector<char> left_any;
    int tableMap[100][100];
public:
    TableStack(){ memset(tableMap, -1, sizeof(tableMap)); }
    
    void get_table();//predict table
    void analyExp(string s);//analyse
    void print_out();//out put
    void getAns(); //all
};


#endif /* TableStack_hpp */
