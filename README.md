# 🚀 Mini Blockchain Simulator (Haskell)

A modular blockchain ledger simulator written in Haskell using Cabal and Nix.

This project demonstrates:

- Block creation
- Hash linking
- Transaction validation
- Ledger state transitions
- Multi-block chain growth
- Full chain validation
- Tamper detection logic

---

# 📦 Architecture Overview

The system is modular and divided into:

src/
- Types.hs        → Transaction & Money types
- Ledger.hs       → Ledger logic & transaction application
- Blockchain.hs   → Block structure, hashing & validation

app/
- Main.hs         → Simulation engine

---

# 🔗 Core Features

## 1️⃣ Block Structure

Each block contains:

- Index
- Previous hash
- Transactions
- Computed hash

Blocks are cryptographically linked using deterministic hashing.

---

## 2️⃣ Ledger State Machine

Transactions are processed sequentially.

Rules enforced:
- No negative balances
- No invalid transfers
- Deterministic state transitions

---

## 3️⃣ Multi-Block Simulation

The simulator creates multiple linked blocks automatically:

Block 0 → Block 1 → Block 2

Each block updates the ledger state.

---

## 4️⃣ Chain Validation

The system validates:

- Correct previous hash linking
- Correct hash recomputation
- Block integrity
- 
Output confirms:


Chain Valid?
True


---

# 🖥️ Build & Run

Inside the Nix development shell:

# 📸 Screenshots

## 🛠️ Build Process

<img width="1920" height="1020" alt="blockchain hs" src="https://github.com/user-attachments/assets/4b029c10-e4ce-431b-aead-3a823cd57a81" />

---

## 🚀 Running the Simulator

<img width="1920" height="1020" alt="main hs" src="https://github.com/user-attachments/assets/2c931b7c-d057-4734-a8b2-05f2dda7a631" />

---

## 📦 Full Blockchain Output

<img width="1920" height="1020" alt="blockchain output" src="https://github.com/user-attachments/assets/1471c777-d314-4e07-b02f-85bc41f6655e" />


---

# 🔍 Validation Output

Chain Valid?
True

---

# 🧠 Concepts Demonstrated

- Functional state transitions
- Algebraic data types
- Deterministic hashing
- Immutable blockchain modeling
- Error handling with Either
- Modular architecture design

---

# 🧰 Technologies Used

- Haskell
- Cabal
- Nix
- GHC 9.6.7
- WSL2 Ubuntu

---

# 👤 Author

Katlego

---

# 📜 License

MIT
