//+------------------------------------------------------------------+
//|                                        TakeProfitAndStopLoss.mq4 |
//|                                                      David Yisun |
//|                                              david_yisun@163.com |
//+------------------------------------------------------------------+
#property copyright "David Yisun"
#property link      "david_yisun@163.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
/*
input string SlAndTp="-------------一般止盈止损-------------";//说明一
input double StopLoss=0;//止损
input double TakeProfit=0;//止盈
*/
input string MS="-------------移动止损-------------";//说明
input bool   IsUseMS=false;//是否使用移动止损
input double Pricelimit=50;//盈利多少个点或钱,开始执行移动止损
input double MovingStopLossStep=10;//初始移动止损价差
input bool   IsTrackSeclet=false;//是否有选择的止盈止损
input int    MagicNum=0;//所选的EA编号
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- create timer
   EventSetMillisecondTimer(100);
//--- 输入参数检查
   if(IsUseMS==false)
     {
      Print("关闭移动止损功能");
      ExpertRemove();
     }
   if(Pricelimit<0)
     {
      Print("初始移动止损不能为负值");
      ExpertRemove();
     }
   if(MovingStopLossStep<5)
     {
      Print("初始移动止损设置太近");
      ExpertRemove();
     }

//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//--- destroy timer
   EventKillTimer();

  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---

  }
//+------------------------------------------------------------------+
//| Timer function                                                   |
//+------------------------------------------------------------------+
void OnTimer()
  {
//---
   int order_num=OrdersTotal();
   for(int i=0;i<order_num;i++)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES)==false)
        {
         Print("Select The Order Failed!");
         return;
        }
            //----判断是否是指定的EA  
      if(IsTrackSeclet)
        {
         if(OrderMagicNumber()!=MagicNum)
           {
            continue;
           }
        }
      //----1.计算移动止损条件执行价差线
      double CarryConditionValue= Pricelimit*SymbolInfoDouble(OrderSymbol(),SYMBOL_POINT);
      double StopLossFirstValue = MovingStopLossStep*SymbolInfoDouble(OrderSymbol(),SYMBOL_POINT);


      //1.1----判断订单类型
      switch(OrderType())
        {
         case OP_BUY :
           {
            double p=MarketInfo(OrderSymbol(),MODE_BID);
            double one_line=OrderOpenPrice()+CarryConditionValue;
            double stoploss_line=p-StopLossFirstValue;
            if(p>=one_line)
              {
               if(stoploss_line>OrderStopLoss())
                 {
                  bool res=OrderModify(OrderTicket(),OrderOpenPrice(),stoploss_line,OrderTakeProfit(),0,Blue);
                  if(!res)
                     Print("Error in OrderModify. Error code=",GetLastError());
                  else
                     Print("Order modified successfully.");
                 }
              }
           }
         break;
         case OP_SELL :
           { 
            double p=MarketInfo(OrderSymbol(),MODE_ASK);
            double one_line=OrderOpenPrice()-CarryConditionValue;
            double stoploss_line=p+StopLossFirstValue;
            if(p<=one_line)
              {
               if(stoploss_line<OrderStopLoss()||OrderStopLoss()==0)
                 {
                  bool res=OrderModify(OrderTicket(),OrderOpenPrice(),stoploss_line,OrderTakeProfit(),0,Blue);
                  if(!res)
                     Print("Error in OrderModify. Error code=",GetLastError());
                  else
                     Print("Order modified successfully.");
                 }
              }
           }
         break;
         default:
           {
            continue;
           }
         break;
        }

     }

  }
//+------------------------------------------------------------------+
