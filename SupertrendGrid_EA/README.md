# 🌊 Supertrend Grid EA - Professional Edition

**Version:** 1.1 | **Strategy:** Supertrend Grid | **Timeframe:** M15-H1 | **Last Updated:** April 24, 2026

Professional MT5 Expert Advisor combining Supertrend + ADX trend filter with grid trading and step martingale lot progression.

## Features

- **Trend Detection**: Supertrend (Period=10, Multiplier=3.0) + ADX filter (>25)
- **Grid Trading**: Opens trades every 4 pips in same direction (max 30 trades)
- **Step Martingale**: Gradual lot increase (arithmetic, Fibonacci, or fixed)
- **Basket TP/SL**: Closes all trades at 5-10 pips profit
- **Dynamic Trailing**: Locks profits at 5 and 8 pip levels
- **Risk Management**: Drawdown protection (25%), equity loss limit (10%), spread filter

## Installation

### Required Files

1. **GridMartingale_EA.mq5** - Main EA file
2. **Supertrend.mq5** - Custom indicator (required)

### Complete Installation Steps

#### Step 1: Locate MT5 Data Folder
1. Open MetaTrader 5
2. Click **File** → **Open Data Folder**
3. Navigate to `MQL5` folder

#### Step 2: Copy Files
1. Copy `GridMartingale_EA.mq5` to `MQL5/Experts/` folder
2. Copy `Supertrend.mq5` to `MQL5/Indicators/` folder

#### Step 3: Compile Files
1. Open MetaEditor (press F11 in MT5)
2. Navigate to **Indicators** → `Supertrend.mq5`
3. Press **F7** to compile
4. Navigate to **Experts** → `GridMartingale_EA.mq5`
5. Press **F7** to compile
6. Check for "0 errors" in Errors tab

#### Step 4: Restart MT5
Close and reopen MetaTrader 5 to refresh the file list

#### Step 5: Attach EA to Chart

**Recommended Chart Setup:**

| Pair | Timeframe | Best Hours (GMT) | ADXThreshold |
|------|-----------|------------------|--------------|
| EURUSD | M15 | 08:00-17:00 | 25.0 |
| EURUSD | M30 | 08:00-17:00 | 25.0 |
| GBPUSD | M15 | 08:00-17:00 | 25.0 |
| USDJPY | M30 | 00:00-09:00 | 25.0 |
| XAUUSD | M15 | 08:00-17:00 | 30.0 |

**How to Attach:**
1. Open your chosen pair chart (e.g., EURUSD)
2. Set timeframe (M15 or M30 recommended)
3. Open **Navigator** (Ctrl+N)
4. Expand **Expert Advisors**
5. Drag `GridMartingale_EA` onto chart
6. Configure inputs (see below)
7. Check **"Allow live trading"**
8. Click **OK**

#### Step 6: Verify Installation
- EA name appears in top-right corner of chart
- Smiley face icon shows (green = running, red = error)
- Supertrend indicator appears on chart
- Check **Journal** (Ctrl+Shift+M) for "GridMartingale EA initialized successfully"

## Best Trading Hours

### London/New York Session (Recommended)
**Time:** 08:00 - 17:00 GMT
**Pairs:** EURUSD, GBPUSD, EURGBP
**Why:** High liquidity, tight spreads, strong trends, ADX > 25 more frequent

### Asian Session
**Time:** 00:00 - 09:00 GMT
**Pairs:** USDJPY, AUDUSD, NZDUSD
**Why:** Moderate volatility, good for conservative settings

### Avoid Trading
- **News Events:** 1 hour before/after major news (NFP, FOMC, ECB)
- **Low Liquidity:** 17:00 - 00:00 GMT (except Asian pairs)
- **Weekends:** Friday 22:00 - Sunday 22:00 GMT
- **Holidays:** Christmas, New Year, etc.

## Recommended Chart Configurations

