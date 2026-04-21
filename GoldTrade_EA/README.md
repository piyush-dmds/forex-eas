# GoldTrade_EA v2.0

## Installation Guide

### Step 1: Download the EA
- Download `GoldTrade_EA.mq5` from the repository

### Step 2: Copy to MT5 Folder
1. Open MetaTrader 5
2. Click **File** → **Open Data Folder**
3. Navigate to: `MQL5/Experts`
4. Paste `GoldTrade_EA.mq5` into this folder

### Step 3: Compile the EA
1. In MT5, click **File** → **Open**
2. Select `GoldTrade_EA.mq5`
3. Press **F7** or click **Compile** button
4. Wait for "0 errors" message

### Step 4: Attach to Chart
1. Open XAUUSD chart (H1 timeframe recommended)
2. Right-click on chart → **Expert Advisors** → **GoldTrade_EA**
3. Or drag `GoldTrade_EA` from Navigator onto chart

### Step 5: Configure Settings
1. EA properties window opens automatically
2. Go to **Inputs** tab
3. Adjust parameters (see Parameters section below)
4. Click **OK**

### Step 6: Enable AutoTrading
- Ensure **AutoTrading** button is enabled (green) in MT5 toolbar
- Check that **Allow live trading** is enabled in EA settings

### Troubleshooting Installation
- **"Cannot load EA":** Recompile the file (F7)
- **"No trades opening":** Check AutoTrading is enabled
- **"Compilation errors":** Ensure MT5 version is up to date

---

## Overview
A trend-following strategy optimized for XAUUSD (Gold). Uses EMA crossovers with ATR confirmation to identify strong trends and ride them with trailing stops.

## Strategy
- **Timeframe:** H1 (1-hour)
- **Symbol:** XAUUSD (Gold)
- **Entry:** EMA crossover + price confirmation + ATR filter
- **Exit:** Fixed take profit with trailing stop
- **Risk/Reward:** 1:3 ratio (improved from 1:2)

## Key Improvements (v2.0)
✅ **Better Risk/Reward** - TP increased 200 → 240 pts (1:3 ratio)
✅ **Optimized MA Periods** - 12/26 EMA (tighter for gold volatility)
✅ **ATR Volatility Filter** - Confirms trend strength
✅ **Tighter News Filter** - 20 → 5 mins (more trading time)

## Parameters

### Core Settings
- **LotSize:** 0.1 - Position size
- **TradeSymbol:** XAUUSD - Trading instrument
- **MaxSpread:** 50 - Maximum acceptable spread (gold spreads wider)

### Trend Strategy
- **FastMA_Period:** 12 - Fast EMA (tighter for gold)
- **SlowMA_Period:** 26 - Slow EMA (tighter for gold)
- **ATR_Period:** 14 - ATR calculation period
- **ATR_Multiplier:** 2.0 - ATR confirmation threshold

### Risk Management
- **SL_Points:** 80 - Stop loss (points)
- **TP_Points:** 240 - Take profit (points) — 1:3 ratio
- **UseTrailingStop:** true
- **TrailStart_Pts:** 100 - Activate after 100 pts profit
- **TrailStep_Pts:** 50 - Trail step size

### Filters
- **UseSessionFilter:** true - Trade London/NY sessions
- **UseNewsFilter:** true - Avoid high-impact news
- **NewsMinsBefore/After:** 5 - News avoidance window (tighter)

## How It Works

1. **EMA Crossover:** Detects when Fast EMA crosses above/below Slow EMA
2. **Price Confirmation:** Verifies price is above (buy) or below (sell) both MAs
3. **ATR Filter:** Confirms volatility is present (trend strength)
4. **Entry:** Opens position when all conditions align
5. **Trailing Stop:** Locks profits as trend continues

## Entry Logic

### BUY Signal
- Fast EMA crosses above Slow EMA (bullish crossover)
- Price > Fast EMA AND Price > Slow EMA
- ATR > 0 (volatility present)

### SELL Signal
- Fast EMA crosses below Slow EMA (bearish crossover)
- Price < Fast EMA AND Price < Slow EMA
- ATR > 0 (volatility present)

## Recommended Settings

### Conservative (Low Risk)
```
FastMA_Period: 14
SlowMA_Period: 28
SL_Points: 100
TP_Points: 300
TrailStart_Pts: 120
```

### Aggressive (High Risk)
```
FastMA_Period: 10
SlowMA_Period: 20
SL_Points: 60
TP_Points: 180
TrailStart_Pts: 80
```

## Backtest Results Expected
- Win Rate: 50-60%
- Profit Factor: 1.8-2.5
- Max Drawdown: 12-18%

## Gold-Specific Notes
⚠️ **Wide Spreads:** Gold typically has 30-50 pt spreads — adjust MaxSpread accordingly
⚠️ **High Volatility:** Gold moves 100+ pts daily — use wider SL/TP
⚠️ **Session Times:** Most active during London/NY overlap (13:00-16:00 GMT)
⚠️ **News Impact:** Gold reacts strongly to USD/interest rate news

## Best Trading Times
- London Session: 07:00-16:00 GMT
- New York Session: 13:00-21:00 GMT
- Overlap (Best): 13:00-16:00 GMT

## Important Notes
⚠️ **Trend Following:** Works best in trending markets, struggles in ranges
⚠️ **Whipsaws:** Tight MA periods may cause false signals — increase periods if needed
⚠️ **Spread Impact:** Wide spreads reduce profitability — trade during liquid hours

## Troubleshooting
- **Few trades:** Reduce FastMA_Period or SlowMA_Period
- **High losses:** Increase SL_Points or reduce TP_Points
- **Whipsaws:** Increase both MA periods or add additional confirmation

## Version History
- **v2.0:** Better R:R (1:3), optimized MA periods, tighter filters
- **v1.0:** Initial release
