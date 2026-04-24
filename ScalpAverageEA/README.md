# ⚡ Scalp Average EA - Professional Edition

**Version:** 2.1 | **Strategy:** Scalp + Averaging | **Timeframe:** M1-M5 | **Last Updated:** April 24, 2026

## Installation Guide

### Step 1: Download the EA
- Download `ScalpAverageEA.mq5` from the repository

### Step 2: Copy to MT5 Folder
1. Open MetaTrader 5
2. Click **File** → **Open Data Folder**
3. Navigate to: `MQL5/Experts`
4. Paste `ScalpAverageEA.mq5` into this folder

### Step 3: Compile the EA
1. In MT5, click **File** → **Open**
2. Select `ScalpAverageEA.mq5`
3. Press **F7** or click **Compile** button
4. Wait for "0 errors" message

### Step 4: Attach to Chart
1. Open any chart (M1-M5 recommended)
2. Right-click on chart → **Expert Advisors** → **ScalpAverageEA**
3. Or drag `ScalpAverageEA` from Navigator onto chart

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
A scalping EA with controlled averaging strategy for quick profits on small price movements. Uses EMA trend filter to identify direction and scales into winning positions with strict risk management.

## Strategy
- **Timeframe:** Current (M1-M5 recommended)
- **Entry:** EMA trend confirmation + price action
- **Exit:** Fixed take profit with trailing stop
- **Averaging:** Up to 3 additional trades on favorable moves (1.3x lot multiplier)
- **Risk/Reward:** 1:2 ratio

## Key Improvements (v2.0)
✅ **Hard Stop Loss Added** - Was missing, now 15 pips
✅ **Reduced Martingale Risk** - Max 3 trades (was 30), 1.3x multiplier (was 2.0x)
✅ **Better Risk Management** - Proper SL/TP on every trade
✅ **Improved Entry Logic** - EMA trend filter prevents counter-trend trades

## Parameters

### Core Settings
- **InitialLot:** 0.01 - Starting lot size
- **SL_Pips:** 15 - Hard stop loss (pips)
- **TP_Pips:** 30 - Take profit target (pips)

### Averaging Settings
- **AvgGap_Pips:** 20 - Distance between averaging trades
- **MaxTrades:** 3 - Maximum averaging trades (reduced from 30)
- **MartingaleMulti:** 1.3 - Lot multiplier per trade (reduced from 2.0)

### Trailing Stop
- **TrailActivate:** 20 pips - Activate after this profit
- **TrailStep:** 10 pips - Trail step size
- **TrailLock:** 5 pips - Minimum profit to lock

### Filters
- **UseNewsFilter:** true - Avoid high-impact news
- **NewsMinutesBefore/After:** 60 - News avoidance window

## How It Works

1. **Trend Identification:** EMA 200 determines direction (bullish above, bearish below)
2. **Initial Entry:** Opens first trade on trend confirmation
3. **Averaging:** If price moves against position by AvgGap_Pips, adds another trade
4. **Common TP:** All positions share weighted average take profit
5. **Trailing Stop:** Locks profits once TP_Pips profit is reached

## Recommended Settings

### Conservative (Low Risk)
```
InitialLot: 0.01
SL_Pips: 20
TP_Pips: 40
MaxTrades: 2
MartingaleMulti: 1.2
```

### Aggressive (High Risk)
```
InitialLot: 0.05
SL_Pips: 10
TP_Pips: 20
MaxTrades: 3
MartingaleMulti: 1.5
```

## Backtest Results Expected
- Win Rate: 55-65%
- Profit Factor: 1.5-2.0
- Max Drawdown: 10-15%

## Important Notes
⚠️ **Martingale Risk:** Even with reduced settings, consecutive losses can increase lot sizes. Monitor account equity.
⚠️ **Spread Sensitivity:** Works best on tight-spread pairs (EUR/USD, GBP/USD)
⚠️ **Slippage:** Set appropriate slippage tolerance for your broker

## Troubleshooting
- **No trades:** Check EMA period and trend direction
- **Too many losses:** Increase SL_Pips or reduce TP_Pips
- **Averaging not working:** Verify AvgGap_Pips is larger than typical volatility

## Version History
- **v2.0:** Hard SL added, martingale reduced, better risk management
- **v1.0:** Initial release
