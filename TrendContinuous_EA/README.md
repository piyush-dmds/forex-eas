# TrendBuySellContinuous EA

Complete MT5 Expert Advisor for continuous trend-following with grid averaging, step martingale, basket TP, and trailing.

## Features

- **Selectable Trend Indicator**: Choose between Supertrend or EMA 200
- **Continuous Trading**: Keeps opening trades in trend direction
- **Grid Averaging**: Opens trades every 4 pips (max 30 trades)
- **Step Martingale**: Gradual lot increase (arithmetic, Fibonacci, or fixed)
- **Basket TP**: Closes all trades at 5-10 pips profit
- **Dynamic Trailing**: Locks profits at 5 and 8 pip levels
- **Trend Flip Protection**: Closes all trades when trend reverses
- **Risk Management**: Drawdown protection, equity loss limit, spread filter

## Installation

### Required Files

1. **TrendBuySellContinuous_EA.mq5** - Main EA file
2. **Supertrend.mq5** - Custom indicator (if using Supertrend mode)

### Complete Installation Steps

#### Step 1: Locate MT5 Data Folder
1. Open MetaTrader 5
2. Click **File** → **Open Data Folder**
3. Navigate to `MQL5` folder

#### Step 2: Copy Files
1. Copy `TrendBuySellContinuous_EA.mq5` to `MQL5/Experts/` folder
2. **If using Supertrend mode**: Copy `Supertrend.mq5` from `SupertrendGrid_EA` folder to `MQL5/Indicators/` folder
3. **If using EMA 200 mode**: No indicator needed (EMA is built-in)

#### Step 3: Compile Files
1. Open MetaEditor (press F11 in MT5)
2. Navigate to **Experts** → `TrendBuySellContinuous_EA.mq5`
3. Press **F7** to compile
4. Check for "0 errors" in Errors tab
5. If using Supertrend: Compile `Supertrend.mq5` in Indicators folder

#### Step 4: Restart MT5
Close and reopen MetaTrader 5 to refresh the file list

#### Step 5: Attach EA to Chart

**Recommended Chart Setup:**

| Pair | Timeframe | TrendIndicator | Best Hours (GMT) |
|------|-----------|----------------|------------------|
| EURUSD | M15 | TREND_EMA200 | 08:00-17:00 |
| EURUSD | M30 | TREND_SUPERTREND | 08:00-17:00 |
| GBPUSD | M15 | TREND_SUPERTREND | 08:00-17:00 |
| USDJPY | M30 | TREND_EMA200 | 00:00-09:00 |
| XAUUSD | M15 | TREND_SUPERTREND | 08:00-17:00 |

**How to Attach:**
1. Open your chosen pair chart (e.g., EURUSD)
2. Set timeframe (M15 or M30 recommended)
3. Open **Navigator** (Ctrl+N)
4. Expand **Expert Advisors**
5. Drag `TrendBuySellContinuous_EA` onto chart
6. Configure inputs (see below)
7. Check **"Allow live trading"**
8. Click **OK**

#### Step 6: Verify Installation
- EA name appears in top-right corner of chart
- Smiley face icon shows (green = running, red = error)
- Check **Journal** (Ctrl+Shift+M) for "TrendBuySellContinuous EA initialized successfully"

## Best Trading Hours

### London/New York Session (Recommended)
**Time:** 08:00 - 17:00 GMT
**Pairs:** EURUSD, GBPUSD, EURGBP
**Why:** High liquidity, tight spreads, strong trends

### Asian Session
**Time:** 00:00 - 09:00 GMT
**Pairs:** USDJPY, AUDUSD, NZDUSD
**Why:** Moderate volatility, good for EMA 200 mode

### Avoid Trading
- **News Events:** 1 hour before/after major news
- **Low Liquidity:** 17:00 - 00:00 GMT (except Asian pairs)
- **Weekends:** Friday 22:00 - Sunday 22:00 GMT
- **Holidays:** Christmas, New Year, etc.

## Recommended Chart Configurations

