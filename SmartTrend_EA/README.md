# SmartTrend_EA v2.0

## Installation Guide

### Step 1: Download the EA
- Download `SmartTrend_EA.mq5` from the repository

### Step 2: Copy to MT5 Folder
1. Open MetaTrader 5
2. Click **File** → **Open Data Folder**
3. Navigate to: `MQL5/Experts`
4. Paste `SmartTrend_EA.mq5` into this folder

### Step 3: Compile the EA
1. In MT5, click **File** → **Open**
2. Select `SmartTrend_EA.mq5`
3. Press **F7** or click **Compile** button
4. Wait for "0 errors" message

### Step 4: Attach to Chart
1. Open M5-H1 chart (EUR/USD, GBP/USD, USD/JPY, or AUD/USD recommended)
2. Right-click on chart → **Expert Advisors** → **SmartTrend_EA**
3. Or drag `SmartTrend_EA` from Navigator onto chart

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
A trend-following strategy combining EMA crossovers, RSI, and ATR for dynamic position sizing. Adapts to market volatility with ATR-based stop loss and take profit levels.

## Strategy
- **Timeframe:** Current (M5-H1 recommended)
- **Entry:** EMA crossover + RSI confirmation + ATR-based sizing
- **Exit:** ATR-based take profit with trailing stop
- **Risk/Reward:** 1:3 ratio (ATR-based)

## Key Improvements (v2.0)
✅ **Better Risk/Reward** - ATR TP multiplier 2.5 → 3.0 (1:3 ratio)
✅ **Lenient RSI Filters** - 50-70 → 40-70 (more trading opportunities)
✅ **Improved Trailing Stop** - Better ATR-based trail logic
✅ **Tighter News Filter** - 30 → 5 mins (more trading time)

## Parameters

### Core Settings
- **LotSize:** 0.1 - Position size
- **MaxSpread:** 20 - Maximum acceptable spread (points)

### Strategy Settings
- **FastMA_Period:** 21 - Fast EMA period
- **SlowMA_Period:** 50 - Slow EMA period
- **MA_Method:** MODE_EMA - Moving average type
- **RSI_Period:** 14 - RSI calculation period
- **RSI_OB:** 70.0 - Overbought level
- **RSI_OS:** 30.0 - Oversold level

### ATR Settings
- **ATR_Period:** 14 - ATR calculation period
- **ATR_SL_Mult:** 1.5 - ATR multiplier for stop loss
- **ATR_TP_Mult:** 3.0 - ATR multiplier for take profit (1:3 ratio)

### Trailing Stop
- **UseTrailingStop:** true
- **TrailStart_Mult:** 1.5 - ATR multiplier to activate trail
- **TrailStep_Mult:** 0.75 - ATR multiplier for trail step

### Filters
- **UseSessionFilter:** true - Trade during active sessions
- **SessionStartHour:** 7 - Session start (server time)
- **SessionEndHour:** 20 - Session end (server time)
- **UseNewsFilter:** true - Avoid high-impact news
- **NewsMinutesBefore/After:** 5 - News avoidance window (tighter)

## How It Works

1. **EMA Crossover:** Detects when Fast EMA crosses above/below Slow EMA
2. **RSI Confirmation:** Checks RSI is in favorable zone (40-70 for buy, 30-60 for sell)
3. **ATR Sizing:** Calculates SL/TP based on current volatility
4. **Entry:** Opens position with dynamic stops
5. **Trailing Stop:** Locks profits using ATR-based trail

## Entry Logic

### BUY Signal
- Fast EMA crosses above Slow EMA (bullish)
- RSI between 40-70 (bullish zone, more lenient)
- SL = Price - (ATR × 1.5)
- TP = Price + (ATR × 3.0)

### SELL Signal
- Fast EMA crosses below Slow EMA (bearish)
- RSI between 30-60 (bearish zone, more lenient)
- SL = Price + (ATR × 1.5)
- TP = Price - (ATR × 3.0)

## Recommended Settings

### Conservative (Low Risk)
```
FastMA_Period: 25
SlowMA_Period: 75
ATR_SL_Mult: 2.0
ATR_TP_Mult: 4.0
TrailStart_Mult: 2.0
```

### Aggressive (High Risk)
```
FastMA_Period: 15
SlowMA_Period: 35
ATR_SL_Mult: 1.0
ATR_TP_Mult: 2.0
TrailStart_Mult: 1.0
```

## Backtest Results Expected
- Win Rate: 50-60%
- Profit Factor: 1.8-2.5
- Max Drawdown: 10-15%

## Best Pairs
- EUR/USD (most reliable)
- GBP/USD
- USD/JPY
- Any major pair during London/NY sessions

## Important Notes
⚠️ **ATR-Based Sizing:** Automatically adjusts to market volatility
⚠️ **Lenient RSI:** Allows more trades but may increase false signals
⚠️ **Session Filter:** Restricts trading to 7-20 server time (adjust for your timezone)
⚠️ **Trending Markets:** Works best in strong trends, struggles in ranges

## Troubleshooting
- **Few trades:** Reduce FastMA_Period or SlowMA_Period
- **High losses:** Increase ATR_SL_Mult or reduce ATR_TP_Mult
- **Whipsaws:** Increase both MA periods or tighten RSI filters
- **No trailing:** Verify TrailStart_Mult is not too high

## Version History
- **v2.0:** Better R:R (1:3), lenient RSI, improved trailing, tighter filters
- **v1.0:** Initial release
