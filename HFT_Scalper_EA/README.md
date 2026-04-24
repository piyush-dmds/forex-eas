# ⚡ HFT Scalper EA - Professional Edition

**Version:** 2.2 | **Strategy:** M5 Scalping | **Timeframe:** M5 | **Last Updated:** April 24, 2026

## 🎯 Strategy Overview

**Type:** M5 Scalping Strategy  
**Best For:** Quick profits in ranging markets  
**Risk Level:** Medium-High  
**Experience:** Intermediate to Advanced  

### Core Concept
Uses Bollinger Bands extremes combined with Stochastic oscillator to identify short-term overbought/oversold conditions for quick scalping profits.

## 📊 Complete Strategy Breakdown

### Entry Conditions

#### BUY Signal (Long Entry)
1. **Price Position:** Price ≤ Lower Bollinger Band + 8 points (oversold zone)
2. **Stochastic:** Main line < 20 (oversold condition)
3. **Momentum Shift:** Stochastic main line crosses above signal line
4. **Confirmation:** All conditions must align on M5 timeframe

#### SELL Signal (Short Entry)
1. **Price Position:** Price ≥ Upper Bollinger Band - 8 points (overbought zone)
2. **Stochastic:** Main line > 80 (overbought condition)
3. **Momentum Shift:** Stochastic main line crosses below signal line
4. **Confirmation:** All conditions must align on M5 timeframe

### Exit Strategy

#### Take Profit
- **Target:** 100 points (1:2.5 risk/reward ratio)
- **Logic:** Captures typical M5 reversion moves
- **Trailing:** Activates after 50 points profit

#### Stop Loss
- **Distance:** 40 points
- **Logic:** Tight stop for scalping approach
- **Protection:** Hard stop to limit losses

## 🕐 Optimal Trading Sessions

### Primary Sessions (Recommended)
| Session | Time (GMT) | Pairs | Why Optimal |
|---------|------------|-------|-------------|
| **London** | 07:00-16:00 | EUR/USD, GBP/USD | High liquidity, tight spreads |
| **New York** | 13:00-21:00 | USD/JPY, EUR/USD | Active US market |
| **Overlap** | 13:00-16:00 | All majors | **BEST** - Maximum liquidity |

### Avoid Trading
- **Asian Session:** 22:00-07:00 GMT (low volatility)
- **Friday Close:** After 20:00 GMT (weekend gap risk)
- **News Events:** 5 minutes before/after high-impact news
- **Low Liquidity:** Bank holidays, Christmas/New Year

## 💰 Risk Management Strategy

### Position Sizing
```
Conservative: 0.01-0.05 lots per $1000
Moderate:     0.05-0.10 lots per $1000
Aggressive:   0.10-0.20 lots per $1000
```

### Daily Limits
- **Max Trades/Hour:** 8 (prevents overtrading)
- **Daily Loss Limit:** 2% of account (EA stops trading)
- **Max Concurrent:** 1 trade at a time
- **Weekend Protection:** No trades after Friday 20:00

### Account Requirements
- **Minimum:** $500 (for 0.01 lots)
- **Recommended:** $2000+ (for proper risk management)
- **Spread:** <15 points (essential for scalping)
- **Execution:** <50ms (fast broker required)

## 📈 Performance Expectations

### Realistic Targets
| Timeframe | Trades | Win Rate | Profit | Drawdown |
|-----------|--------|----------|--------|----------|
| **Daily** | 5-15 | 55-65% | 50-200 pips | 2-5% |
| **Weekly** | 25-75 | 55-65% | 200-800 pips | 5-10% |
| **Monthly** | 100-300 | 55-65% | 800-3000 pips | 8-15% |

### Key Metrics
- **Average Trade:** 5-15 minutes
- **Profit Factor:** 1.5-2.0
- **Sharpe Ratio:** 1.2-1.8
- **Maximum Drawdown:** 10-15%

## ⚙️ Parameter Optimization

### Conservative Setup (Lower Risk)
```
BollingerPeriod: 25
BollingerDev: 2.5
StochK: 8
StochD: 5
SL_Points: 50
TP_Points: 125
MaxTradesPerHour: 5
MaxDailyLossPct: 1.5
```

### Standard Setup (Balanced)
```
BollingerPeriod: 20
BollingerDev: 2.0
StochK: 5
StochD: 3
SL_Points: 40
TP_Points: 100
MaxTradesPerHour: 8
MaxDailyLossPct: 2.0
```

### Aggressive Setup (Higher Risk)
```
BollingerPeriod: 15
BollingerDev: 1.5
StochK: 3
StochD: 2
SL_Points: 30
TP_Points: 75
MaxTradesPerHour: 12
MaxDailyLossPct: 3.0
```

## 🎯 Best Currency Pairs

### Tier 1 (Recommended)
| Pair | Spread | Volatility | Session |
|------|--------|------------|---------|
| **EUR/USD** | 1-3 pips | Medium | London/NY |
| **GBP/USD** | 2-5 pips | High | London/NY |
| **USD/JPY** | 1-3 pips | Medium | Asian/NY |

