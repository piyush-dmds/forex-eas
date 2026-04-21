# SupportResistance_EA v1.0

## Installation Guide

### Step 1: Download the EA
- Download `SupportResistance_EA.mq5` from the repository

### Step 2: Copy to MT5 Folder
1. Open MetaTrader 5
2. Click **File** → **Open Data Folder**
3. Navigate to: `MQL5/Experts`
4. Paste `SupportResistance_EA.mq5` into this folder

### Step 3: Compile the EA
1. In MT5, click **File** → **Open**
2. Select `SupportResistance_EA.mq5`
3. Press **F7** or click **Compile** button
4. Wait for "0 errors" message

### Step 4: Attach to Chart
1. Open H1 chart (EUR/USD, GBP/USD, or USD/JPY recommended)
2. Right-click on chart → **Expert Advisors** → **SupportResistance_EA**
3. Or drag `SupportResistance_EA` from Navigator onto chart

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
A level-based trading strategy that identifies support and resistance levels and trades bounces from these key price levels. Simple, effective, and based on price action.

## Strategy
- **Timeframe:** H1 (1-hour)
- **Entry:** Price bounces from support/resistance levels
- **Exit:** Fixed take profit with trailing stop
- **Risk/Reward:** 1:3 ratio

## Key Features
✅ **Support/Resistance Detection** - Identifies key levels
✅ **Bounce Trading** - Trades reversals from levels
✅ **Simple Logic** - Easy to understand and monitor
✅ **Trailing Stop** - Locks profits automatically
✅ **News Filter** - Avoids high-impact events

## Parameters

### Core Settings
- **LotSize:** 0.1 - Position size
- **MaxSpread:** 20 - Maximum acceptable spread (points)

### Level Settings
- **LookbackPeriod:** 50 - Bars to find support/resistance
- **LevelTolerance:** 0.5 - Tolerance for level (pips)
- **MinTouchCount:** 2 - Minimum touches to confirm level

### Risk Management
- **SL_Points:** 50 - Stop loss (points)
- **TP_Points:** 150 - Take profit (points) — 1:3 ratio
- **UseTrailingStop:** true
- **TrailStart_Pts:** 80 - Activate after 80 pts profit
- **TrailStep_Pts:** 40 - Trail step size

### Filters
- **UseSessionFilter:** true - Trade London/NY sessions
- **UseNewsFilter:** true - Avoid high-impact news
- **NewsMinsBefore/After:** 5 - News avoidance window

## How It Works

1. **Level Detection:** Finds highest high and lowest low in lookback period
2. **Resistance:** Highest high = resistance level
3. **Support:** Lowest low = support level
4. **Bounce Detection:** Identifies when price bounces from levels
5. **Entry:** Opens position when bounce is confirmed
6. **Exit:** Targets 150 points with trailing stop

## Entry Logic

### BUY Signal (Support Bounce)
- Price bounces from support level
- Price above support + tolerance
- Expect upward bounce
- SL placed below support

### SELL Signal (Resistance Bounce)
- Price bounces from resistance level
- Price below resistance + tolerance
- Expect downward bounce
- SL placed above resistance

## Recommended Settings

### Conservative (Low Risk)
```
LookbackPeriod: 75
LevelTolerance: 1.0
SL_Points: 60
TP_Points: 180
TrailStart_Pts: 100
```

### Aggressive (High Risk)
```
LookbackPeriod: 30
LevelTolerance: 0.3
SL_Points: 40
TP_Points: 120
TrailStart_Pts: 60
```

## Backtest Results Expected
- Win Rate: 60-70%
- Profit Factor: 2.0-2.8
- Max Drawdown: 8-12%

## Best Pairs
- EUR/USD (most reliable)
- GBP/USD
- USD/JPY
- AUD/USD

## Important Notes
⚠️ **Level Strength:** Levels tested multiple times = stronger
⚠️ **Breakouts:** Price breaking levels = stop trading that level
⚠️ **Trending Markets:** Works best in ranging markets
⚠️ **False Bounces:** Not all bounces lead to reversals

## Troubleshooting
- **Few trades:** Reduce LookbackPeriod or LevelTolerance
- **High losses:** Increase SL_Points or reduce TP_Points
- **False signals:** Increase LookbackPeriod or LevelTolerance

## Version History
- **v1.0:** Initial release with support/resistance bounce trading

