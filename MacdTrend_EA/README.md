# 📊 MACD Trend EA - Professional Edition

**Version:** 1.1 | **Strategy:** MACD Momentum | **Timeframe:** H1 | **Last Updated:** April 24, 2026

## Installation Guide

### Step 1: Download the EA
- Download `MacdTrend_EA.mq5` from the repository

### Step 2: Copy to MT5 Folder
1. Open MetaTrader 5
2. Click **File** → **Open Data Folder**
3. Navigate to: `MQL5/Experts`
4. Paste `MacdTrend_EA.mq5` into this folder

### Step 3: Compile the EA
1. In MT5, click **File** → **Open**
2. Select `MacdTrend_EA.mq5`
3. Press **F7** or click **Compile** button
4. Wait for "0 errors" message

### Step 4: Attach to Chart
1. Open H1 chart (EUR/USD, GBP/USD, or USD/JPY recommended)
2. Right-click on chart → **Expert Advisors** → **MacdTrend_EA**
3. Or drag `MacdTrend_EA` from Navigator onto chart

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
A momentum-based trend following strategy using MACD (Moving Average Convergence Divergence). Trades when MACD crosses signal line with confirmation from histogram and zero line.

## Strategy
- **Timeframe:** H1 (1-hour)
- **Entry:** MACD crossover + histogram + zero line confirmation
- **Exit:** Fixed take profit with trailing stop
- **Risk/Reward:** 1:3 ratio

## Key Features
✅ **MACD Crossover** - Identifies momentum shifts
✅ **Histogram Confirmation** - Validates trend direction
✅ **Zero Line Filter** - Confirms trend strength
✅ **Trailing Stop** - Locks profits automatically
✅ **News Filter** - Avoids high-impact events

## Parameters

### Core Settings
- **LotSize:** 0.1 - Position size
- **MaxSpread:** 20 - Maximum acceptable spread (points)

### MACD Settings
- **FastEMA:** 12 - Fast EMA period
- **SlowEMA:** 26 - Slow EMA period
- **SignalPeriod:** 9 - Signal line period

### Risk Management
- **SL_Points:** 60 - Stop loss (points)
- **TP_Points:** 180 - Take profit (points) — 1:3 ratio
- **UseTrailingStop:** true
- **TrailStart_Pts:** 80 - Activate after 80 pts profit
- **TrailStep_Pts:** 40 - Trail step size

### Filters
- **UseSessionFilter:** true - Trade London/NY sessions
- **UseNewsFilter:** true - Avoid high-impact news
- **NewsMinsBefore/After:** 5 - News avoidance window

## How It Works

1. **MACD Calculation:** Calculates MACD line and signal line
2. **Crossover Detection:** Identifies when MACD crosses signal line
3. **Histogram Check:** Verifies histogram is positive (buy) or negative (sell)
4. **Zero Line Filter:** Confirms MACD is above (buy) or below (sell) zero
5. **Entry:** Opens position when all conditions align
6. **Exit:** Targets 180 points with trailing stop

## Entry Logic

### BUY Signal
- MACD crosses above signal line (bullish crossover)
- MACD histogram > 0 (uptrend)
- MACD main > 0 (above zero line)
- Expect upward momentum

### SELL Signal
- MACD crosses below signal line (bearish crossover)
- MACD histogram < 0 (downtrend)
- MACD main < 0 (below zero line)
- Expect downward momentum

## Recommended Settings

### Conservative (Low Risk)
```
FastEMA: 14
SlowEMA: 28
SignalPeriod: 12
SL_Points: 80
TP_Points: 240
TrailStart_Pts: 100
```

### Aggressive (High Risk)
```
FastEMA: 10
SlowEMA: 20
SignalPeriod: 5
SL_Points: 40
TP_Points: 120
TrailStart_Pts: 60
```

## Backtest Results Expected
- Win Rate: 55-65%
- Profit Factor: 1.8-2.5
- Max Drawdown: 10-15%

## Best Pairs
- EUR/USD (most reliable)
- GBP/USD
- USD/JPY
- AUD/USD

## Important Notes
⚠️ **Trend Following:** Works best in trending markets
⚠️ **Whipsaws:** Can generate false signals in ranging markets
⚠️ **Zero Line:** Crossing zero line confirms trend strength
⚠️ **Histogram:** Divergence between MACD and histogram signals weakness

## Troubleshooting
- **Few trades:** Reduce FastEMA or SlowEMA periods
- **High losses:** Increase SL_Points or reduce TP_Points
- **False signals:** Increase periods or add additional confirmation

## Version History
- **v1.0:** Initial release with MACD trend following

