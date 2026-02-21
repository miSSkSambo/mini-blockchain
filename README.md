# 🚀 Mini Blockchain Simulator (Haskell)

![Haskell](https://img.shields.io/badge/Language-Haskell-purple)
![Build](https://img.shields.io/badge/Build-Cabal-blue)
![Nix](https://img.shields.io/badge/Environment-Nix-green)
![License](https://img.shields.io/badge/License-MIT-brightgreen)
![Status](https://img.shields.io/badge/Project-Active-success)

A modular blockchain ledger simulator written in Haskell using Cabal and Nix.

This project demonstrates functional state transitions, block hashing, ledger validation, multi-block growth, and proof-of-work simulation within a clean modular architecture.

---
# 📑 Table of Contents

- [📖 Project Overview](#-project-overview)
- [🏗️ Architecture Overview](#️-architecture-overview)
- [🔗 Core Features](#-core-features)
  - [1️⃣ Block Structure](#1️⃣-block-structure)
  - [2️⃣ Ledger State Machine](#2️⃣-ledger-state-machine)
  - [3️⃣ Multi-Block Simulation](#3️⃣-multi-block-simulation)
  - [4️⃣ Chain Validation](#4️⃣-chain-validation)
  - [⛏️ Proof-of-Work Mining](#⛏️-proof-of-work-mining)
- [🖥️ Setup & Installation Guide](#️-setup--installation-guide-windows--wsl2--nix)
- [🔨 Build & Run](#-build--run)
- [📸 Screenshots](#-screenshots)
- [🔍 Validation Output](#-validation-output)
- [🧠 Concepts Demonstrated](#-concepts-demonstrated)
- [🧰 Technologies Used](#-technologies-used)
- [🚀 Future Improvements](#-future-improvements)
- [👤 Author](#-author)
- [📜 License](#-license)

  
# 📖 Project Overview

This simulator models a simplified blockchain system with:

- Block creation and hash linking
- Deterministic transaction validation
- Ledger state transitions
- Multi-block chain growth
- Full chain integrity validation
- Basic Proof-of-Work mining
- Tamper detection logic

The architecture emphasizes immutability, deterministic computation, and modular design principles.

---

# 🏗️ Architecture Overview

The system is modular and divided into:

```
mini-blockchain/
├── src/
│   ├── Types.hs        → Core types (Money, Transactions)
│   ├── Ledger.hs       → Ledger state transition logic
│   ├── Blockchain.hs   → Block structure, hashing, validation, mining
├── app/
│   └── Main.hs         → Simulation engine
├── test/               → Test suite
├── mini-blockchain.cabal
```

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
- Double-spend prevention

---

## 3️⃣ Multi-Block Simulation

The simulator automatically generates multiple linked blocks:

```
Block 0 → Block 1 → Block 2
```

Each block updates the global ledger state.

---

## 4️⃣ Chain Validation

The system validates:

- Correct previous hash linking
- Correct hash recomputation
- Block integrity
- Tamper resistance

Example output:

```
Chain Valid?
True
```

---

## ⛏️ Proof-of-Work Mining

The simulator includes a simplified Proof-of-Work mechanism.

Each block must satisfy a difficulty condition requiring a specific number of leading zeros in its hash.

This simulates computational mining and prevents trivial block tampering.

---

# 🖥️ Setup & Installation Guide (Windows + WSL2 + Nix)

This project runs inside **Ubuntu (WSL2)**.

---

## 🪟 1. Install WSL2

Open PowerShell as Administrator:

```powershell
wsl --install
```

Restart your computer.

Verify:

```powershell
wsl -l -v
```

Ensure Version 2 is enabled.

---

## 🐧 2. Install Ubuntu 22.04

If not installed:

```powershell
wsl --install -d Ubuntu-22.04
```

Create your Linux username and password.

---

## 📦 3. Install Development Tools

Inside Ubuntu:

```bash
sudo apt update
sudo apt upgrade -y
sudo apt install curl git build-essential -y
```

---

## 🧊 4. Install Nix

```bash
sh <(curl -L https://nixos.org/nix/install) --daemon
```

Restart terminal.

Verify:

```bash
nix --version
```

---

## ⚙️ 5. Enable Flakes

```bash
mkdir -p ~/.config/nix
nano ~/.config/nix/nix.conf
```

Add:

```
experimental-features = nix-command flakes
```

Reload:

```bash
. ~/.nix-profile/etc/profile.d/nix.sh
```

---

## 📥 6. Clone Repository

```bash
git clone https://github.com/miSSkSambo/mini-blockchain.git
cd mini-blockchain
```

---

# 🔨 Build & Run

```bash
cabal build
cabal run
```

Expected output:

```
🚀 Advanced Mini Blockchain Simulator

Full Blockchain:
Block { ... }

Final Ledger:
fromList [("Alice",890000),("Bob",550000),("Charlie",60000)]

Chain Valid?
True
```

---

# 📸 Screenshots

## 🛠️ Build Process

<img width="1920" height="1020" alt="build" src="https://github.com/user-attachments/assets/4b029c10-e4ce-431b-aead-3a823cd57a81" />

---

## 🚀 Running the Simulator

<img width="1920" height="1020" alt="run" src="https://github.com/user-attachments/assets/2c931b7c-d057-4734-a8b2-05f2dda7a631" />

---

## 📦 Blockchain Output

<img width="1920" height="1020" alt="output" src="https://github.com/user-attachments/assets/1471c777-d314-4e07-b02f-85bc41f6655e" />

---

# 🔍 Validation Output

```
Chain Valid?
True
```

---

# 🧠 Concepts Demonstrated

- Functional programming paradigms
- Algebraic data types
- Deterministic hashing
- Immutable state modeling
- Error handling using `Either`
- Modular system architecture
- Simplified Proof-of-Work consensus

---

# 🧰 Technologies Used

- Haskell
- Cabal
- Nix
- GHC 9.6.7
- WSL2 Ubuntu

---

# 🚀 Future Improvements

- Full Merkle tree implementation
- Persistent storage
- CLI transaction input
- JSON export
- Peer-to-peer simulation
- Advanced mining difficulty adjustment
- Unit and property testing

---

# 👤 Author

Katlego

---

# 📜 License

MIT
