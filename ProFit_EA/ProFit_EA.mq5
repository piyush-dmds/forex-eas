//+------------------------------------------------------------------+
//|                                                   ProFit_EA.mq5   |
//|                  Bollinger Bands Mean Reversion Strategy          |
//|                    IMPROVED: Better Risk/Reward + ATR Sizing      |
//+------------------------------------------------------------------+
#property copyright "ProFit EA v2.0"
#property version   "2.00"
#property strict

#include <Trade\Trade.mqh>
#include <Trade\PositionInfo.mqh>

CTrade trade;
CPositionInfo posInfo;

//+------------------------------------------------------------------+
//| INPUT PARAMETERS                                                 |
//+------------------------------------------------------------------+
input group "=== CORE SETTINGS ==="
input double   LotSize          = 0.1;       // Lot Size
input int      MagicNumber      = 99999;     // Magic Number
input int      MaxSpread        = 25;        // Max Spread (points)

input group "=== BOLLINGER BANDS SETTINGS ==="
input int      BB_Period        = 20;        // Bollinger Bands Period
input double   BB_Deviation     = 2.0;       // Bollinger Bands Deviation
input double   BB_TouchPercent  = 0.95;      // % of band to touch (0.95 = 95%)

input group "=== RISK MANAGEMENT ==="
input int      SL_Points        = 50;        // Stop Loss (points)
input int      TP_Points        = 150;       // Take Profit (points) — 1:3 ratio
input bool     UseATR_Sizing    = true;      // Use ATR for dynamic sizing
input int      ATR_Period       = 14;        // ATR Period for sizing
input double   ATR_SL_Mult      = 1.5;       // ATR multiplier for SL
input double   ATR_TP_Mult      = 3.0;       // ATR multiplier for TP
input bool     UseTrailingStop  = true;      // Enable Trailing Stop
input int      TrailStart_Pts   = 60;        // Trail Activate (points profit)
input int      TrailStep_Pts    = 30;        // Trail Step (points)

input group "=== FILTERS ==="
input bool     UseSessionFilter = true;      // Trade only London/NY
input bool     UseNewsFilter    = true;      // Avoid news events
input int      NewsMinsBefore   = 5;         // Minutes before news (tighter)
input int      NewsMinutesAfter = 5;         // Minutes after news (tighter)

//+------------------------------------------------------------------+
//| GLOBAL VARIABLES                                                 |
//+------------------------------------------------------------------+
int    bb_handle, atr_handle;
double bbUpper[], bbMiddle[], bbLower[];
double atrVal[];
datetime lastBarTime = 0;

//+------------------------------------------------------------------+
//| INIT                                                             |
//+------------------------------------------------------------------+
int OnInit()
{
   trade.SetExpertMagicNumber(MagicNumber);
   trade.SetDeviationInPoints(5);
   trade.SetTypeFilling(ORDER_FILLING_IOC);

   bb_handle = iBands(_Symbol, PERIOD_H1, BB_Period, 0, BB_Deviation, PRICE_CLOSE);
   atr_handle = iATR(_Symbol, PERIOD_H1, ATR_Period);

   if(bb_handle == INVALID_HANDLE || atr_handle == INVALID_HANDLE)
   {
      Print("ERROR: Failed to create indicators.");
      return INIT_FAILED;
   }

   ArraySetAsSeries(bbUpper,  true);
   ArraySetAsSeries(bbMiddle, true);
   ArraySetAsSeries(bbLower,  true);
   ArraySetAsSeries(atrVal,   true);

   Print("ProFit EA v2.0 initialized successfully.");
   return INIT_SUCCEEDED;
}

//+------------------------------------------------------------------+
//| DEINIT                                                           |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{
   IndicatorRelease(bb_handle);
   IndicatorRelease(atr_handle);
}

