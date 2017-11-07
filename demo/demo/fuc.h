#pragma once

#define Max 655  //最大代码长度
#define WordMaxNum 256   //变量最大个数
#define DigitNum 256    //常量最大个数
#define MaxKeyWord  10  //关键字数量
#define MaxOptANum 4    //运算符最大个数
#define MaxOptBNum 8    //运算符最大个数
#define MaxBoderNum 9    //界符最大个数

bool errorFlag = 0; //错误标志
int TableNum = 0;   //table指针
int WordNum = 0;   //变量表的下标
int DigNum = 0;     //常量表的下标

const char* keyword[] = { "do","end","for","if","printf","scanf","then","while","int","main" };
const char boder[] = { ',',';','(',')','[',']','{','}','"'};
const char optA[] = { '+','-','*','/' };
const char *optB[] = { "<","<=","==",">",">=","<>","=","%d"};
char word[WordMaxNum][20];
char digit[DigitNum][20];
typedef struct distable
{
    int list;
    int listpos;
    int row;
    int line;
    char value[20];
}Table;

enum errorType { VarExceed = 1, PointError = 2, ConExceed = 3 };
bool isopt(char);
int searchvarword(char*);
int searchdigit(char*);
/*void error(char str[20], int prow, int pline, int errorType)
{
    cout << " \nError :    ";
    switch (errorType)
    {
        case VarExceed:
            cout << "第" << prow - 1 << "行" << str << " 变量的长度超过限制！\n";
            errorFlag = 1;
            break;
        case PointError:
            cout << "第" << prow - 1 << "行" << str << " 小数点错误！\n";
            errorFlag = 1;
            break;
        case ConExceed:
            cout << "第" << prow - 1 << "行" << str << " 常量的长度超过限制！\n";
            errorFlag = 1;
            break;
    }
}*/