### Configuration 1: EURUSD Scalping (Aggressive)
```
Chart: EURUSD M15
TrendIndicator: TREND_SUPERTREND
SupertrendPeriod: 10
SupertrendMultiplier: 3.0
GridDistance: 3.0
FirstLotSize: 0.01
LotProgression: LOT_ARITHMETIC
LotMultiplier: 1.5
BasketTPMin: 5.0
BasketTPMax: 8.0
MaxSpreadPips: 2.0
Trading Hours: 08:00-17:00 GMT
```

### Configuration 2: EURUSD Swing (Conservative)
```
Chart: EURUSD M30
TrendIndicator: TREND_EMA200
EMA_Period: 200
GridDistance: 5.0
FirstLotSize: 0.01
LotProgression: LOT_FIBONACCI
BasketTPMin: 8.0
BasketTPMax: 12.0
MaxSpreadPips: 2.0
Trading Hours: 08:00-17:00 GMT
```

### Configuration 3: GBPUSD Volatile (Moderate)
```
Chart: GBPUSD M15
TrendIndicator: TREND_SUPERTREND
SupertrendPeriod: 10
SupertrendMultiplier: 3.5
GridDistance: 4.0
FirstLotSize: 0.01
LotProgression: LOT_ARITHMETIC
LotMultiplier: 1.3
BasketTPMin: 6.0
BasketTPMax: 10.0
MaxSpreadPips: 2.5
Trading Hours: 08:00-17:00 GMT
```

### Configuration 4: XAUUSD Gold (Aggressive)
```
Chart: XAUUSD M15
TrendIndicator: TREND_SUPERTREND
SupertrendPeriod: 10
SupertrendMultiplier: 3.0
GridDistance: 0.5 (in dollars)
FirstLotSize: 0.01
LotProgression: LOT_FIBONACCI
BasketTPMin: 5.0
BasketTPMax: 8.0
MaxSpreadPips: 3.0
Trading Hours: 08:00-17:00 GMT
```

### Configuration 5: USDJPY Asian Session
```
Chart: USDJPY M30
TrendIndicator: TREND_EMA200
EMA_Period: 200
GridDistance: 4.0
FirstLotSize: 0.01
LotProgression: LOT_ARITHMETIC
LotMultiplier: 1.4
BasketTPMin: 5.0
BasketTPMax: 9.0
MaxSpreadPips: 2.0
Trading Hours: 00:00-09:00 GMT
```

## Key Parameters

### Trend Detection
| Parameter | Default | Description |
|-----------|---------|-------------|
| TrendIndicator | TREND_SUPERTREND | TREND_SUPERTREND or TREND_EMA200 |
| SupertrendPeriod | 10 | Supertrend period |
| SupertrendMultiplier | 3.0 | ATR multiplier |
| EMA_Period | 200 | EMA period |

### Grid & Lot Management
| Parameter | Default | Description |
|-----------|---------|-------------|
| GridDistance | 4.0 | Pips between trades |
| MaxTradesPerCycle | 30 | Max trades per direction |
| FirstLotSize | 0.01 | Starting lot |
| LotProgression | LOT_ARITHMETIC | Lot increase method |
| LotMultiplier | 1.5 | Progression multiplier |

### Basket TP & Trailing
| Parameter | Default | Description |
|-----------|---------|-------------|
| BasketTPMin | 5.0 | Min profit to close (pips) |
| BasketTPMax | 10.0 | Max profit to close (pips) |
| TrailingLock1Pips | 2.0 | Lock at 5 pips profit |
| TrailingLock2Pips | 5.0 | Lock at 8 pips profit |

### Risk Management
| Parameter | Default | Description |
|-----------|---------|-------------|
| MaxDrawdownPercent | 25.0 | Max drawdown limit |
| MaxEquityLossPercent | 10.0 | Max equity loss |
| MaxSpreadPips | 3.0 | Max spread to trade |

## Strategy Logic

### Supertrend Mode
```
IF Supertrend = UPTREND
  → Continuously open BUY trades every 4 pips
  → Increase lot size with each trade
  → Close all when profit = 5-10 pips

IF Supertrend = DOWNTREND
  → Continuously open SELL trades every 4 pips
  → Increase lot size with each trade
  → Close all when profit = 5-10 pips

IF Trend FLIPS
  → Close all trades immediately
  → Start new cycle in new direction
```

