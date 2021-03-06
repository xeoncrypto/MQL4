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
input double Pricelimit=100;//盈利多少个点或钱,开始执行移动止损
input double MovingStopLossStep=50;//初始移动止损价差
input bool   IsTrackSeclet=false;//是否有选择的止盈止损
input int    MagicNum=0;//所选的EA编号

// --- 各symbol移动止损参数 ---
input string GBPUSD_MS="-------------GBPUSD-------------";//说明
input bool GBPUSD_IsUseMS=false;//GBPUSD_是否使用移动止损
input double GBPUSD_Pricelimit=100;//GBPUSD_移动止损起始点
input double GBPUSD_MovingStopLossStep=30;//GBPUSD_移动止损价差 
input string EURUSD_MS="-------------EURUSD-------------";//说明
input bool EURUSD_IsUseMS=false;//EURUSD_是否使用移动止损
input double EURUSD_Pricelimit=120;//EURUSD_移动止损起始点
input double EURUSD_MovingStopLossStep=40;//EURUSD_移动止损价差
input string USDJPY_MS="-------------USDJPY-------------";//说明
input bool USDJPY_IsUseMS=false;//USDJPY_是否使用移动止损
input double USDJPY_Pricelimit=60;//USDJPY_移动止损起始点
input double USDJPY_MovingStopLossStep=30;//USDJPY_移动止损价差
input string NZDUSD_MS="-------------NZDUSD-------------";//说明
input bool NZDUSD_IsUseMS=false;//NZDUSD_是否使用移动止损
input double NZDUSD_Pricelimit=40;//NZDUSD_移动止损起始点
input double NZDUSD_MovingStopLossStep=20;//NZDUSD_移动止损价差
input string XAUUSD_MS="-------------XAUUSD-------------";//说明
input bool XAUUSD_IsUseMS=false;//XAUUSD_是否使用移动止损
input double XAUUSD_Pricelimit=60;//XAUUSD_移动止损起始点
input double XAUUSD_MovingStopLossStep=30;//XAUUSD_移动止损价差
input string XAGUSD_MS="-------------XAGUSD-------------";//说明
input bool XAGUSD_IsUseMS=false;//XAGUSD_是否使用移动止损
input double XAGUSD_Pricelimit=50;//XAGUSD_移动止损起始点
input double XAGUSD_MovingStopLossStep=25;//XAGUSD_移动止损价差
input string AUDUSD_MS="-------------AUDUSD-------------";//说明
input bool AUDUSD_IsUseMS=false;//AUDUSD_是否使用移动止损
input double AUDUSD_Pricelimit=50;//AUDUSD_移动止损起始点
input double AUDUSD_MovingStopLossStep=20;//AUDUSD_移动止损价差                  
input string USDCHF_MS="-------------USDCHF-------------";//说明
input bool USDCHF_IsUseMS=false;//USDCHF_是否使用移动止损
input double USDCHF_Pricelimit=50;//USDCHF_移动止损起始点
input double USDCHF_MovingStopLossStep=25;//USDCHF_移动止损价差
input string USDCAD_MS="-------------USDCAD-------------";//说明
input bool USDCAD_IsUseMS=false;//USDCAD_是否使用移动止损
input double USDCAD_Pricelimit=100;//USDCAD_移动止损起始点
input double USDCAD_MovingStopLossStep=30;//USDCAD_移动止损价差
input string EURGBP_MS="-------------EURGBP-------------";//说明
input bool EURGBP_IsUseMS=false;//EURGBP_是否使用移动止损
input double EURGBP_Pricelimit=50;//EURGBP_移动止损起始点
input double EURGBP_MovingStopLossStep=25;//EURGBP_移动止损价差
input string EURAUD_MS="-------------EURAUD-------------";//说明
input bool EURAUD_IsUseMS=false;//EURAUD_是否使用移动止损
input double EURAUD_Pricelimit=100;//EURAUD_移动止损起始点
input double EURAUD_MovingStopLossStep=30;//EURAUD_移动止损价差
input string EURCHF_MS="-------------EURCHF-------------";//说明
input bool EURCHF_IsUseMS=false;//EURCHF_是否使用移动止损
input double EURCHF_Pricelimit=100;//EURCHF_移动止损起始点
input double EURCHF_MovingStopLossStep=30;//EURCHF_移动止损价差
input string EURJPY_MS="-------------EURJPY-------------";//说明
input bool EURJPY_IsUseMS=false;//EURJPY_是否使用移动止损
input double EURJPY_Pricelimit=200;//EURJPY_移动止损起始点
input double EURJPY_MovingStopLossStep=60;//EURJPY_移动止损价差
input string GBPCHF_MS="-------------GBPCHF-------------";//说明
input bool GBPCHF_IsUseMS=false;//GBPCHF_是否使用移动止损
input double GBPCHF_Pricelimit=100;//GBPCHF_移动止损起始点
input double GBPCHF_MovingStopLossStep=30;//GBPCHF_移动止损价差
input string CADJPY_MS="-------------CADJPY-------------";//说明
input bool CADJPY_IsUseMS=false;//CADJPY_是否使用移动止损
input double CADJPY_Pricelimit=100;//CADJPY_移动止损起始点
input double CADJPY_MovingStopLossStep=30;//CADJPY_移动止损价差
input string GBPJPY_MS="-------------GBPJPY-------------";//说明
input bool GBPJPY_IsUseMS=false;//GBPJPY_是否使用移动止损
input double GBPJPY_Pricelimit=200;//GBPJPY_移动止损起始点
input double GBPJPY_MovingStopLossStep=60;//GBPJPY_移动止损价差
input string AUDNZD_MS="-------------AUDNZD-------------";//说明
input bool AUDNZD_IsUseMS=false;//AUDNZD_是否使用移动止损
input double AUDNZD_Pricelimit=100;//AUDNZD_移动止损起始点
input double AUDNZD_MovingStopLossStep=30;//AUDNZD_移动止损价差
input string AUDCAD_MS="-------------AUDCAD-------------";//说明
input bool AUDCAD_IsUseMS=false;//AUDCAD_是否使用移动止损
input double AUDCAD_Pricelimit=100;//AUDCAD_移动止损起始点
input double AUDCAD_MovingStopLossStep=30;//AUDCAD_移动止损价差
input string AUDCHF_MS="-------------AUDCHF-------------";//说明
input bool AUDCHF_IsUseMS=false;//AUDCHF_是否使用移动止损
input double AUDCHF_Pricelimit=100;//AUDCHF_移动止损起始点
input double AUDCHF_MovingStopLossStep=30;//AUDCHF_移动止损价差
input string AUDJPY_MS="-------------AUDJPY-------------";//说明
input bool AUDJPY_IsUseMS=false;//AUDJPY_是否使用移动止损
input double AUDJPY_Pricelimit=100;//AUDJPY_移动止损起始点
input double AUDJPY_MovingStopLossStep=30;//AUDJPY_移动止损价差
input string CHFJPY_MS="-------------CHFJPY-------------";//说明
input bool CHFJPY_IsUseMS=false;//CHFJPY_是否使用移动止损
input double CHFJPY_Pricelimit=100;//CHFJPY_移动止损起始点
input double CHFJPY_MovingStopLossStep=30;//CHFJPY_移动止损价差
input string EURNZD_MS="-------------EURNZD-------------";//说明
input bool EURNZD_IsUseMS=false;//EURNZD_是否使用移动止损
input double EURNZD_Pricelimit=100;//EURNZD_移动止损起始点
input double EURNZD_MovingStopLossStep=30;//EURNZD_移动止损价差
input string EURCAD_MS="-------------EURCAD-------------";//说明
input bool EURCAD_IsUseMS=false;//EURCAD_是否使用移动止损
input double EURCAD_Pricelimit=100;//EURCAD_移动止损起始点
input double EURCAD_MovingStopLossStep=30;//EURCAD_移动止损价差
input string CADCHF_MS="-------------CADCHF-------------";//说明
input bool CADCHF_IsUseMS=false;//CADCHF_是否使用移动止损
input double CADCHF_Pricelimit=100;//CADCHF_移动止损起始点
input double CADCHF_MovingStopLossStep=30;//CADCHF_移动止损价差
input string NZDJPY_MS="-------------NZDJPY-------------";//说明
input bool NZDJPY_IsUseMS=false;//NZDJPY_是否使用移动止损
input double NZDJPY_Pricelimit=100;//NZDJPY_移动止损起始点
input double NZDJPY_MovingStopLossStep=30;//NZDJPY_移动止损价差
input string AUDSGD_MS="-------------AUDSGD-------------";//说明
input bool AUDSGD_IsUseMS=false;//AUDSGD_是否使用移动止损
input double AUDSGD_Pricelimit=100;//AUDSGD_移动止损起始点
input double AUDSGD_MovingStopLossStep=30;//AUDSGD_移动止损价差
input string CADSGD_MS="-------------CADSGD-------------";//说明
input bool CADSGD_IsUseMS=false;//CADSGD_是否使用移动止损
input double CADSGD_Pricelimit=100;//CADSGD_移动止损起始点
input double CADSGD_MovingStopLossStep=30;//CADSGD_移动止损价差
input string CHFSGD_MS="-------------CHFSGD-------------";//说明
input bool CHFSGD_IsUseMS=false;//CHFSGD_是否使用移动止损
input double CHFSGD_Pricelimit=100;//CHFSGD_移动止损起始点
input double CHFSGD_MovingStopLossStep=30;//CHFSGD_移动止损价差
input string EURDKK_MS="-------------EURDKK-------------";//说明
input bool EURDKK_IsUseMS=false;//EURDKK_是否使用移动止损
input double EURDKK_Pricelimit=100;//EURDKK_移动止损起始点
input double EURDKK_MovingStopLossStep=30;//EURDKK_移动止损价差
input string EURHKD_MS="-------------EURHKD-------------";//说明
input bool EURHKD_IsUseMS=false;//EURHKD_是否使用移动止损
input double EURHKD_Pricelimit=100;//EURHKD_移动止损起始点
input double EURHKD_MovingStopLossStep=30;//EURHKD_移动止损价差
input string EURHUF_MS="-------------EURHUF-------------";//说明
input bool EURHUF_IsUseMS=false;//EURHUF_是否使用移动止损
input double EURHUF_Pricelimit=100;//EURHUF_移动止损起始点
input double EURHUF_MovingStopLossStep=30;//EURHUF_移动止损价差
input string EURCZK_MS="-------------EURCZK-------------";//说明
input bool EURCZK_IsUseMS=false;//EURCZK_是否使用移动止损
input double EURCZK_Pricelimit=100;//EURCZK_移动止损起始点
input double EURCZK_MovingStopLossStep=30;//EURCZK_移动止损价差
input string EURMXN_MS="-------------EURMXN-------------";//说明
input bool EURMXN_IsUseMS=false;//EURMXN_是否使用移动止损
input double EURMXN_Pricelimit=100;//EURMXN_移动止损起始点
input double EURMXN_MovingStopLossStep=30;//EURMXN_移动止损价差
input string EURNOK_MS="-------------EURNOK-------------";//说明
input bool EURNOK_IsUseMS=false;//EURNOK_是否使用移动止损
input double EURNOK_Pricelimit=100;//EURNOK_移动止损起始点
input double EURNOK_MovingStopLossStep=30;//EURNOK_移动止损价差
input string EURPLN_MS="-------------EURPLN-------------";//说明
input bool EURPLN_IsUseMS=false;//EURPLN_是否使用移动止损
input double EURPLN_Pricelimit=100;//EURPLN_移动止损起始点
input double EURPLN_MovingStopLossStep=30;//EURPLN_移动止损价差
input string EURSEK_MS="-------------EURSEK-------------";//说明
input bool EURSEK_IsUseMS=false;//EURSEK_是否使用移动止损
input double EURSEK_Pricelimit=100;//EURSEK_移动止损起始点
input double EURSEK_MovingStopLossStep=30;//EURSEK_移动止损价差
input string EURSGD_MS="-------------EURSGD-------------";//说明
input bool EURSGD_IsUseMS=false;//EURSGD_是否使用移动止损
input double EURSGD_Pricelimit=100;//EURSGD_移动止损起始点
input double EURSGD_MovingStopLossStep=30;//EURSGD_移动止损价差
input string EURTRY_MS="-------------EURTRY-------------";//说明
input bool EURTRY_IsUseMS=false;//EURTRY_是否使用移动止损
input double EURTRY_Pricelimit=100;//EURTRY_移动止损起始点
input double EURTRY_MovingStopLossStep=30;//EURTRY_移动止损价差
input string GBPAUD_MS="-------------GBPAUD-------------";//说明
input bool GBPAUD_IsUseMS=false;//GBPAUD_是否使用移动止损
input double GBPAUD_Pricelimit=100;//GBPAUD_移动止损起始点
input double GBPAUD_MovingStopLossStep=30;//GBPAUD_移动止损价差
input string GBPCAD_MS="-------------GBPCAD-------------";//说明
input bool GBPCAD_IsUseMS=false;//GBPCAD_是否使用移动止损
input double GBPCAD_Pricelimit=100;//GBPCAD_移动止损起始点
input double GBPCAD_MovingStopLossStep=30;//GBPCAD_移动止损价差
input string GBPNOK_MS="-------------GBPNOK-------------";//说明
input bool GBPNOK_IsUseMS=false;//GBPNOK_是否使用移动止损
input double GBPNOK_Pricelimit=100;//GBPNOK_移动止损起始点
input double GBPNOK_MovingStopLossStep=30;//GBPNOK_移动止损价差
input string GBPNZD_MS="-------------GBPNZD-------------";//说明
input bool GBPNZD_IsUseMS=false;//GBPNZD_是否使用移动止损
input double GBPNZD_Pricelimit=100;//GBPNZD_移动止损起始点
input double GBPNZD_MovingStopLossStep=30;//GBPNZD_移动止损价差
input string GBPPLN_MS="-------------GBPPLN-------------";//说明
input bool GBPPLN_IsUseMS=false;//GBPPLN_是否使用移动止损
input double GBPPLN_Pricelimit=100;//GBPPLN_移动止损起始点
input double GBPPLN_MovingStopLossStep=30;//GBPPLN_移动止损价差
input string GBPSEK_MS="-------------GBPSEK-------------";//说明
input bool GBPSEK_IsUseMS=false;//GBPSEK_是否使用移动止损
input double GBPSEK_Pricelimit=100;//GBPSEK_移动止损起始点
input double GBPSEK_MovingStopLossStep=30;//GBPSEK_移动止损价差
input string GBPSGD_MS="-------------GBPSGD-------------";//说明
input bool GBPSGD_IsUseMS=false;//GBPSGD_是否使用移动止损
input double GBPSGD_Pricelimit=100;//GBPSGD_移动止损起始点
input double GBPSGD_MovingStopLossStep=30;//GBPSGD_移动止损价差
input string NOKSEK_MS="-------------NOKSEK-------------";//说明
input bool NOKSEK_IsUseMS=false;//NOKSEK_是否使用移动止损
input double NOKSEK_Pricelimit=100;//NOKSEK_移动止损起始点
input double NOKSEK_MovingStopLossStep=30;//NOKSEK_移动止损价差
input string NZDCAD_MS="-------------NZDCAD-------------";//说明
input bool NZDCAD_IsUseMS=false;//NZDCAD_是否使用移动止损
input double NZDCAD_Pricelimit=100;//NZDCAD_移动止损起始点
input double NZDCAD_MovingStopLossStep=30;//NZDCAD_移动止损价差
input string NZDCHF_MS="-------------NZDCHF-------------";//说明
input bool NZDCHF_IsUseMS=false;//NZDCHF_是否使用移动止损
input double NZDCHF_Pricelimit=100;//NZDCHF_移动止损起始点
input double NZDCHF_MovingStopLossStep=30;//NZDCHF_移动止损价差
input string NZDSGD_MS="-------------NZDSGD-------------";//说明
input bool NZDSGD_IsUseMS=false;//NZDSGD_是否使用移动止损
input double NZDSGD_Pricelimit=100;//NZDSGD_移动止损起始点
input double NZDSGD_MovingStopLossStep=30;//NZDSGD_移动止损价差
input string USDCNH_MS="-------------USDCNH-------------";//说明
input bool USDCNH_IsUseMS=false;//USDCNH_是否使用移动止损
input double USDCNH_Pricelimit=100;//USDCNH_移动止损起始点
input double USDCNH_MovingStopLossStep=30;//USDCNH_移动止损价差
input string USDCZK_MS="-------------USDCZK-------------";//说明
input bool USDCZK_IsUseMS=false;//USDCZK_是否使用移动止损
input double USDCZK_Pricelimit=100;//USDCZK_移动止损起始点
input double USDCZK_MovingStopLossStep=30;//USDCZK_移动止损价差
input string USDDKK_MS="-------------USDDKK-------------";//说明
input bool USDDKK_IsUseMS=false;//USDDKK_是否使用移动止损
input double USDDKK_Pricelimit=100;//USDDKK_移动止损起始点
input double USDDKK_MovingStopLossStep=30;//USDDKK_移动止损价差
input string USDHKD_MS="-------------USDHKD-------------";//说明
input bool USDHKD_IsUseMS=false;//USDHKD_是否使用移动止损
input double USDHKD_Pricelimit=100;//USDHKD_移动止损起始点
input double USDHKD_MovingStopLossStep=30;//USDHKD_移动止损价差
input string USDHUF_MS="-------------USDHUF-------------";//说明
input bool USDHUF_IsUseMS=false;//USDHUF_是否使用移动止损
input double USDHUF_Pricelimit=100;//USDHUF_移动止损起始点
input double USDHUF_MovingStopLossStep=30;//USDHUF_移动止损价差
input string USDMXN_MS="-------------USDMXN-------------";//说明
input bool USDMXN_IsUseMS=false;//USDMXN_是否使用移动止损
input double USDMXN_Pricelimit=100;//USDMXN_移动止损起始点
input double USDMXN_MovingStopLossStep=30;//USDMXN_移动止损价差
input string USDNOK_MS="-------------USDNOK-------------";//说明
input bool USDNOK_IsUseMS=false;//USDNOK_是否使用移动止损
input double USDNOK_Pricelimit=100;//USDNOK_移动止损起始点
input double USDNOK_MovingStopLossStep=30;//USDNOK_移动止损价差
input string USDPLN_MS="-------------USDPLN-------------";//说明
input bool USDPLN_IsUseMS=false;//USDPLN_是否使用移动止损
input double USDPLN_Pricelimit=100;//USDPLN_移动止损起始点
input double USDPLN_MovingStopLossStep=30;//USDPLN_移动止损价差
input string USDSEK_MS="-------------USDSEK-------------";//说明
input bool USDSEK_IsUseMS=false;//USDSEK_是否使用移动止损
input double USDSEK_Pricelimit=100;//USDSEK_移动止损起始点
input double USDSEK_MovingStopLossStep=30;//USDSEK_移动止损价差
input string USDSGD_MS="-------------USDSGD-------------";//说明
input bool USDSGD_IsUseMS=false;//USDSGD_是否使用移动止损
input double USDSGD_Pricelimit=100;//USDSGD_移动止损起始点
input double USDSGD_MovingStopLossStep=30;//USDSGD_移动止损价差
input string USDTRY_MS="-------------USDTRY-------------";//说明
input bool USDTRY_IsUseMS=false;//USDTRY_是否使用移动止损
input double USDTRY_Pricelimit=100;//USDTRY_移动止损起始点
input double USDTRY_MovingStopLossStep=30;//USDTRY_移动止损价差
input string USDZAR_MS="-------------USDZAR-------------";//说明
input bool USDZAR_IsUseMS=false;//USDZAR_是否使用移动止损
input double USDZAR_Pricelimit=100;//USDZAR_移动止损起始点
input double USDZAR_MovingStopLossStep=30;//USDZAR_移动止损价差
input string AUS200_MS="-------------AUS200-------------";//说明
input bool AUS200_IsUseMS=false;//AUS200_是否使用移动止损
input double AUS200_Pricelimit=100;//AUS200_移动止损起始点
input double AUS200_MovingStopLossStep=30;//AUS200_移动止损价差
input string ES35_MS="-------------ES35-------------";//说明
input bool ES35_IsUseMS=false;//ES35_是否使用移动止损
input double ES35_Pricelimit=100;//ES35_移动止损起始点
input double ES35_MovingStopLossStep=30;//ES35_移动止损价差
input string FCHI_MS="-------------FCHI-------------";//说明
input bool FCHI_IsUseMS=false;//FCHI_是否使用移动止损
input double FCHI_Pricelimit=100;//FCHI_移动止损起始点
input double FCHI_MovingStopLossStep=30;//FCHI_移动止损价差
input string GDAXI_MS="-------------GDAXI-------------";//说明
input bool GDAXI_IsUseMS=false;//GDAXI_是否使用移动止损
input double GDAXI_Pricelimit=100;//GDAXI_移动止损起始点
input double GDAXI_MovingStopLossStep=30;//GDAXI_移动止损价差
input string HK50_MS="-------------HK50-------------";//说明
input bool HK50_IsUseMS=false;//HK50_是否使用移动止损
input double HK50_Pricelimit=100;//HK50_移动止损起始点
input double HK50_MovingStopLossStep=30;//HK50_移动止损价差
input string J225_MS="-------------J225-------------";//说明
input bool J225_IsUseMS=false;//J225_是否使用移动止损
input double J225_Pricelimit=100;//J225_移动止损起始点
input double J225_MovingStopLossStep=30;//J225_移动止损价差
input string NDX_MS="-------------NDX-------------";//说明
input bool NDX_IsUseMS=false;//NDX_是否使用移动止损
input double NDX_Pricelimit=100;//NDX_移动止损起始点
input double NDX_MovingStopLossStep=30;//NDX_移动止损价差
input string SPX_MS="-------------SPX-------------";//说明
input bool SPX_IsUseMS=false;//SPX_是否使用移动止损
input double SPX_Pricelimit=100;//SPX_移动止损起始点
input double SPX_MovingStopLossStep=30;//SPX_移动止损价差
input string STOXX50E_MS="-------------STOXX50E-------------";//说明
input bool STOXX50E_IsUseMS=false;//STOXX50E_是否使用移动止损
input double STOXX50E_Pricelimit=100;//STOXX50E_移动止损起始点
input double STOXX50E_MovingStopLossStep=30;//STOXX50E_移动止损价差
input string UK100_MS="-------------UK100-------------";//说明
input bool UK100_IsUseMS=false;//UK100_是否使用移动止损
input double UK100_Pricelimit=100;//UK100_移动止损起始点
input double UK100_MovingStopLossStep=30;//UK100_移动止损价差
input string USDX_MS="-------------USDX-------------";//说明
input bool USDX_IsUseMS=false;//USDX_是否使用移动止损
input double USDX_Pricelimit=100;//USDX_移动止损起始点
input double USDX_MovingStopLossStep=30;//USDX_移动止损价差
input string WS30_MS="-------------WS30-------------";//说明
input bool WS30_IsUseMS=false;//WS30_是否使用移动止损
input double WS30_Pricelimit=100;//WS30_移动止损起始点
input double WS30_MovingStopLossStep=30;//WS30_移动止损价差
input string China50_MS="-------------China50-------------";//说明
input bool China50_IsUseMS=false;//China50_是否使用移动止损
input double China50_Pricelimit=100;//China50_移动止损起始点
input double China50_MovingStopLossStep=30;//China50_移动止损价差
input string CN300_MS="-------------CN300-------------";//说明
input bool CN300_IsUseMS=false;//CN300_是否使用移动止损
input double CN300_Pricelimit=100;//CN300_移动止损起始点
input double CN300_MovingStopLossStep=30;//CN300_移动止损价差
input string XBRUSD_MS="-------------XBRUSD-------------";//说明
input bool XBRUSD_IsUseMS=false;//XBRUSD_是否使用移动止损
input double XBRUSD_Pricelimit=100;//XBRUSD_移动止损起始点
input double XBRUSD_MovingStopLossStep=30;//XBRUSD_移动止损价差
input string XTIUSD_MS="-------------XTIUSD-------------";//说明
input bool XTIUSD_IsUseMS=false;//XTIUSD_是否使用移动止损
input double XTIUSD_Pricelimit=100;//XTIUSD_移动止损起始点
input double XTIUSD_MovingStopLossStep=30;//XTIUSD_移动止损价差
input string NGAS_MS="-------------NGAS-------------";//说明
input bool NGAS_IsUseMS=false;//NGAS_是否使用移动止损
input double NGAS_Pricelimit=100;//NGAS_移动止损起始点
input double NGAS_MovingStopLossStep=30;//NGAS_移动止损价差
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
                                        // --------------------- 参数信息记录结构体 ---------------------