void scanner(char ch[],int charlen,Table table[Max],int prow,int pline)
{
    int Charpointer = 0;
    while (Charpointer < charlen)
    {
        while (ch[Charpointer] == 32 || ch[Charpointer] == 9)
        {
            Charpointer++;
        }
        
        if(ch[Charpointer]=='/')
        {
            Charpointer++;
            if(ch[Charpointer]=='/')
            {
                while(ch[Charpointer]!='\n')
                    Charpointer++;
            }
        }
        
        while (ch[Charpointer] == '\n')
        {
            prow++;
            pline = 0;
            Charpointer++;
        }
        //alpha
        if (isalpha(ch[Charpointer]) || ch[Charpointer] == '_')
        {
            char str[256];
            int strLen = 0;
            while (isalpha(ch[Charpointer]) || ch[Charpointer] == '_')
            {
                str[strLen++] = ch[Charpointer];
                Charpointer++;
                while (isdigit(ch[Charpointer]))
                {
                    str[strLen++] = ch[Charpointer];
                    Charpointer++;
                }
            }
            str[strLen] = 0;
            pline++;
            if (strlen(str) > 20)
            {
                char strerror[] = { 't','o','o','l','o','n','g' };
                strcpy(table[TableNum].value, strerror);
                table[TableNum].list = 7;
                table[TableNum].listpos = -1;
                table[TableNum].row = prow;
                table[TableNum].line = pline;
                TableNum++;
            }
            else
            {
                int i;
                for (i = 0; i < MaxKeyWord; i++)
                {
                    if (strcmp(str, keyword[i]) == 0)
                    {
                        strcpy(table[TableNum].value, str);
                        table[TableNum].list = 1;
                        table[TableNum].listpos = i;
                        table[TableNum].row = prow;
                        table[TableNum].line = pline;
                        TableNum++;
                        break;
                    }
                }
                if (i >= MaxKeyWord)
                {
                    int varwordpos=searchvarword(str);
                    if(varwordpos==-1)
                    {
                        strcpy(table[TableNum].value, str);
                        table[TableNum].list = 5;
                        table[TableNum].listpos = WordNum;
                        table[TableNum].row = prow;
                        table[TableNum].line = pline;
                        strcpy(word[WordNum++], str);
                        TableNum++;
                    }
                    else
                    {
                        strcpy(table[TableNum].value, str);
                        table[TableNum].list=5;
                        table[TableNum].listpos=varwordpos;
                        table[TableNum].row=prow;
                        table[TableNum].line=pline;
                        TableNum++;
                    }
                }
            }
        }
        
        //digit
        else if (isdigit(ch[Charpointer]))
        {
            bool legalflag= true;
            int flag = 0;
            char str[256];
            int strLen = 0;
            while (isdigit(ch[Charpointer]) || ch[Charpointer] == '.'||isalpha(ch[Charpointer]))
            {
                if(isalpha(ch[Charpointer]))
                    legalflag=false;
                if (ch[Charpointer] == '.')
                    flag++;
                str[strLen++] = ch[Charpointer];
                Charpointer++;
            }
            str[strLen] = 0;
            pline++;
            if (strlen(str) > 20)
            {
                char strerror[] = { 't','o','o','l','o','n','g' };
                strcpy(table[TableNum].value, strerror);
                table[TableNum].list = 7;
                table[TableNum].listpos = -1;
                table[TableNum].row = prow;
                table[TableNum].line = pline;
                TableNum++;
            }
            else if(!legalflag)
            {
                strcpy(table[TableNum].value, str);
                table[TableNum].list = 7;
                table[TableNum].listpos = -1;
                table[TableNum].row = prow;
                table[TableNum].line = pline;
                TableNum++;
            }
            else
            {
                if (flag > 1)
                {
                    strcpy(table[TableNum].value, str);
                    table[TableNum].list = 7;
                    table[TableNum].listpos = -1;
                    table[TableNum].row = prow;
                    table[TableNum].line = pline;
                    TableNum++;
                }
                if (flag == 0 || flag == 1)
                {
                    int digpos=searchdigit(str);
                    if(digpos==-1)
                    {
                    strcpy(table[TableNum].value, str);
                    table[TableNum].listpos = DigNum;
                    strcpy(digit[DigNum++], str);
                    table[TableNum].list = 6;
                    table[TableNum].row = prow;
                    table[TableNum].line = pline;
                    TableNum++;
                    }
                    else
                    {
                        strcpy(table[TableNum].value, str);
                        table[TableNum].listpos = digpos;
                        table[TableNum].list=6;
                        table[TableNum].row=prow;
                        table[TableNum].line=pline;
                        TableNum++;
                    }
                }
            }
            
        }
        
        //sympol
        else if(ch[Charpointer]!=NULL&&ch[Charpointer]!='\n'&&ch[Charpointer]!='\t'&&ch[Charpointer]!=' ')
        {
            int errorFlag=-1;
            char str[10];
            int strLen = 0;
            while (isopt(ch[Charpointer]))
            {
                str[strLen++] = ch[Charpointer];
                Charpointer++;
            }
            str[strLen] = 0;
            pline++;
            int i;
            for (i = 0; i < MaxOptBNum; i++)
            {
                if (strcmp(str, optB[i]) == 0)
                {
                    errorFlag = 0;
                    strcpy(table[TableNum].value, str);
                    table[TableNum].list = 4;
                    table[TableNum].listpos = i;
                    table[TableNum].row = prow;
                    table[TableNum].line = pline;
                    TableNum++;
                    break;
                }
            }
            if (i >= MaxOptBNum)
            {
                for (int k = 0; k < MaxOptANum; k++)
                {
                    if (optA[k]==ch[Charpointer-1])
                    {
                        errorFlag = 1;
                        strcpy(table[TableNum].value, str);
                        table[TableNum].list = 3;
                        table[TableNum].listpos = k;
                        table[TableNum].row = prow;
                        table[TableNum].line = pline;
                        TableNum++;
                        break;
                    }
                }
                for (int j = 0; j<MaxBoderNum; j++)
                {
                    if (boder[j] == ch[Charpointer-1])
                    {
                        errorFlag = 2;
                        strcpy(table[TableNum].value, str);
                        table[TableNum].list = 2;
                        table[TableNum].listpos = j;
                        table[TableNum].row = prow;
                        table[TableNum].line = pline;
                        TableNum++;
                        break;
                    }
                }
                
                //error
                if (errorFlag != 0 && errorFlag != 1&&errorFlag!=2)
                {
                    strcpy(table[TableNum].value, str);
                    table[TableNum].list = 7;
                    table[TableNum].listpos = -1;
                    table[TableNum].row = prow;
                    table[TableNum].line = pline;
                    TableNum++;
                }
            }
        }
    }
}
int searchvarword(char *x)
{
    int i;
    for(i=0;i<WordNum;i++)
    {
        if(strcmp(x, word[i])==0)
            break;
    }
    if(i>=WordNum)
        return -1;
    else
        return i;
}

int searchdigit(char *x)
{
    int i;
    for(i=0;i<DigNum;i++)
    {
        if(strcmp(x, digit[i])==0)
            break;
    }
    if(i>=DigNum)
        return -1;
    else
        return i;
}

bool searchchar(char x,const char a[])
{
    int l= strlen(a);
    for(int i=0;i<l;i++)
    {
        if(x==a[i])
            return true;
    }
    return false;
}


bool isopt(char x)
{
    for(int i=0;i<MaxOptANum;i++)
    {
        if(x==optA[i])
            return true;
    }
    for(int i=0;i<MaxOptBNum;i++)
    {
        if(searchchar(x, optB[i]))
            return true;
    }
    for(int i=0;i<MaxBoderNum;i++)
    {
        if(x==boder[i])
            return true;
    }
    return false;
}
