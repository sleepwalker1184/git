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



class exp:public Base
{
protected:
    node analy_string[100];
    
    
public:
    void preexcute();
};

#endif /* exp_hpp */