struct recorder
  {
   string            symbol;
   bool              _IsUseMS;
   double            _Pricelimit;
   double            _MovingStopLossStep;
  };
recorder    args_info_recorder[];

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
// --- 记录symbol移动止损参数 ---
   ArrayResize(args_info_recorder,78);

   args_info_recorder[0].symbol="USDCHF";
   args_info_recorder[0]._IsUseMS=USDCHF_IsUseMS;
   args_info_recorder[0]._Pricelimit=USDCHF_Pricelimit;
   args_info_recorder[0]._MovingStopLossStep=USDCHF_MovingStopLossStep;
   args_info_recorder[1].symbol="GBPUSD";
   args_info_recorder[1]._IsUseMS=GBPUSD_IsUseMS;
   args_info_recorder[1]._Pricelimit=GBPUSD_Pricelimit;
   args_info_recorder[1]._MovingStopLossStep=GBPUSD_MovingStopLossStep;
   args_info_recorder[2].symbol="EURUSD";
   args_info_recorder[2]._IsUseMS=EURUSD_IsUseMS;
   args_info_recorder[2]._Pricelimit=EURUSD_Pricelimit;
   args_info_recorder[2]._MovingStopLossStep=EURUSD_MovingStopLossStep;
   args_info_recorder[3].symbol="USDJPY";
   args_info_recorder[3]._IsUseMS=USDJPY_IsUseMS;
   args_info_recorder[3]._Pricelimit=USDJPY_Pricelimit;
   args_info_recorder[3]._MovingStopLossStep=USDJPY_MovingStopLossStep;
   args_info_recorder[4].symbol="USDCAD";
   args_info_recorder[4]._IsUseMS=USDCAD_IsUseMS;
   args_info_recorder[4]._Pricelimit=USDCAD_Pricelimit;
   args_info_recorder[4]._MovingStopLossStep=USDCAD_MovingStopLossStep;
   args_info_recorder[5].symbol="AUDUSD";
   args_info_recorder[5]._IsUseMS=AUDUSD_IsUseMS;
   args_info_recorder[5]._Pricelimit=AUDUSD_Pricelimit;
   args_info_recorder[5]._MovingStopLossStep=AUDUSD_MovingStopLossStep;
   args_info_recorder[6].symbol="EURGBP";
   args_info_recorder[6]._IsUseMS=EURGBP_IsUseMS;
   args_info_recorder[6]._Pricelimit=EURGBP_Pricelimit;
   args_info_recorder[6]._MovingStopLossStep=EURGBP_MovingStopLossStep;
   args_info_recorder[7].symbol="EURAUD";
   args_info_recorder[7]._IsUseMS=EURAUD_IsUseMS;
   args_info_recorder[7]._Pricelimit=EURAUD_Pricelimit;
   args_info_recorder[7]._MovingStopLossStep=EURAUD_MovingStopLossStep;
   args_info_recorder[8].symbol="EURCHF";
   args_info_recorder[8]._IsUseMS=EURCHF_IsUseMS;
   args_info_recorder[8]._Pricelimit=EURCHF_Pricelimit;
   args_info_recorder[8]._MovingStopLossStep=EURCHF_MovingStopLossStep;
   args_info_recorder[9].symbol="EURJPY";
   args_info_recorder[9]._IsUseMS=EURJPY_IsUseMS;
   args_info_recorder[9]._Pricelimit=EURJPY_Pricelimit;
   args_info_recorder[9]._MovingStopLossStep=EURJPY_MovingStopLossStep;
   args_info_recorder[10].symbol="GBPCHF";
   args_info_recorder[10]._IsUseMS=GBPCHF_IsUseMS;
   args_info_recorder[10]._Pricelimit=GBPCHF_Pricelimit;
   args_info_recorder[10]._MovingStopLossStep=GBPCHF_MovingStopLossStep;
   args_info_recorder[11].symbol="CADJPY";
   args_info_recorder[11]._IsUseMS=CADJPY_IsUseMS;
   args_info_recorder[11]._Pricelimit=CADJPY_Pricelimit;
   args_info_recorder[11]._MovingStopLossStep=CADJPY_MovingStopLossStep;
   args_info_recorder[12].symbol="GBPJPY";
   args_info_recorder[12]._IsUseMS=GBPJPY_IsUseMS;
   args_info_recorder[12]._Pricelimit=GBPJPY_Pricelimit;
   args_info_recorder[12]._MovingStopLossStep=GBPJPY_MovingStopLossStep;
   args_info_recorder[13].symbol="AUDNZD";
   args_info_recorder[13]._IsUseMS=AUDNZD_IsUseMS;
   args_info_recorder[13]._Pricelimit=AUDNZD_Pricelimit;
   args_info_recorder[13]._MovingStopLossStep=AUDNZD_MovingStopLossStep;
   args_info_recorder[14].symbol="AUDCAD";
   args_info_recorder[14]._IsUseMS=AUDCAD_IsUseMS;
   args_info_recorder[14]._Pricelimit=AUDCAD_Pricelimit;
   args_info_recorder[14]._MovingStopLossStep=AUDCAD_MovingStopLossStep;
   args_info_recorder[15].symbol="AUDCHF";
   args_info_recorder[15]._IsUseMS=AUDCHF_IsUseMS;
   args_info_recorder[15]._Pricelimit=AUDCHF_Pricelimit;
   args_info_recorder[15]._MovingStopLossStep=AUDCHF_MovingStopLossStep;
   args_info_recorder[16].symbol="AUDJPY";
   args_info_recorder[16]._IsUseMS=AUDJPY_IsUseMS;
   args_info_recorder[16]._Pricelimit=AUDJPY_Pricelimit;
   args_info_recorder[16]._MovingStopLossStep=AUDJPY_MovingStopLossStep;
   args_info_recorder[17].symbol="CHFJPY";
   args_info_recorder[17]._IsUseMS=CHFJPY_IsUseMS;
   args_info_recorder[17]._Pricelimit=CHFJPY_Pricelimit;
   args_info_recorder[17]._MovingStopLossStep=CHFJPY_MovingStopLossStep;
   args_info_recorder[18].symbol="EURNZD";
   args_info_recorder[18]._IsUseMS=EURNZD_IsUseMS;
   args_info_recorder[18]._Pricelimit=EURNZD_Pricelimit;
   args_info_recorder[18]._MovingStopLossStep=EURNZD_MovingStopLossStep;
   args_info_recorder[19].symbol="EURCAD";
   args_info_recorder[19]._IsUseMS=EURCAD_IsUseMS;
   args_info_recorder[19]._Pricelimit=EURCAD_Pricelimit;
   args_info_recorder[19]._MovingStopLossStep=EURCAD_MovingStopLossStep;
   args_info_recorder[20].symbol="CADCHF";
   args_info_recorder[20]._IsUseMS=CADCHF_IsUseMS;
   args_info_recorder[20]._Pricelimit=CADCHF_Pricelimit;
   args_info_recorder[20]._MovingStopLossStep=CADCHF_MovingStopLossStep;
   args_info_recorder[21].symbol="NZDJPY";
   args_info_recorder[21]._IsUseMS=NZDJPY_IsUseMS;
   args_info_recorder[21]._Pricelimit=NZDJPY_Pricelimit;
   args_info_recorder[21]._MovingStopLossStep=NZDJPY_MovingStopLossStep;
   args_info_recorder[22].symbol="NZDUSD";
   args_info_recorder[22]._IsUseMS=NZDUSD_IsUseMS;
   args_info_recorder[22]._Pricelimit=NZDUSD_Pricelimit;
   args_info_recorder[22]._MovingStopLossStep=NZDUSD_MovingStopLossStep;
   args_info_recorder[23].symbol="XAUUSD";
   args_info_recorder[23]._IsUseMS=XAUUSD_IsUseMS;
   args_info_recorder[23]._Pricelimit=XAUUSD_Pricelimit;
   args_info_recorder[23]._MovingStopLossStep=XAUUSD_MovingStopLossStep;
   args_info_recorder[24].symbol="AUDSGD";
   args_info_recorder[24]._IsUseMS=AUDSGD_IsUseMS;
   args_info_recorder[24]._Pricelimit=AUDSGD_Pricelimit;
   args_info_recorder[24]._MovingStopLossStep=AUDSGD_MovingStopLossStep;
   args_info_recorder[25].symbol="CADSGD";
   args_info_recorder[25]._IsUseMS=CADSGD_IsUseMS;
   args_info_recorder[25]._Pricelimit=CADSGD_Pricelimit;
   args_info_recorder[25]._MovingStopLossStep=CADSGD_MovingStopLossStep;
   args_info_recorder[26].symbol="CHFSGD";
   args_info_recorder[26]._IsUseMS=CHFSGD_IsUseMS;
   args_info_recorder[26]._Pricelimit=CHFSGD_Pricelimit;
   args_info_recorder[26]._MovingStopLossStep=CHFSGD_MovingStopLossStep;
   args_info_recorder[27].symbol="EURDKK";
   args_info_recorder[27]._IsUseMS=EURDKK_IsUseMS;
   args_info_recorder[27]._Pricelimit=EURDKK_Pricelimit;
   args_info_recorder[27]._MovingStopLossStep=EURDKK_MovingStopLossStep;
   args_info_recorder[28].symbol="EURHKD";
   args_info_recorder[28]._IsUseMS=EURHKD_IsUseMS;
   args_info_recorder[28]._Pricelimit=EURHKD_Pricelimit;
   args_info_recorder[28]._MovingStopLossStep=EURHKD_MovingStopLossStep;
   args_info_recorder[29].symbol="EURHUF";
   args_info_recorder[29]._IsUseMS=EURHUF_IsUseMS;
   args_info_recorder[29]._Pricelimit=EURHUF_Pricelimit;
   args_info_recorder[29]._MovingStopLossStep=EURHUF_MovingStopLossStep;
   args_info_recorder[30].symbol="EURCZK";
   args_info_recorder[30]._IsUseMS=EURCZK_IsUseMS;
   args_info_recorder[30]._Pricelimit=EURCZK_Pricelimit;
   args_info_recorder[30]._MovingStopLossStep=EURCZK_MovingStopLossStep;
   args_info_recorder[31].symbol="EURMXN";
   args_info_recorder[31]._IsUseMS=EURMXN_IsUseMS;
   args_info_recorder[31]._Pricelimit=EURMXN_Pricelimit;
   args_info_recorder[31]._MovingStopLossStep=EURMXN_MovingStopLossStep;
   args_info_recorder[32].symbol="EURNOK";
   args_info_recorder[32]._IsUseMS=EURNOK_IsUseMS;
   args_info_recorder[32]._Pricelimit=EURNOK_Pricelimit;
   args_info_recorder[32]._MovingStopLossStep=EURNOK_MovingStopLossStep;
   args_info_recorder[33].symbol="EURPLN";
   args_info_recorder[33]._IsUseMS=EURPLN_IsUseMS;
   args_info_recorder[33]._Pricelimit=EURPLN_Pricelimit;
   args_info_recorder[33]._MovingStopLossStep=EURPLN_MovingStopLossStep;
   args_info_recorder[34].symbol="EURSEK";
   args_info_recorder[34]._IsUseMS=EURSEK_IsUseMS;
   args_info_recorder[34]._Pricelimit=EURSEK_Pricelimit;
   args_info_recorder[34]._MovingStopLossStep=EURSEK_MovingStopLossStep;
   args_info_recorder[35].symbol="EURSGD";
   args_info_recorder[35]._IsUseMS=EURSGD_IsUseMS;
   args_info_recorder[35]._Pricelimit=EURSGD_Pricelimit;
   args_info_recorder[35]._MovingStopLossStep=EURSGD_MovingStopLossStep;
   args_info_recorder[36].symbol="EURTRY";
   args_info_recorder[36]._IsUseMS=EURTRY_IsUseMS;
   args_info_recorder[36]._Pricelimit=EURTRY_Pricelimit;
   args_info_recorder[36]._MovingStopLossStep=EURTRY_MovingStopLossStep;
   args_info_recorder[37].symbol="GBPAUD";
   args_info_recorder[37]._IsUseMS=GBPAUD_IsUseMS;
   args_info_recorder[37]._Pricelimit=GBPAUD_Pricelimit;
   args_info_recorder[37]._MovingStopLossStep=GBPAUD_MovingStopLossStep;
   args_info_recorder[38].symbol="GBPCAD";
   args_info_recorder[38]._IsUseMS=GBPCAD_IsUseMS;
   args_info_recorder[38]._Pricelimit=GBPCAD_Pricelimit;
   args_info_recorder[38]._MovingStopLossStep=GBPCAD_MovingStopLossStep;
   args_info_recorder[39].symbol="GBPNOK";
   args_info_recorder[39]._IsUseMS=GBPNOK_IsUseMS;
   args_info_recorder[39]._Pricelimit=GBPNOK_Pricelimit;
   args_info_recorder[39]._MovingStopLossStep=GBPNOK_MovingStopLossStep;
   args_info_recorder[40].symbol="GBPNZD";
   args_info_recorder[40]._IsUseMS=GBPNZD_IsUseMS;
   args_info_recorder[40]._Pricelimit=GBPNZD_Pricelimit;
   args_info_recorder[40]._MovingStopLossStep=GBPNZD_MovingStopLossStep;
   args_info_recorder[41].symbol="GBPPLN";
   args_info_recorder[41]._IsUseMS=GBPPLN_IsUseMS;
   args_info_recorder[41]._Pricelimit=GBPPLN_Pricelimit;
   args_info_recorder[41]._MovingStopLossStep=GBPPLN_MovingStopLossStep;
   args_info_recorder[42].symbol="GBPSEK";
   args_info_recorder[42]._IsUseMS=GBPSEK_IsUseMS;
   args_info_recorder[42]._Pricelimit=GBPSEK_Pricelimit;
   args_info_recorder[42]._MovingStopLossStep=GBPSEK_MovingStopLossStep;
   args_info_recorder[43].symbol="GBPSGD";
   args_info_recorder[43]._IsUseMS=GBPSGD_IsUseMS;
   args_info_recorder[43]._Pricelimit=GBPSGD_Pricelimit;
   args_info_recorder[43]._MovingStopLossStep=GBPSGD_MovingStopLossStep;
   args_info_recorder[44].symbol="NOKSEK";
   args_info_recorder[44]._IsUseMS=NOKSEK_IsUseMS;
   args_info_recorder[44]._Pricelimit=NOKSEK_Pricelimit;
   args_info_recorder[44]._MovingStopLossStep=NOKSEK_MovingStopLossStep;
   args_info_recorder[45].symbol="NZDCAD";
   args_info_recorder[45]._IsUseMS=NZDCAD_IsUseMS;
   args_info_recorder[45]._Pricelimit=NZDCAD_Pricelimit;
   args_info_recorder[45]._MovingStopLossStep=NZDCAD_MovingStopLossStep;
   args_info_recorder[46].symbol="NZDCHF";
   args_info_recorder[46]._IsUseMS=NZDCHF_IsUseMS;
   args_info_recorder[46]._Pricelimit=NZDCHF_Pricelimit;
   args_info_recorder[46]._MovingStopLossStep=NZDCHF_MovingStopLossStep;
   args_info_recorder[47].symbol="NZDSGD";
   args_info_recorder[47]._IsUseMS=NZDSGD_IsUseMS;
   args_info_recorder[47]._Pricelimit=NZDSGD_Pricelimit;
   args_info_recorder[47]._MovingStopLossStep=NZDSGD_MovingStopLossStep;
   args_info_recorder[48].symbol="USDCNH";
   args_info_recorder[48]._IsUseMS=USDCNH_IsUseMS;
   args_info_recorder[48]._Pricelimit=USDCNH_Pricelimit;
   args_info_recorder[48]._MovingStopLossStep=USDCNH_MovingStopLossStep;
   args_info_recorder[49].symbol="USDCZK";
   args_info_recorder[49]._IsUseMS=USDCZK_IsUseMS;
   args_info_recorder[49]._Pricelimit=USDCZK_Pricelimit;
   args_info_recorder[49]._MovingStopLossStep=USDCZK_MovingStopLossStep;
   args_info_recorder[50].symbol="USDDKK";
   args_info_recorder[50]._IsUseMS=USDDKK_IsUseMS;
   args_info_recorder[50]._Pricelimit=USDDKK_Pricelimit;
   args_info_recorder[50]._MovingStopLossStep=USDDKK_MovingStopLossStep;
   args_info_recorder[51].symbol="USDHKD";
   args_info_recorder[51]._IsUseMS=USDHKD_IsUseMS;
   args_info_recorder[51]._Pricelimit=USDHKD_Pricelimit;
   args_info_recorder[51]._MovingStopLossStep=USDHKD_MovingStopLossStep;
   args_info_recorder[52].symbol="USDHUF";
   args_info_recorder[52]._IsUseMS=USDHUF_IsUseMS;
   args_info_recorder[52]._Pricelimit=USDHUF_Pricelimit;
   args_info_recorder[52]._MovingStopLossStep=USDHUF_MovingStopLossStep;
   args_info_recorder[53].symbol="USDMXN";
   args_info_recorder[53]._IsUseMS=USDMXN_IsUseMS;
   args_info_recorder[53]._Pricelimit=USDMXN_Pricelimit;
   args_info_recorder[53]._MovingStopLossStep=USDMXN_MovingStopLossStep;
   args_info_recorder[54].symbol="USDNOK";
   args_info_recorder[54]._IsUseMS=USDNOK_IsUseMS;
   args_info_recorder[54]._Pricelimit=USDNOK_Pricelimit;
   args_info_recorder[54]._MovingStopLossStep=USDNOK_MovingStopLossStep;
   args_info_recorder[55].symbol="USDPLN";
   args_info_recorder[55]._IsUseMS=USDPLN_IsUseMS;
   args_info_recorder[55]._Pricelimit=USDPLN_Pricelimit;
   args_info_recorder[55]._MovingStopLossStep=USDPLN_MovingStopLossStep;
   args_info_recorder[56].symbol="USDSEK";
   args_info_recorder[56]._IsUseMS=USDSEK_IsUseMS;
   args_info_recorder[56]._Pricelimit=USDSEK_Pricelimit;
   args_info_recorder[56]._MovingStopLossStep=USDSEK_MovingStopLossStep;
   args_info_recorder[57].symbol="USDSGD";
   args_info_recorder[57]._IsUseMS=USDSGD_IsUseMS;
   args_info_recorder[57]._Pricelimit=USDSGD_Pricelimit;
   args_info_recorder[57]._MovingStopLossStep=USDSGD_MovingStopLossStep;
   args_info_recorder[58].symbol="USDTRY";
   args_info_recorder[58]._IsUseMS=USDTRY_IsUseMS;
   args_info_recorder[58]._Pricelimit=USDTRY_Pricelimit;
   args_info_recorder[58]._MovingStopLossStep=USDTRY_MovingStopLossStep;
   args_info_recorder[59].symbol="USDZAR";
   args_info_recorder[59]._IsUseMS=USDZAR_IsUseMS;
   args_info_recorder[59]._Pricelimit=USDZAR_Pricelimit;
   args_info_recorder[59]._MovingStopLossStep=USDZAR_MovingStopLossStep;
   args_info_recorder[60].symbol="XAGUSD";
   args_info_recorder[60]._IsUseMS=XAGUSD_IsUseMS;
   args_info_recorder[60]._Pricelimit=XAGUSD_Pricelimit;
   args_info_recorder[60]._MovingStopLossStep=XAGUSD_MovingStopLossStep;
   args_info_recorder[61].symbol="AUS200";
   args_info_recorder[61]._IsUseMS=AUS200_IsUseMS;
   args_info_recorder[61]._Pricelimit=AUS200_Pricelimit;
   args_info_recorder[61]._MovingStopLossStep=AUS200_MovingStopLossStep;
   args_info_recorder[62].symbol="ES35";
   args_info_recorder[62]._IsUseMS=ES35_IsUseMS;
   args_info_recorder[62]._Pricelimit=ES35_Pricelimit;
   args_info_recorder[62]._MovingStopLossStep=ES35_MovingStopLossStep;
   args_info_recorder[63].symbol="FCHI";
   args_info_recorder[63]._IsUseMS=FCHI_IsUseMS;
   args_info_recorder[63]._Pricelimit=FCHI_Pricelimit;
   args_info_recorder[63]._MovingStopLossStep=FCHI_MovingStopLossStep;
   args_info_recorder[64].symbol="GDAXI";
   args_info_recorder[64]._IsUseMS=GDAXI_IsUseMS;
   args_info_recorder[64]._Pricelimit=GDAXI_Pricelimit;
   args_info_recorder[64]._MovingStopLossStep=GDAXI_MovingStopLossStep;
   args_info_recorder[65].symbol="HK50";
   args_info_recorder[65]._IsUseMS=HK50_IsUseMS;
   args_info_recorder[65]._Pricelimit=HK50_Pricelimit;
   args_info_recorder[65]._MovingStopLossStep=HK50_MovingStopLossStep;
   args_info_recorder[66].symbol="J225";
   args_info_recorder[66]._IsUseMS=J225_IsUseMS;
   args_info_recorder[66]._Pricelimit=J225_Pricelimit;
   args_info_recorder[66]._MovingStopLossStep=J225_MovingStopLossStep;
   args_info_recorder[67].symbol="NDX";
   args_info_recorder[67]._IsUseMS=NDX_IsUseMS;
   args_info_recorder[67]._Pricelimit=NDX_Pricelimit;
   args_info_recorder[67]._MovingStopLossStep=NDX_MovingStopLossStep;
   args_info_recorder[68].symbol="SPX";
   args_info_recorder[68]._IsUseMS=SPX_IsUseMS;
   args_info_recorder[68]._Pricelimit=SPX_Pricelimit;
   args_info_recorder[68]._MovingStopLossStep=SPX_MovingStopLossStep;
   args_info_recorder[69].symbol="STOXX50E";
   args_info_recorder[69]._IsUseMS=STOXX50E_IsUseMS;
   args_info_recorder[69]._Pricelimit=STOXX50E_Pricelimit;
   args_info_recorder[69]._MovingStopLossStep=STOXX50E_MovingStopLossStep;
   args_info_recorder[70].symbol="UK100";
   args_info_recorder[70]._IsUseMS=UK100_IsUseMS;
   args_info_recorder[70]._Pricelimit=UK100_Pricelimit;
   args_info_recorder[70]._MovingStopLossStep=UK100_MovingStopLossStep;
   args_info_recorder[71].symbol="USDX";
   args_info_recorder[71]._IsUseMS=USDX_IsUseMS;
   args_info_recorder[71]._Pricelimit=USDX_Pricelimit;
   args_info_recorder[71]._MovingStopLossStep=USDX_MovingStopLossStep;
   args_info_recorder[72].symbol="WS30";
   args_info_recorder[72]._IsUseMS=WS30_IsUseMS;
   args_info_recorder[72]._Pricelimit=WS30_Pricelimit;
   args_info_recorder[72]._MovingStopLossStep=WS30_MovingStopLossStep;
   args_info_recorder[73].symbol="China50";
   args_info_recorder[73]._IsUseMS=China50_IsUseMS;
   args_info_recorder[73]._Pricelimit=China50_Pricelimit;
   args_info_recorder[73]._MovingStopLossStep=China50_MovingStopLossStep;
   args_info_recorder[74].symbol="CN300";
   args_info_recorder[74]._IsUseMS=CN300_IsUseMS;
   args_info_recorder[74]._Pricelimit=CN300_Pricelimit;
   args_info_recorder[74]._MovingStopLossStep=CN300_MovingStopLossStep;
   args_info_recorder[75].symbol="XBRUSD";
   args_info_recorder[75]._IsUseMS=XBRUSD_IsUseMS;
   args_info_recorder[75]._Pricelimit=XBRUSD_Pricelimit;
   args_info_recorder[75]._MovingStopLossStep=XBRUSD_MovingStopLossStep;
   args_info_recorder[76].symbol="XTIUSD";
   args_info_recorder[76]._IsUseMS=XTIUSD_IsUseMS;
   args_info_recorder[76]._Pricelimit=XTIUSD_Pricelimit;
   args_info_recorder[76]._MovingStopLossStep=XTIUSD_MovingStopLossStep;
   args_info_recorder[77].symbol="NGAS";
   args_info_recorder[77]._IsUseMS=NGAS_IsUseMS;
   args_info_recorder[77]._Pricelimit=NGAS_Pricelimit;
   args_info_recorder[77]._MovingStopLossStep=NGAS_MovingStopLossStep;

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

      //----1.根据各个品种计算移动止损条件执行价差线
         double CarryConditionValue= Pricelimit*SymbolInfoDouble(OrderSymbol(),SYMBOL_POINT);
         double StopLossFirstValue = MovingStopLossStep*SymbolInfoDouble(OrderSymbol(),SYMBOL_POINT);
      for(int j=0;j<ArraySize(args_info_recorder);j++)
      {
         if (OrderSymbol()==args_info_recorder[j].symbol)
         {
         CarryConditionValue= args_info_recorder[j]._Pricelimit*SymbolInfoDouble(OrderSymbol(),SYMBOL_POINT);
         StopLossFirstValue = args_info_recorder[j]._MovingStopLossStep*SymbolInfoDouble(OrderSymbol(),SYMBOL_POINT);
         break;
         }
    
}

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
               if(stoploss_line<OrderStopLoss() || OrderStopLoss()==0)
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