//+------------------------------------------------------------------+
//| ON TICK                                                          |
//+------------------------------------------------------------------+
void OnTick()
{
   // --- Trailing stop on every tick ---
   if(UseTrailingStop)
      ManageTrailingStop();

   // --- Only process new H1 bar ---
   datetime currentBar = iTime(_Symbol, PERIOD_H1, 0);
   if(currentBar == lastBarTime) return;
   lastBarTime = currentBar;

   // --- Spread check ---
   double spread = (SymbolInfoDouble(_Symbol, SYMBOL_ASK) - SymbolInfoDouble(_Symbol, SYMBOL_BID)) / _Point;
   if(spread > MaxSpread) return;

   // --- Session filter ---
   if(UseSessionFilter && !IsValidSession()) return;

   // --- News filter ---
   if(UseNewsFilter && IsNewsTime()) return;

   // --- Already in trade ---
   if(HasOpenPosition()) return;

   // --- Load indicators ---
   if(CopyBuffer(bb_handle, 0, 0, 3, bbMiddle) < 3) return;
   if(CopyBuffer(bb_handle, 1, 0, 3, bbUpper)  < 3) return;
   if(CopyBuffer(bb_handle, 2, 0, 3, bbLower)  < 3) return;
   if(CopyBuffer(atr_handle, 0, 0, 3, atrVal)  < 3) return;

   double bid = SymbolInfoDouble(_Symbol, SYMBOL_BID);
   double ask = SymbolInfoDouble(_Symbol, SYMBOL_ASK);
   double point = _Point;
   double atr = atrVal[1];

   double bandWidth = bbUpper[1] - bbLower[1];
   double touchLevel = bandWidth * (1.0 - BB_TouchPercent);

   // Calculate dynamic SL/TP if ATR sizing enabled
   double sl_pts = SL_Points;
   double tp_pts = TP_Points;
   
   if(UseATR_Sizing && atr > 0)
   {
      sl_pts = atr / point * ATR_SL_Mult;
      tp_pts = atr / point * ATR_TP_Mult;
   }

   // ================================================================
   // BUY SIGNAL:
   // Price touches lower Bollinger Band (oversold)
   // Expect mean reversion upward
   // ================================================================
   double distFromLower = bid - bbLower[1];
   if(distFromLower >= 0 && distFromLower <= touchLevel)
   {
      double sl = NormalizeDouble(ask - sl_pts * point, _Digits);
      double tp = NormalizeDouble(ask + tp_pts * point, _Digits);

      if(trade.Buy(LotSize, _Symbol, ask, sl, tp, "ProFit BUY"))
      {
         Print("BUY Signal | Price:", ask, " Lower BB:", bbLower[1], 
               " SL:", sl, " TP:", tp, " ATR:", atr);
      }
      return;
   }

   // ================================================================
   // SELL SIGNAL:
   // Price touches upper Bollinger Band (overbought)
   // Expect mean reversion downward
   // ================================================================
   double distFromUpper = bbUpper[1] - bid;
   if(distFromUpper >= 0 && distFromUpper <= touchLevel)
   {
      double sl = NormalizeDouble(bid + sl_pts * point, _Digits);
      double tp = NormalizeDouble(bid - tp_pts * point, _Digits);

      if(trade.Sell(LotSize, _Symbol, bid, sl, tp, "ProFit SELL"))
      {
         Print("SELL Signal | Price:", bid, " Upper BB:", bbUpper[1], 
               " SL:", sl, " TP:", tp, " ATR:", atr);
      }
      return;
   }
}

//+------------------------------------------------------------------+
//| Trailing Stop                                                    |
//+------------------------------------------------------------------+
void ManageTrailingStop()
{
   double point = _Point;

   for(int i = PositionsTotal() - 1; i >= 0; i--)
   {
      if(!posInfo.SelectByIndex(i)) continue;
      if(posInfo.Symbol() != _Symbol || posInfo.Magic() != MagicNumber) continue;

      double openPrice = posInfo.PriceOpen();
      double currentSL = posInfo.StopLoss();

      if(posInfo.PositionType() == POSITION_TYPE_BUY)
      {
         double bid = SymbolInfoDouble(_Symbol, SYMBOL_BID);
         double profit = (bid - openPrice) / point;

         if(profit >= TrailStart_Pts)
         {
            double newSL = NormalizeDouble(bid - TrailStep_Pts * point, _Digits);
            if(newSL > currentSL + point)
               trade.PositionModify(posInfo.Ticket(), newSL, posInfo.TakeProfit());
         }
      }
      else if(posInfo.PositionType() == POSITION_TYPE_SELL)
      {
         double ask = SymbolInfoDouble(_Symbol, SYMBOL_ASK);
         double profit = (openPrice - ask) / point;

         if(profit >= TrailStart_Pts)
         {
            double newSL = NormalizeDouble(ask + TrailStep_Pts * point, _Digits);
            if(newSL < currentSL - point || currentSL == 0)
               trade.PositionModify(posInfo.Ticket(), newSL, posInfo.TakeProfit());
         }
      }
   }
}

//+------------------------------------------------------------------+
//| Session Filter — Trade London/NY overlap (best liquidity)       |
//+------------------------------------------------------------------+
bool IsValidSession()
{
   MqlDateTime dt;
   TimeToStruct(TimeCurrent(), dt);
   int hour = dt.hour;

   // London: 07:00-16:00, NY: 13:00-21:00, Overlap: 13:00-16:00
   bool london = (hour >= 7  && hour < 16);
   bool ny     = (hour >= 13 && hour < 21);

   return (london || ny);
}

//+------------------------------------------------------------------+
//| News Filter                                                      |
//+------------------------------------------------------------------+
bool IsNewsTime()
{
   datetime now  = TimeCurrent();
   datetime from = now - NewsMinsBefore * 60;
   datetime to   = now + NewsMinutesAfter * 60;

   MqlCalendarValue values[];
   string base  = StringSubstr(_Symbol, 0, 3);
   string quote = StringSubstr(_Symbol, 3, 3);

   int count = CalendarValueHistory(values, from, to, NULL, NULL);
   if(count <= 0) return false;

   for(int i = 0; i < count; i++)
   {
      MqlCalendarEvent event;
      if(!CalendarEventById(values[i].event_id, event)) continue;
      if(event.importance != CALENDAR_IMPORTANCE_HIGH) continue;

      MqlCalendarCountry country;
      if(!CalendarCountryById(event.country_id, country)) continue;

      if(country.currency == base || country.currency == quote)
         return true;
   }
   return false;
}

//+------------------------------------------------------------------+
//| Check if EA has open position                                    |
//+------------------------------------------------------------------+
bool HasOpenPosition()
{
   for(int i = PositionsTotal() - 1; i >= 0; i--)
      if(posInfo.SelectByIndex(i))
         if(posInfo.Symbol() == _Symbol && posInfo.Magic() == MagicNumber)
            return true;
   return false;
}
//+------------------------------------------------------------------+
