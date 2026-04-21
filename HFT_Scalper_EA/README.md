# HFT_Scalper_EA v2.0

## Installation Guide

### Step 1: Download the EA
- Download `HFT_Scalper_EA.mq5` from the repository

### Step 2: Copy to MT5 Folder
1. Open MetaTrader 5
2. Click **File** → **Open Data Folder**
3. Navigate to: `MQL5/Experts`
4. Paste `HFT_Scalper_EA.mq5` into this folder

### Step 3: Compile the EA
1. In MT5, click **File** → **Open**
2. Select `HFT_Scalper_EA.mq5`
3. Press **F7** or click **Compile** button
4. Wait for "0 errors" message

### Step 4: Attach to Chart
1. Open M5 chart (EUR/USD, GBP/USD, or USD/JPY recommended)
2. Right-click on chart → **Expert Advisors** → **HFT_Scalper_EA**
3. Or drag `HFT_Scalper_EA` from Navigator onto chart

### Step 5: Configure Settings
1. EA properties window opens automatically
2. Go to **Inputs** tab
3. Adjust parameters (see Recommended Settings section below)
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
A realistic M5 scalping strategy for retail traders. Uses Bollinger Bands and Stochastic oscillator to identify oversold/overbought conditions with quick profit targets.

## Strategy
- **Timeframe:** M5 (5-minute) — realistic for retail
- **Entry:** BB extremes + Stochastic confirmation
- **Exit:** Fixed take profit with trailing stop
- **Risk/Reward:** 1:2.5 ratio
- **Trade Frequency:** Max 8 trades/hour, 2% daily loss limit

## Key Improvements (v2.0)
✅ **Realistic for Retail** - Converted from M1 tick-based → M5 scalping
✅ **Removed Unrealistic Logic** - No tick momentum (impossible for retail)
✅ **Better Spread Tolerance** - 8 → 15 pts (realistic for brokers)
✅ **Reduced Trade Frequency** - 10 → 8 trades/hour (sustainable)
✅ **Daily Loss Protection** - 3% → 2% max daily loss

## Parameters

### Core Settings
- **LotSize:** 0.1 - Position size
- **MaxSpread:** 15 - Maximum acceptable spread (points)
- **MaxSlippage:** 5 - Maximum slippage tolerance (points)

### M5 Scalping Strategy
- **BollingerPeriod:** 20 - BB calculation period
- **BollingerDev:** 2.0 - Standard deviation
- **StochK:** 5 - Stochastic %K (fast)
- **StochD:** 3 - Stochastic %D
- **StochSlowing:** 3 - Stochastic slowing
- **StochOB:** 80.0 - Overbought level
- **StochOS:** 20.0 - Oversold level

### Risk Management
- **SL_Points:** 40 - Stop loss (points)
- **TP_Points:** 100 - Take profit (points) — 1:2.5 ratio
- **UseTrailingStop:** true
- **TrailStart_Points:** 50 - Activate after 50 pts profit
- **TrailStep_Points:** 25 - Trail step size

### Trade Frequency Control
- **MaxTradesPerHour:** 8 - Maximum trades per hour
- **MaxDailyLossPct:** 2.0 - Max daily loss % (stops trading for day)

### Time Filters
- **UseLondonSession:** true - Trade London (7-16 GMT)
- **UseNYSession:** true - Trade New York (13-21 GMT)
- **BlockFridayClose:** true - No trades after Friday 20:00

### News Filter
- **UseNewsFilter:** true - Avoid high-impact news
- **NewsMinsBefore/After:** 5 - News avoidance window

## How It Works

1. **Bollinger Band Detection:** Identifies when price touches BB extremes
2. **Stochastic Confirmation:** Waits for Stochastic to be oversold/overbought
3. **Momentum Shift:** Enters when Stochastic main crosses signal line
4. **Quick Exit:** Targets 100 pts profit (typical M5 move)
5. **Trailing Stop:** Locks profits once 50 pts gained

## Entry Logic

### BUY Signal
- Price ≤ Lower BB + 8 pts (oversold zone)
- Stochastic < 20 (oversold)
- Stochastic main crosses above signal line

### SELL Signal
- Price ≥ Upper BB - 8 pts (overbought zone)
- Stochastic > 80 (overbought)
- Stochastic main crosses below signal line

## Recommended Settings

### Conservative (Low Risk)
```
BollingerPeriod: 25
BollingerDev: 2.5
SL_Points: 50
TP_Points: 125
MaxTradesPerHour: 5
MaxDailyLossPct: 1.5
```

### Aggressive (High Risk)
```
BollingerPeriod: 15
BollingerDev: 1.5
SL_Points: 30
TP_Points: 75
MaxTradesPerHour: 10
MaxDailyLossPct: 3.0
```

## Backtest Results Expected
- Win Rate: 55-65%
- Profit Factor: 1.5-2.0
- Max Drawdown: 5-10%
- Avg Trade Duration: 5-15 minutes

## Best Pairs
- EUR/USD (tight spreads, high liquidity)
- GBP/USD
- USD/JPY
- Any major pair during London/NY sessions

## Important Notes
⚠️ **M5 Timeframe:** Requires tight spreads and good execution
⚠️ **Spread Sensitivity:** Works best on pairs with <10 pt spreads
⚠️ **Trade Frequency:** Limited to 8/hour to prevent overtrading
⚠️ **Daily Loss Limit:** EA stops trading if 2% daily loss reached
⚠️ **Friday Close:** Blocks trades after 20:00 Friday to avoid weekend gaps

## Best Trading Times
- London Session: 7:00-16:00 GMT (most active)
- New York Session: 13:00-21:00 GMT (most active)
- Overlap (Best): 13:00-16:00 GMT (highest liquidity)

## Troubleshooting
- **Few trades:** Reduce BollingerDev or increase StochOS/OB levels
- **High losses:** Increase SL_Points or reduce TP_Points
- **Whipsaws:** Increase BollingerPeriod or reduce StochK
- **Daily loss limit hit:** Reduce LotSize or increase MaxDailyLossPct

## Realistic Expectations
✅ **Pros:**
- Quick profits on small moves
- Limited exposure per trade
- Daily loss protection
- Works in ranging markets

❌ **Cons:**
- Requires tight spreads
- Sensitive to slippage
- Limited trades per day
- Needs active monitoring

## Version History
- **v2.0:** Realistic M5 scalping, removed tick logic, better risk management
- **v1.0:** Initial HFT concept (unrealistic for retail)