### Tier 2 (Alternative)
| Pair | Spread | Volatility | Session |
|------|--------|------------|---------|
| **AUD/USD** | 2-4 pips | Medium | Asian |
| **USD/CHF** | 2-4 pips | Low | London |
| **EUR/GBP** | 2-5 pips | Medium | London |

### Avoid
- **Exotic Pairs:** High spreads kill scalping profits
- **Low Liquidity:** CAD, NZD during off-hours
- **High Spread Times:** Market open/close

## 🔧 Installation & Setup Guide

### Step 1: Download & Install
1. Download `HFT_Scalper_EA.mq5`
2. Copy to `MT5/MQL5/Experts/` folder
3. Compile with F7 (check for 0 errors)
4. Restart MT5

### Step 2: Chart Setup
1. Open **M5 chart** (essential - not M1 or H1)
2. Choose **EUR/USD** or **GBP/USD**
3. Attach EA to chart
4. Configure parameters (see settings above)
5. Enable **AutoTrading** (green button)

### Step 3: Verification
- ✅ EA name appears in chart corner
- ✅ Smiley face is green (not red)
- ✅ Journal shows "EA initialized successfully"
- ✅ AutoTrading is enabled

### Step 4: Monitoring
- Watch first few trades closely
- Monitor daily P&L
- Check spread conditions
- Verify trade frequency

## 📊 Market Conditions Analysis

### Ideal Conditions ✅
- **Trending but choppy markets**
- **Normal volatility (not extreme)**
- **Tight spreads (<10 points)**
- **Active trading sessions**
- **No major news events**

### Avoid Trading ❌
- **Strong trending markets** (price won't revert)
- **Extremely low volatility** (no movement)
- **Wide spreads** (>15 points)
- **Major news events** (unpredictable moves)
- **Market gaps** (weekend opens)

## 🚨 Common Mistakes & Solutions

### Mistake 1: Wrong Timeframe
❌ **Problem:** Using M1 or H1 instead of M5  
✅ **Solution:** Always use M5 timeframe

### Mistake 2: High Spread Brokers
❌ **Problem:** Spreads >15 points kill profits  
✅ **Solution:** Switch to ECN/low-spread broker

### Mistake 3: Overtrading
❌ **Problem:** Ignoring MaxTradesPerHour limit  
✅ **Solution:** Respect EA's built-in limits

### Mistake 4: Wrong Sessions
❌ **Problem:** Trading during Asian low-volatility  
✅ **Solution:** Focus on London/NY sessions

### Mistake 5: Ignoring News
❌ **Problem:** Trading through major news  
✅ **Solution:** Enable news filter, check calendar

## 📈 Advanced Optimization Tips

### Spread Optimization
```
EUR/USD: MaxSpread = 10
GBP/USD: MaxSpread = 15  
USD/JPY: MaxSpread = 12
```

### Volatility Adjustment
```
High Vol Period: Increase SL_Points to 50
Low Vol Period:  Decrease TP_Points to 75
Normal Vol:      Standard settings (40/100)
```

### Session-Specific Settings
```
London Session:   Standard settings
NY Session:       Increase TP_Points to 120
Overlap Session:  Decrease SL_Points to 35
```

## 🎯 Troubleshooting Guide

| Problem | Cause | Solution |
|---------|-------|----------|
| **No trades opening** | Wrong timeframe/spread too high | Use M5, check spread <15 |
| **Too many losses** | Wrong market conditions | Avoid strong trends |
| **EA stops trading** | Daily loss limit hit | Reduce lot size |
| **Trades close too fast** | Spread eating profits | Lower spread broker |
| **No profit** | Overtrading/wrong pairs | Stick to EUR/USD, GBP/USD |

## 📚 Educational Resources

### Understanding Bollinger Bands
- **Upper Band:** Price resistance level
- **Lower Band:** Price support level  
- **Middle Band:** 20-period moving average
- **Squeeze:** Low volatility (bands narrow)
- **Expansion:** High volatility (bands widen)

### Understanding Stochastic
- **%K Line:** Fast stochastic (main line)
- **%D Line:** Slow stochastic (signal line)
- **Overbought:** >80 (expect price drop)
- **Oversold:** <20 (expect price rise)
- **Crossover:** Signal line crosses = momentum shift

### Scalping Psychology
- **Patience:** Wait for perfect setups
- **Discipline:** Follow rules strictly
- **Speed:** Quick decisions required
- **Stress Management:** Small, frequent trades
- **Profit Taking:** Don't be greedy

## 🏆 Success Metrics

### Daily Targets
- **Trades:** 5-15 per day
- **Win Rate:** >55%
- **Profit:** 50-200 pips
- **Drawdown:** <5%

### Weekly Review
- **Total Trades:** 25-75
- **Profit Factor:** >1.5
- **Max Consecutive Losses:** <5
- **Best Trading Day:** Identify patterns

### Monthly Analysis
- **ROI:** 10-30% (realistic)
- **Sharpe Ratio:** >1.2
- **Max Drawdown:** <15%
- **Consistency:** Positive weeks >75%

---

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

## Version History
- **v2.1:** Comprehensive strategy guide, advanced optimization
- **v2.0:** Realistic M5 scalping, removed tick logic, better risk management
- **v1.0:** Initial HFT concept (unrealistic for retail)