### EMA 200 Mode
```
IF Price > EMA 200
  → Continuously open BUY trades every 4 pips
  → Increase lot size with each trade
  → Close all when profit = 5-10 pips

IF Price < EMA 200
  → Continuously open SELL trades every 4 pips
  → Increase lot size with each trade
  → Close all when profit = 5-10 pips

IF Price crosses EMA 200
  → Close all trades immediately
  → Start new cycle in new direction
```

## Lot Progression Examples

### Arithmetic (Default)
```
Trade 1: 0.01 lot
Trade 2: 0.02 lot (0.01 + 0.01 × 1.5)
Trade 3: 0.03 lot
Trade 4: 0.05 lot
Trade 5: 0.08 lot
Trade 6: 0.13 lot
...
```

### Fibonacci
```
Trade 1: 0.01 lot
Trade 2: 0.01 lot
Trade 3: 0.02 lot
Trade 4: 0.03 lot
Trade 5: 0.05 lot
Trade 6: 0.08 lot
Trade 7: 0.13 lot
...
```

### Fixed
```
All trades: 0.01 lot (no increase)
```

## Basket Trailing Logic

```
Profit < 5 pips
  → No action, continue trading

Profit 5-7 pips
  → Lock 2 pips
  → Close if profit drops to 7 pips

Profit 8-13 pips
  → Lock 5 pips
  → Close if profit drops to 13 pips

Profit > 13 pips
  → Close all trades
```

## Risk Management

### Drawdown Protection
- Monitors peak equity vs current equity
- Stops trading if drawdown > 25%
- Closes all trades immediately

### Equity Loss Protection
- Monitors initial equity vs current equity
- Stops trading if loss > 10%
- Closes all trades immediately

### Spread Filter
- Won't open trades if spread > 3 pips
- Prevents bad entries during low liquidity

### Trade Limit
- Maximum 30 trades per cycle
- Prevents over-leverage

## Recommended Settings

### EURUSD (Supertrend)
```
TrendIndicator = TREND_SUPERTREND
SupertrendPeriod = 10
SupertrendMultiplier = 3.0
GridDistance = 4.0
FirstLotSize = 0.01
LotProgression = LOT_ARITHMETIC
LotMultiplier = 1.5
BasketTPMin = 5.0
BasketTPMax = 8.0
MaxSpreadPips = 2.0
```

### GBPUSD (Supertrend)
```
TrendIndicator = TREND_SUPERTREND
SupertrendPeriod = 10
SupertrendMultiplier = 3.0
GridDistance = 5.0
FirstLotSize = 0.01
LotProgression = LOT_ARITHMETIC
LotMultiplier = 1.3
BasketTPMin = 6.0
BasketTPMax = 10.0
MaxSpreadPips = 2.5
```

### EURUSD (EMA 200)
```
TrendIndicator = TREND_EMA200
EMA_Period = 200
GridDistance = 4.0
FirstLotSize = 0.01
LotProgression = LOT_ARITHMETIC
LotMultiplier = 1.5
BasketTPMin = 5.0
BasketTPMax = 8.0
MaxSpreadPips = 2.0
```

### Scalping (M1/M5)
```
GridDistance = 2.0
MaxTradesPerCycle = 50
BasketTPMin = 3.0
BasketTPMax = 5.0
LotProgression = LOT_FIXED
```

### Swing Trading (H1/H4)
```
GridDistance = 8.0
MaxTradesPerCycle = 20
BasketTPMin = 8.0
BasketTPMax = 15.0
LotProgression = LOT_FIBONACCI
```

## Comparison: Supertrend vs EMA 200

### Supertrend
**Pros:**
- More responsive to trend changes
- Better for volatile markets
- Adapts to volatility (ATR-based)
- Fewer false signals

**Cons:**
- Requires custom indicator
- More complex calculation
- May flip frequently in choppy markets

**Best For:**
- M15, M30, H1 timeframes
- Volatile pairs (GBPUSD, XAUUSD)
- Scalping and day trading