### Configuration 1: EURUSD Scalping (Aggressive)
```
Chart: EURUSD M15
SupertrendPeriod: 10
SupertrendMultiplier: 3.0
ADXThreshold: 25.0
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
SupertrendPeriod: 10
SupertrendMultiplier: 3.5
ADXThreshold: 30.0
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
SupertrendPeriod: 10
SupertrendMultiplier: 3.0
ADXThreshold: 25.0
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
SupertrendPeriod: 10
SupertrendMultiplier: 3.0
ADXThreshold: 30.0
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
SupertrendPeriod: 10
SupertrendMultiplier: 3.0
ADXThreshold: 25.0
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

| Parameter | Default | Description |
|-----------|---------|-------------|
| 🌊 Supertrend Grid EA - Professional Edition |
| **Version:** 1.1 | **Strategy:** Supertrend Grid | **Timeframe:** M15-H1 | **Last Updated:** April 24, 2026 | Supertrend period |
| SupertrendMultiplier | 3.0 | ATR multiplier |
| ADXThreshold | 25.0 | Min trend strength |
| GridDistance | 4.0 | Pips between trades |
| MaxTradesPerCycle | 30 | Max trades per direction |
| FirstLotSize | 0.01 | Starting lot |
| LotProgression | ARITHMETIC | Lot increase method |
| LotMultiplier | 1.5 | Progression multiplier |
| BasketTPMin | 5.0 | Min profit to close (pips) |
| BasketTPMax | 10.0 | Max profit to close (pips) |
| MaxDrawdownPercent | 25.0 | Max drawdown limit |
| MaxSpreadPips | 3.0 | Max spread to trade |

## Strategy Logic

```
IF Supertrend = BUY AND ADX > 25
  → Open BUY trades every 4 pips
  → Increase lot size with each trade
  → Close all when profit = 5-10 pips

IF Supertrend = SELL AND ADX > 25
  → Open SELL trades every 4 pips
  → Increase lot size with each trade
  → Close all when profit = 5-10 pips
```

## Lot Progression

**Arithmetic** (default): 0.01 → 0.02 → 0.03 → 0.05 → 0.08...  
**Fibonacci**: 0.01 → 0.01 → 0.02 → 0.03 → 0.05 → 0.08...  
**Fixed**: All trades 0.01 lot

## Basket Trailing

- Profit ≥ 5 pips: Lock 2 pips (close at 7 pips)
- Profit ≥ 8 pips: Lock 5 pips (close at 13 pips)

## Risk Management

- Stops trading if drawdown > 25%
- Closes all trades if equity loss > 10%
- Won't trade if spread > 3 pips
- Max 30 trades per cycle

## Recommended Settings

**EURUSD**: GridDistance=4.0, BasketTPMin=5.0, BasketTPMax=8.0  
**GBPUSD**: GridDistance=5.0, BasketTPMin=6.0, BasketTPMax=10.0  
**Scalping (M1/M5)**: GridDistance=2.0, BasketTPMin=3.0, LotProgression=FIXED  
**Swing (H1/H4)**: GridDistance=8.0, BasketTPMin=8.0, LotProgression=FIBONACCI

## Troubleshooting

| Issue | Solution |
|-------|----------|
| Not trading | Check ADX > 25, spread < 3 pips |
| Too many losses | Increase ADXThreshold to 30 |
| Not enough trades | Decrease ADXThreshold to 20 |
| High drawdown | Reduce FirstLotSize or LotMultiplier |
| Trades close too fast | Increase BasketTPMin |
| Margin calls | Reduce lot sizes or MaxTradesPerCycle |

## Performance Targets

- Win Rate: 55-65%
- Profit Factor: 1.5-2.5
- Max Drawdown: 15-25%
- Monthly Return: 10-20%

## Disclaimer

Trading forex involves substantial risk. Past performance does not guarantee future results. Test thoroughly on demo before live trading. Never risk more than you can afford to lose.

---

**Version**: 1.0 | **Compatibility**: MT5 Build 3000+
