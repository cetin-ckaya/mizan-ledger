# Double-Entry Bookkeeping in Mizan

Mizan records every money movement as a journal entry with at least two ledger lines: one **debit (D)** and one **credit (C)**. This document walks through three example transactions and explains the rules the ledger is built on.

## Account types

The ledger is kept **from the bank's point of view**.

| Account type | Example | Increases with | Decreases with | Balance formula |
|---|---|---|---|---|
| **Asset** (what the bank owns) | Cash (bank) | D | C | `SUM(D) - SUM(C)` |
| **Liability** (what the bank owes) | Customer accounts (Ali, Ayşe) | C | D | `SUM(C) - SUM(D)` |

A customer's deposit is money the bank owes to the customer, so customer accounts are liabilities. When money comes into a customer account, the line is a **credit**; when money leaves, it is a **debit**.

Debit and credit are just the names of the two columns of the ledger. They do not mean "bad" and "good".

## Example transactions

### 1. Cash deposit

Ali deposits 1,000 TRY in cash into his current account.

| Account | Direction | Amount |
|---|---|---|
| Cash (bank) | D | 1,000.0000 |
| Ali | C | 1,000.0000 |
| **Total** | **D = 1,000** | **C = 1,000** |

The bank's cash (asset) increased, and the bank now owes Ali 1,000 TRY (liability).

| Account | Balance after entry 1 |
|---|---|
| Ali | 1,000 − 0 = **1,000** |
| Ayşe | **0** |

### 2. Transfer (havale)

Ali transfers 250 TRY to Ayşe.

| Account | Direction | Amount |
|---|---|---|
| Ali | D | 250.0000 |
| Ayşe | C | 250.0000 |
| **Total** | **D = 250** | **C = 250** |

The bank owes Ali less and Ayşe more. The cash account is not involved: no physical money enters or leaves the bank.

| Account | Balance after entry 2 |
|---|---|
| Ali | 1,000 − 250 = **750** |
| Ayşe | 250 − 0 = **250** |

### 3. Reversal of entry 2

Entry 2 turns out to be a mistake. It is **not deleted or updated**. A new entry with the opposite directions is recorded, and its `reverses_entry` field points to entry 2.

| Account | Direction | Amount |
|---|---|---|
| Ali | C | 250.0000 |
| Ayşe | D | 250.0000 |
| **Total** | **D = 250** | **C = 250** |

| Account | Balance after entry 3 |
|---|---|
| Ali | (1,000 + 250) − 250 = **1,000** |
| Ayşe | 250 − 250 = **0** |

Both balances are back to their state after entry 1. The ledger now contains 3 entries and 6 lines, and the full history is visible: 250 TRY left Ali's account and came back.

### Trial balance (mizan)

| | D | C |
|---|---|---|
| All lines | 1,000 + 250 + 250 = 1,500 | 1,000 + 250 + 250 = 1,500 |

`SUM(D) = SUM(C)`. The bank's assets (cash: 1,000) equal its liabilities (Ali: 1,000 + Ayşe: 0).

## Design questions

### Why is there no balance column in the ACCOUNT table?

If the balance were stored, it would exist in two places: the balance column and the sum of the ledger lines. A single bug that writes the lines but does not update the column (or the other way around) makes the two disagree, and then there is no way to know which one is correct. Without a balance column this conflict cannot happen: the ledger lines are the only source of truth and the balance is derived from them (`SUM(C) - SUM(D)` for a customer account). The cost is that the balance must be computed on every read; this is addressed with indexing and measured in a later phase.

### Why must the lines of an entry sum to zero?

Every amount that enters one account must leave another, so money can never be created or lost inside the ledger. It also makes errors detectable: a single query, `SUM(D) - SUM(C)` over the whole ledger, must return zero. Any other result proves that something is wrong.

### Why is a wrong entry reversed instead of deleted?

The ledger is an audit trail. Anyone looking at the history, the customer or an auditor, must be able to see that a transaction happened, was found to be wrong and was cancelled. A deleted record also removes the information that something was there, and it may already have been reported elsewhere (statements, reports). For the same reason ledger lines are never updated; the database will enforce this with a trigger.