### EMA 200
**Pros:**
- Simple and reliable
- Built-in indicator
- Smooth trend detection
- Less noise

**Cons:**
- Slower to react to trend changes
- May miss quick reversals
- Lags in fast markets

**Best For:**
- H1, H4, D1 timeframes
- Stable pairs (EURUSD, USDJPY)
- Swing trading

## Troubleshooting

| Issue | Solution |
|-------|----------|
| Not trading | Check trend indicator is loaded, spread < 3 pips |
| Too many losses | Reduce MaxTradesPerCycle, increase GridDistance |
| Not enough trades | Decrease GridDistance, increase MaxTradesPerCycle |
| High drawdown | Reduce FirstLotSize or LotMultiplier |
| Trades close too fast | Increase BasketTPMin |
| Trades don't close | Decrease BasketTPMin |
| Margin calls | Reduce lot sizes or MaxTradesPerCycle |
| Supertrend not working | Verify Supertrend.mq5 is in Indicators folder |
| Trend flips too often | Increase SupertrendMultiplier or use EMA 200 |

## Performance Targets

| Metric | Target |
|--------|--------|
| Win Rate | 55-65% |
| Profit Factor | 1.5-2.5 |
| Max Drawdown | 15-25% |
| Monthly Return | 10-20% |
| Sharpe Ratio | 1.0+ |

## Optimization Tips

### Increase Profits
- Decrease GridDistance (more trades)
- Increase MaxTradesPerCycle
- Use LOT_FIBONACCI progression

### Reduce Drawdown
- Reduce FirstLotSize
- Reduce LotMultiplier
- Increase GridDistance
- Use LOT_FIXED progression

### Improve Win Rate
- Increase SupertrendMultiplier (fewer signals)
- Use EMA 200 (smoother trends)
- Increase MaxSpreadPips threshold

### Faster Exits
- Decrease BasketTPMin
- Decrease BasketTPMax
- Increase TrailingLock1Pips

## Backtesting Checklist

- [ ] Test 6+ months of data
- [ ] Test both Supertrend and EMA 200 modes
- [ ] Test multiple pairs
- [ ] Test different timeframes
- [ ] Check profit factor > 1.5
- [ ] Check max drawdown < 25%
- [ ] Review win rate
- [ ] Check recovery factor > 2.0

## Live Trading Checklist

- [ ] Demo trading 2+ weeks
- [ ] Backtest completed successfully
- [ ] Risk management understood
- [ ] Lot sizes appropriate for account
- [ ] Margin requirements met
- [ ] Spread filter set correctly
- [ ] PrintDebug enabled initially
- [ ] Supertrend indicator installed (if using)

## Important Notes

### Continuous Trading
This EA continuously opens trades in the trend direction. Unlike traditional grid EAs that wait for retracements, this EA:
- Opens trades every 4 pips regardless of profit/loss
- Keeps adding trades as long as trend continues
- Averages down in losing positions
- Closes all trades together at basket TP

### Trend Flip Protection
When trend reverses:
- All trades are closed immediately
- New cycle starts in new direction
- Prevents holding losing trades against trend

### Risk Warning
⚠️ **Important:**
- Grid + martingale = high risk
- Requires sufficient margin
- Can lead to large drawdowns
- Test thoroughly on demo first
- Never risk more than you can afford to lose

## Support & Resources

### Documentation
- This README - Complete guide
- Journal (Ctrl+Shift+M) - Error messages
- Strategy Tester (Ctrl+R) - Backtesting

### Indicator Files
- Supertrend.mq5 - Available in GridMartingale_EA folder
- Copy to MQL5/Indicators/ before use

### Troubleshooting Steps
1. Check Journal for error messages
2. Verify indicator is loaded on chart
3. Check spread is within limits
4. Verify sufficient margin
5. Test on demo account first

## Disclaimer

Trading forex involves substantial risk of loss. Past performance does not guarantee future results. This EA uses grid and martingale strategies which can result in significant drawdowns. Always use proper risk management and never risk more than you can afford to lose.

**Test thoroughly on a demo account before using on a live account.**

---

**Version**: 1.0  
**Compatibility**: MT5 Build 3000+  
**Status**: Production Ready
