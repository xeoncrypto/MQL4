//+------------------------------------------------------------------+
//|                                                        test3.mq4 |
//|                                                      david yisun |
//|                                              david_yisun@163.com |
//+------------------------------------------------------------------+
#property copyright "david yisun"
#property link      "david_yisun@163.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
//---
   int handle1=FileOpen("symbols.csv",FILE_READ|FILE_WRITE|FILE_CSV,",");
   int handle2=FileOpen("recorders.csv",FILE_READ|FILE_WRITE|FILE_CSV,",");
   if(handle1>0 && handle2>0)
     {
      for (int i=0;i<SymbolsTotal(False);i++)
      {
      string s=SymbolName(i,True);
      /*
      string title="input string ",s,"MS=","-------------",s,"-------------;//说明";
      string is="input bool ",s,"_IsUseMS=false;//",s,"_是否使用移动止损";
      string pl="input double ",s,"_Pricelimit=50;//",s,"_移动止损起始点";
      string sl="input double ",s,"_MovingStopLossStep=10;//",s,"_移动止损价差";
      */
      //Alert(s);
      FileWrite(handle1,"input string ",s,"_MS=","'-------------",s,"-------------';//说明");
      FileWrite(handle1,"input bool ",s,"_IsUseMS=false;//",s,"_是否使用移动止损");
      FileWrite(handle1,"input double ",s,"_Pricelimit=50;//",s,"_移动止损起始点");
      FileWrite(handle1,"input double ",s,"_MovingStopLossStep=10;//",s,"_移动止损价差");
      
      FileWrite(handle2,"agrs_info_recorder[",i,"].symbol='",s,"';");
      FileWrite(handle2,"agrs_info_recorder[",i,"]._IsUseMS=",s,"_IsUseMS;");
      FileWrite(handle2,"agrs_info_recorder[",i,"]._Pricelimit=",s,"_Pricelimit;" );
      FileWrite(handle2,"agrs_info_recorder[",i,"]._MovingStopLossStep=",s,"_MovingStopLossStep;"); 
      
      
      }
      FileClose(handle2);
      FileClose(handle1);
      }
     
     
  }
//+------------------------------------------------------------------+
